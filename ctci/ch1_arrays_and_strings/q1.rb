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

p unique?("hello") == false
p unique?("banu")  == true


# 1.1 What if you can not use additional data structures?
def unique_no_data_structures(str)
  !str.match(/(\w)\1/)
end

p unique?("hello") == false
p unique?("banu")  == true
