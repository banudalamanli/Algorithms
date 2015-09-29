# 1. Implement an algorithm to determine if a string has all unique characters. 

##### SOLUTION: 
# 1.

def unique?(str)
  count_hash = Hash.new(0)
  str.each_char do |char| 
    count_hash[char] += 1
    return false if count_hash[char] == 2
  end
  true
end

p unique?("hello")  == false
p unique?("banana") == false
p unique?("banu")   == true


# 1.1 What if you can not use additional data structures?
def unique_no_data_structures(str)
  !str.match(/^.*(.).*\1.*$/)
end

p unique_no_data_structures("hello")  == false
p unique_no_data_structures("banana") == false
p unique_no_data_structures("banu")   == true


# 3. Design an algorithm and write code to remove the duplicate characters in a string without using any additional buffer. NOTE: One or two additional variables are fine. An extra copy of the array is not.

####### SOLUTION:

def remove_dup_chars(str)
  str.squueze
end