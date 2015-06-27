class Binary
  def initialize(number)
    @number = number
    @decimal = 0
  end

  def to_decimal
    # if there are any characters other than 0 or 1, @decimal is returned
    return @decimal if @number.index(/[^01]/)

    @number.length.times do |i|
      @decimal += 2**i if @number[-(i+1)] == "1"
    end
    @decimal
  end

end
