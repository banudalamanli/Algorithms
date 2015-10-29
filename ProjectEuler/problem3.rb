######### PROBLEM 3:
### LARGEST PRIME FACTOR ###
# The prime factors of 13195 are 5, 7, 13, and 29.
# What is the largest prime factor of the number 600851475143?

########## SOLUTION:
def is_prime?(num)
  return true if num == 1 || num == 2
  return false if num % 2 == 0
  int = 3
  while int <= Math::sqrt(num)
    return false if num % int == 0
    int += 2
  end
  true
end

def find_largest_prime_factor(num)
  return num if is_prime?(num)
  factor = 2
  while factor <= num/3
    if num % factor == 0
      largest_factor = num / factor
      return largest_prime = largest_factor if is_prime?(largest_factor)
    end
    factor += 1
  end
end

tests = gets.chomp.to_i

tests.times do
  number = gets.chomp.to_i
  puts find_largest_prime_factor(number)
end
###################################################################

# DRIVER TESTS:

# p is_prime?(29) == true
# p is_prime?(15) == false
# p is_prime?(5) == true

# p find_largest_prime_factor(8) == 2
# p find_largest_prime_factor(15) == 5
# p find_largest_prime_factor(13195) == 29
# p find_largest_prime_factor(600851475143) == 6857



