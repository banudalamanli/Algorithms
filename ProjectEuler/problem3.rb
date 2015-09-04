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
  factor = 2
  while factor <= num/3
    if num % factor == 0
      largest_factor = num / factor
      return p largest_prime = largest_factor if is_prime?(largest_factor)
    end
    factor += 1
  end
  p num if is_prime?(num)
end

###################################################################

# DRIVER TESTS:

# p is_prime?(29) == true
# p is_prime?(15) == false
# p is_prime?(5) == true

# p find_factors(18) == [1, 2, 3, 6, 9]
# p find_factors(42) == [1, 2, 3, 6, 7, 14, 21]


# p find_largest_prime_factor(8) == 2
# p find_largest_prime_factor(15) == 5
# p find_largest_prime_factor(13195) == 29
# p find_largest_prime_factor(600851475143) == 6857

p find_largest_prime_factor2(8) == 2
p find_largest_prime_factor2(15) == 5
p find_largest_prime_factor2(340) == 17
p find_largest_prime_factor2(13195) == 29
p find_largest_prime_factor2(600851475143) == 6857
p "*" * 30
p find_largest_prime_factor3(8) == 2
p find_largest_prime_factor3(15) == 5
p find_largest_prime_factor3(340) == 17
p find_largest_prime_factor3(13195) == 29
p find_largest_prime_factor3(600851475143) == 6857



