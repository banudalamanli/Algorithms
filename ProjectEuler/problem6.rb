######### PROBLEM 6:
# Find the difference between the sum of the squares of the first N natural numbers and the square of the sum.

########## SOLUTION:

def solution(num)
  sum_of_squares = 0

  (1..num).each do |number|
    sum_of_squares += number**2
  end

  square_of_sums = (1..num).inject(:+)  ** 2

  p (square_of_sums - sum_of_squares).abs
end

tests = gets.chomp.to_i

tests.times do
  number = gets.chomp.to_i
  solution(number)
end
