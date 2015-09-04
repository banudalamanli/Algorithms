######### PROBLEM 4:
# A palindromic number reads the same both ways. The smallest 6 digit palindrome made from the product of two 3-digit numbers is 101101=143×707.
# Find the largest palindrome made from the product of two 3-digit numbers which is less than num.


########## SOLUTION:
def is_palindrome?(num)
  string_num = num.to_s
  string_num == string_num.reverse
end

def solution(num)
  x = 999
  palindrome_products = []

  while x > 101
    product = 101102
    y = num / x

    while y > 101 && y < 999
      product = x * y
      if is_palindrome?(product)
        palindrome_products << product
        break
      end
      y -= 1
    end

    x -= 1
  end
  p palindrome_products.sort[-1]
end

tests = gets.chomp.to_i

tests.times do
  number = gets.chomp.to_i
  solution(number)
end



