######### PROBLEM 1:
### LARGEST PRIME FACTOR ###
# The prime factors of 13195 are 5, 7, 13, and 29.
# What is the largest prime factor of the number 600851475143?

########## SOLUTION:
def is_prime?(num)
  return true if num == 1 || num == 2
  return false if num % 2 == 0
  int = 3
  while int < Math::sqrt(num)
    return false if num % int == 0
    int += 2
  end
  true
end

def find_factors(num)
  factors = []
  int = 2
  while int <= num/3
    if num % int == 0
      factors << int
      factors << num / int
    end
    int += 2
  end
  p factors
end

def find_largest_prime_factor(num)
  all_factors = find_factors(num)
  all_factors.count.times do
    factor = all_factors.delete_at(-1)
    return factor if is_prime?(factor)
  end
end

def find_largest_prime_factor2(num)
  max = current_factor = 2

  until num < max
    until num % current_factor  == 0
      current_factor  += 1
    end

    max = current_factor if current_factor > max
    num /= current_factor
    current_factor = 2
  end
  p max
end


def find_largest_prime_factor3(num)
  max_factor = 1
  current_factor = 2

  until num == 1
    if num % current_factor == 0
      max_factor = current_factor
      while num % current_factor == 0
        num /= current_factor
      end
    end
    current_factor += 1
  end
  p max_factor
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



