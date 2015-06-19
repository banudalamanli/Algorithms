############################### PROBLEM:
# Imagine you landed a new job as a cashier... Your quirky boss found out that you're a programmer and has a weird request about something they've been wondering for a long time.
# Write a function that, given:
# - an amount of money
# - a list of coin denominations
# computes the number of ways to make amount of money with coins of the available denominations.

# Example: for amount=4 (4¢) and denominations=[1,2,3] (1¢, 2¢ and 3¢), your program would output 4—the number of ways to make 4¢ with those denominations:

# 1¢, 1¢, 1¢, 1¢
# 1¢, 1¢, 2¢
# 1¢, 3¢
# 2¢, 2¢



############ Solution 1: Recursive solution without memoization - This is a top-down approach

# def number_of_ways(amount, denominations)
#   return 1 if amount == 0
#   return 0 if amount < 0 || denominations.length == 0

#   puts "checking ways to make #{amount} with #{denominations}"

#   current_coin, rest_of_coins = denominations[0], denominations.slice(1..-1)
#   num_of_possibilities = 0
#   while amount >= 0
#     p "inside while loop"
#     num_of_possibilities += number_of_ways(amount, rest_of_coins)
#     p "amount is #{amount} = #{amount} - #{current_coin}"
#     amount -= current_coin
#     p "*****amount now: #{amount}*****"
#   end
#   p "returning num_of_possibilities: #{num_of_possibilities}"
#   p "#################### next run ########################"
#   num_of_possibilities
# end


############ Solution 1: This is a bottom-up approach. O(n∗m) time and O(n) additional space, where n is the amount (of money) and m is the number of potential denominations(coins).

def number_of_ways(amount, denominations)
  ways_of_doing_n_cents = [0] * (amount + 2)
  # p "ways_of_doing_n_cents: #{ways_of_doing_n_cents}"
  ways_of_doing_n_cents[0] = 1
  # p "ways_of_doing_n_cents: #{ways_of_doing_n_cents}"

  denominations.each do |coin|
    # p "*" * 40
    # p "coin: #{coin}"
    for higher_amount in (coin..(amount+1))
      # p "higher_amount: #{higher_amount}"
      higher_amount_remainder = higher_amount - coin
      # p "higher_amount_remainder: #{higher_amount_remainder} = #{higher_amount} - #{coin}"
      ways_of_doing_n_cents[higher_amount] += ways_of_doing_n_cents[higher_amount_remainder]
      # p "ways_of_doing_n_cents[#{higher_amount}] += #{ways_of_doing_n_cents[higher_amount_remainder]} (ways_of_doing_n_cents[higher_amount_remainder] )"
      # p "ways_of_doing_n_cents: #{ways_of_doing_n_cents}"
    end
  end
  p ways_of_doing_n_cents[amount]
end

####################################################################################

# DRIVER TESTS
amount1 = 4
amount2 = 5
denomination1 = [1,2,3]
denomination2 = [1,2,3,5]

p number_of_ways(amount1, denomination1) == 4
p number_of_ways(amount2, denomination2) == 6

