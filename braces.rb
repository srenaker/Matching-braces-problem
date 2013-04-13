class Braces

  def matchem (str)
  
    open_pcount = 0
    closed_pcount = 0
    open_bcount = 0
    closed_bcount = 0

    ptotal = 0
    btotal = 0
    
    str.each_char do |c|
      open_pcount += 1 if c == '('
      closed_pcount += 1 if c == ')'
      open_bcount += 1 if c == '{'
      closed_bcount += 1 if c == '}'
            
      ptotal = open_pcount - closed_pcount
      btotal = open_bcount - closed_bcount
      return false if (ptotal < 0 or btotal < 0)
      
    end
    ptotal == 0 && btotal == 0
  end
end