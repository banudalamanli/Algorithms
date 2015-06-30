class Prime

  def self.nth(n)
    raise ArgumentError if n < 1
    return 2 if n == 1

    count = 2
    number = 3

    while count <= n
      if is_prime?(number)
        count += 1
        result = number
      end
      number += 2
    end
    result
  end

  def self.is_prime?(num)
    return true if num == 2
    return false if num % 2 == 0
    (3..Math::sqrt(num)).step(2).each do |factor|
      return false if num % factor == 0
    end
    true
  end

end

p Prime.nth(2)
