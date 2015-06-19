############################### PROBLEM:
# Given an array_of_ints, find the highest_product you can get from three of the integers.
# The input array_of_ints will always have at least three integers.

############ Solution 1: O(n log n)
# I sort and take the last 3 integers and multiply them with each other to get the highest product.
# However it won't work with negative numbers.

def highest_product_brute(array_of_ints)
  array_size = array_of_ints.size
  return "Input array has to contain at least 3 integers." if array_size < 3
  highest_three_integers = array_of_ints.sort.slice(array_size-3, 3)
  result = highest_three_integers.inject(:*)
end

#####################################################################################

############ Solution 2: Greedy approach - O(n) time and O(1) additional space
# There are 2 ways to go about it (highest and lowest 2 numbers vs products of those):
# 1. Keep track of the highest_2 and lowest_2 (most negative) numbers. If the current number times some combination of those is higher than the current highest_product_of_3, there's a new highest_product_of_3.
# 2. Keep track of the highest_product_of_2 and lowest_product_of_2 (could be a low negative number). If the current number times one of those is higher than the current highest_product_of_3, there's a new highest_product_of_3.

# Going with the 2nd option and for that have to keep track of:
# highest_product_of_3
# highest_product_of_2
# highest
# lowest_product_of_2
# lowest

def highest_product(array_of_ints)
  array_size = array_of_ints.size
  return "Input array has to contain at least 3 integers." if array_size < 3

  min_and_max = array_of_ints.slice(0, 2).minmax

  highest               = min_and_max[1]
  lowest                = min_and_max[0]
  highest_product_of_2  = highest * lowest
  lowest_product_of_2   = highest * lowest
  highest_product_of_3  = array_of_ints.slice(0, 3).inject(:*)

  i = 2

  while i < array_size
    current = array_of_ints[i]
    possible_highest = current*highest
    possible_lowest  = current*lowest

    highest_product_of_3 = [highest_product_of_3, current*highest_product_of_2, current*lowest_product_of_2].max
    highest_product_of_2 = [highest_product_of_2, possible_highest, possible_lowest].max
    lowest_product_of_2  = [lowest_product_of_2, possible_highest, possible_lowest].min
    highest = [current, highest].max
    lowest  = [current, lowest].min

    i += 1
  end

  highest_product_of_3
end

####################################################################################
arr1 = [1, 7, 3, 4]
arr2 = [1, 7, 3, 4, 10]
arr3 = [5, 1, 0, 5, 10]
arr4 = [1, 10, -5, 1, -100]


# DRIVER TESTS
error1 = [1, 3]
p highest_product(error1) == "Input array has to contain at least 3 integers."
p highest_product(arr1) == 84
p highest_product(arr2) == 280
p highest_product(arr3) == 250
p highest_product(arr4) == 5000 # Solution 1 doesn't take into consideration the possible high product of 2 negative numbers


####################################################################################


# Benchmark

def benchmark
  start = Time.now
  yield
  p Time.now - start
end

a = Array.new(10000000) { rand(1..1000000) }
aa = a.dup
b = Array.new(50000000) { rand(1..1000000) }
bb = b.dup

benchmark { highest_product(a) }
benchmark { highest_product_brute(aa) }
p "-" * 20
benchmark { highest_product(b) }
benchmark { highest_product_brute(bb) }





