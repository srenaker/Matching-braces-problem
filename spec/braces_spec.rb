
require_relative '../braces'

describe Braces do
  b = Braces.new
  
  describe "Success" do
    
    it "accepts matching parens" do
    	str = "(x = (y + z) ) && (n = 14)"
    	b.match_em(str).should be_true
    end

    it "accepts matching curly braces and parens" do
      str = "({title: 'The Lemonade War'}, {age: 34})"
      b.match_em(str).should be_true
    end
    
  end
  
  describe "Failure" do
    
    it "rejects unmatched parens" do
      str = "( x = (y + z)"
      b.match_em(str).should be_false
    end
  
    it "rejects balanced but wrong-way parens" do
      str = "(x = )(y +z))("
      b.match_em(str).should be_false
    end
  
  
    it "rejects unmatched curly braces" do
      str = "({x: 4}})"
      b.match_em(str).should be_false
    end
  
    it "rejects mis-ordered curly braces and parens" do
      str = "({x: (y}))"
      b.match_em(str).should be_false
    end
  
    it "rejects unbalanced and mis-ordered curly braces and parens" do  
      str = "({'author': 'Whitman')}, ($set: {'title': 'Leaves of Grass' ))"
      b.match_em(str).should be_false
    end

    it "rejects balanced but mis-ordered curly braces and parens" do  
      str = "({'author': 'Whitman'}, ($set: {)'title': 'Leaves of Grass'} ()"
      b.match_em(str).should be_false
    end
  end
  
end