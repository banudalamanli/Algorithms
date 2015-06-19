class Fixnum
  # putting "compounds" in because it reduces the logic's complexity significantly
  @@numerals = [
      [1000, 'M'],
      [900,'CM'],
      [500,'D'],
      [400, 'CD'],
      [100,'C'],
      [90,'XC'],
      [50,'L'],
      [40,'XL'],
      [10,'X'],
      [9,'IX'],
      [5,'V'],
      [4,'IV'],
      [1,'I'],
    ]

  # RECURSIVE SOLUTION
  def to_roman
    roman = ''
    return roman if num == 0

    @@numerals.each do |value, numeral|
      if self >= value
        return numeral + (self - value).to_roman
      end
    end
  end

  # ITERATIVE SOLUTION
  def to_roman
    num = self
    roman = ''
    return roman if num == 0

    @@numerals.each do |value, numeral|
      while num >= value
        roman += numeral
        num -= value
      end
    end
    roman
  end
end
