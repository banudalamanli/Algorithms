class Prime

  def nth(n)
    raise ArgumentError if n < 1

    count = 1
    number = 2

    while count <= n
      if is_prime?(number)
        count += 1
        result = number
      end
      number += 1
    end
    result
  end

  def is_prime?(num)
    (2..Math::sqrt(num)).each do |factor|
      return false if num % 2 == 0
      if factor % 2 != 0
        return false if num % factor == 0
      end
   end
    true
  end

end
