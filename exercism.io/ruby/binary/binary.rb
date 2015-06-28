class Binary

  def initialize(number)
    @number = number
  end

  def to_decimal
    result = 0
    # if there are any characters other than 0 or 1, result is returned
    return result if @number.index(/[^01]/)

    @number.length.times do |i|
      current_digit = @number[-(i+1)]
      result += 2**i if current_digit == "1"
    end
    result
  end

end
