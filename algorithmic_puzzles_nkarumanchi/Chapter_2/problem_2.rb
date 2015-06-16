# Given an array check whether the array is in sorted order with recrursion

# SOLUTION

def sorted?(array_of_nums, index = array_of_nums.length)
  # p index
  return true if index == 1
  # p "Checking if former element array_of_nums[index - 2] (#{array_of_nums[index - 2]}) is bigger than the one that comes after array_of_nums[index - 1] (#{array_of_nums[index - 1]})."
  if array_of_nums[index - 1] < array_of_nums[index - 2]
    # p "And it is!! Returning false because it is not sorted."
    return false
  else
    # p "It is not so move on to the next."
    sorted?(array_of_nums, index - 1)
  end
end


p sorted?([1, 2, 3, 4]) == true
p sorted?([1, 2, 4, 3]) == false
