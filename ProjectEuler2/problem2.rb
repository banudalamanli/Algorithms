######### PROBLEM 1:
### Even Fibonacci numbers ###
# By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.


########## SOLUTION: O(1) space complexity, less than O(n) time complexity.
def sum_of_even_fibonacci_nums_below(number)
  prev_two_fib = [1, 2]
  sum = 2
  next_fib = 0
  while true
    next_fib = prev_two_fib[0] + prev_two_fib[1]
    break if next_fib >= number
    prev_two_fib[0], prev_two_fib[1] = prev_two_fib[1], next_fib
    sum += next_fib if next_fib % 2 == 0
  end
  p sum
end

# def fibonacci_numbers_summing_up_below(number)
#   first, second, sum = 1, 1, 0
#   while sum < number
#     sum += (first + second) if first % 2 ==0 and second % 2 ==0
#     first, second = first + (2*second), (2*first) + (3*second)
#   end
#   p sum
# end


###################################################################

# DRIVER TESTS:

p sum_of_even_fibonacci_nums_below(34) == 10
p sum_of_even_fibonacci_nums_below(50) == 44
p sum_of_even_fibonacci_nums_below(145) == 188

p sum_of_even_fibonacci_nums_below(4_000_000)
