######### PROBLEM 5:
# What is the smallest positive number that is evenly divisible(divisible with no remainder) by all of the numbers 
# from 1 to N?


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

def power_of_factor(num, factor)
  power = 1
  result = []
  while num >= 1
    num /= factor
    break if num % factor != 0
    power += 1
  end
  result << factor
  result << power
end

def prime_factors(num)   
  factors = []   
  int = 2    
  while int <= num
    if num % int == 0    
      factors << int if is_prime?(int)
    end    
    int += 1
  end    
  factors    
end

def solution(num)
  factors = {}
  (2..num).each do |number|
    if is_prime?(number)
      factors[number] = 1
    else
      prime_factors_of_the_number = prime_factors(number) # returns array of prime factors
      prime_factors_and_powers_of_number = []
      prime_factors_of_the_number.each do |int|
        prime_factors_and_powers_of_number << power_of_factor(number, int)
      end
      prime_factors_and_powers_of_number.each do |array_pair|
        factors[array_pair[0]] = array_pair[1] if factors[array_pair[0]] < array_pair[1]
      end
    end
  end

  smallest_mulitple = 1
  factors.each do |factor, power|
    smallest_mulitple *= (factor**power)
  end
  p smallest_mulitple
end



