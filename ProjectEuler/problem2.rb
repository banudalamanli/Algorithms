######### PROBLEM 2:
### Even Fibonacci numbers ###

########## SOLUTION: ############
def solution(number)
  sum = 2
  return 2 if number <= 2

  first_fib_num  = 1
  second_fib_num = 2
  next_fib_num   = 3
  count = 0

  while next_fib_num <= number
    if count == 3
      sum += next_fib_num
      count = 0
    end

    next_fib_num   = first_fib_num + second_fib_num
    first_fib_num  = second_fib_num
    second_fib_num = next_fib_num
    count += 1
  end
  p sum
end

###################################################################

# DRIVER TESTS:

p sum_of_even_fibonacci_nums_below(34) == 10
p sum_of_even_fibonacci_nums_below(50) == 44
p sum_of_even_fibonacci_nums_below(145) == 188

p sum_of_even_fibonacci_nums_below(4_000_000)
