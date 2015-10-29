######### PROBLEM 1:
# ### Multiples of 3 and 5 ###
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

########## SOLUTION:
require 'bigdecimal'
require 'bigdecimal/util'

def sum_multiples(n, max)
  count = (max - 1) / n
  last  = count * n
  sum = (BigDecimal.new(n + last) / 2.0) * count
  sum.round
end

def solution(max)
  sum  = sum_multiples(3, max)
  sum += sum_multiples(5, max)
  sum -= sum_multiples(15, max)
end


cases = gets.chomp.to_i
cases.times do
  number = gets.chomp.to_i
  puts solution(number)
end

