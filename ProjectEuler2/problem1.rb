######### PROBLEM 1:
# ### Multiples of 3 and 5 ###
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

########## SOLUTION:

def sum_of_multiples_of_3_and_5_below(number)
  sum = 0
  for num in (1...number)
    sum += num if num % 3 == 0 || num % 5 == 0
  end
  p sum
end



###################################################################

# DRIVER TESTS:

p sum_of_multiples_of_3_and_5_below(10) == 23
sum_of_multiples_of_3_and_5_below(1000)
