class Braces

  def match_em (str)
  
    open_pcount = 0
    closed_pcount = 0
    open_bcount = 0
    closed_bcount = 0

    ptotal = 0
    btotal = 0
    
    state = 0

    str.each_char do |c|
      if c == '('
        open_pcount += 1 
        state = 0
      elsif c == ')'
        closed_pcount += 1 
        state = 1
      elsif c == '{'
        open_bcount += 1 if c == '{'
        state = 1
      elsif c == '}'
        closed_bcount += 1 
        return false if state == 0
        state = 0
      end
            
      ptotal = open_pcount - closed_pcount
      btotal = open_bcount - closed_bcount
    
      return false if (ptotal < 0 or btotal < 0)
      
    end
    ptotal == 0 && btotal == 0
  end
end