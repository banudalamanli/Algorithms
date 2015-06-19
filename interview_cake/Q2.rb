############################### PROBLEM:
# You have an array of integers, and for each index you want to find the product of every integer except the integer at that index.
# Write a function get_products_of_all_ints_except_at_index() that takes an array of integers and returns an array of the products.

############ Solution 1: Brute Force - O(n^2)

def get_products_of_all_ints_except_at_index_brute(arr)
  result = []
  arr.each_with_index do |el, i|
    arr.delete_at(i)
    product = arr.inject(1) {|product, int| product*int}
    arr.insert(i, el)
    result << product
  end
  result
end

#####################################################################################

############ Solution 2: Greedy approach - O(n) time and O(n)O(n) space. We make two passes through our input array, and the array we build always has the same length as the input array.

# A greedy algorithm iterates through the problem space taking the optimal solution "so far," until it reaches the end.
# The greedy approach is only optimal if the problem has "optimal substructure," which means stitching together optimal solutions to subproblems yields an optimal solution.

### First getting all the products before the int
# products_of_all_ints_before_index = Array.new(arr.length, 1)
# # p products_of_all_ints_before_index
# product_so_far = 1
# arr.each_with_index do |int, i|
#   products_of_all_ints_before_index[i] = product_so_far
#   product_so_far *= int
# end
# # p products_of_all_ints_before_index

### Then getting all the products after the int
# products_of_all_ints_after_index = Array.new(arr.length, 1)
# product_so_far_after_index = 1
# i = arr.length-1
# while i > 0
#   products_of_all_ints_after_index[i] = product_so_far_after_index
#   product_so_far_after_index *= int
#   i -= 1
# end

### We have 2 arrays from above, combining them into one array by multiplying the first array with the products we got them from the second calculation.
def get_products_of_all_ints_except_at_index(arr)
  result = Array.new(arr.length, 1)

  product_so_far_before_index = 1
  arr.each_with_index do |int, i|
    result[i] = product_so_far_before_index
    product_so_far_before_index *= int
  end

  product_so_far_after_index = 1
  i = arr.length-1
  while i >= 0
    result[i] *= product_so_far_after_index
    product_so_far_after_index *= arr[i]
    i -= 1
  end
  result
end

#####################################################################################

############ Solution 3 - with division

def get_products_of_all_ints_except_at_index_with_div(arr)
  result = Array.new(arr.length, 0)

  if arr.include? 0
    index_of_0 = arr.find_index(0)
  else
    product = arr.inject(1) {|product, int| product*int}
    arr.each_with_index do |int, i|
      result[i] = product / int
    end
  end
  p result
end

def get_products_of_all_ints_except_at_index_with_div(arr)
  result = []

  if arr.include? 0
    product = arr.inject(1) { |product, int| (int == 0) ? product*1 : product*int }
    arr.each_with_index { |int, i| (int == 0) ? result[i] = product : result[i] = 0 }
  else
    product = arr.inject(1) {|product, int| product*int}
    arr.each_with_index { |int, i| result[i] = product / int }
  end
  p result
end


####################################################################################

arr1 = [1, 7, 3, 4]
arr2 = [0, 1, 7, 3, 4]
arr3 = [1, 2, 6, 5, 9]
arr4 = [1, 0, 6, 5, 0]

# DRIVER TESTS
p get_products_of_all_ints_except_at_index_with_div(arr1) == [84, 12, 28, 21]
p get_products_of_all_ints_except_at_index_with_div(arr2) == [84, 0, 0, 0, 0]
p get_products_of_all_ints_except_at_index_with_div(arr3) == [540, 270, 90, 108, 60]
p get_products_of_all_ints_except_at_index_with_div(arr4) == [0, 30, 0, 0, 30]



###################################################################################

def benchmark
  start = Time.now
  yield
  p Time.now - start
end

# test1 = Array.new(100) { rand(1..100) }
# test2 = Array.new(1000) { rand(1..100) }

# benchmark { get_products_of_all_ints_except_at_index(test1.dup) }
# benchmark { get_products_of_all_ints_except_at_index_brute(test1) }
# p "-" * 30
# benchmark { get_products_of_all_ints_except_at_index(test2.dup) }
# benchmark { get_products_of_all_ints_except_at_index_brute(test2) }
# p "-" * 30
