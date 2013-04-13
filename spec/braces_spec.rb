
require_relative '../braces'

describe Braces do
  b = Braces.new
  
  it "should have matching parens" do
  	str = "(x = (y +z) ) && (n = 14)"
  	b.matchem(str).should be_true
  end
  
  it "recognizes unmatched parens" do
    str = "( x = (y + z)"
    b.matchem(str).should be_false
  end
  
  it "recognizes balanced but wrong-way parens" do
    str = "(x = )(y +z))("
    b.matchem(str).should be_false
  end
  
  it "should have matching curly braces and parens" do
    str = "({title: 'The Lemonade War'}, {age: 34})"
    b.matchem(str).should be_true
  end
  
  it "rejects mismatched curly braces and parens" do
    str = "({x: (y}))"
    b.matchem(str).should be_false
  end
  
end