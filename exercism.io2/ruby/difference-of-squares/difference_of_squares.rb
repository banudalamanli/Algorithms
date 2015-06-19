class Squares
  def initialize(num)
    @num = num
  end

  def square_of_sums
    sum = (1..@num).inject(:+)
    sum * sum
  end

  def sum_of_squares
    (1..@num).inject { |sum, int| sum += (int*int) }
  end

  def difference
    square_of_sums - sum_of_squares
  end
end
