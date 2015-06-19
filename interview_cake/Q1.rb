############################### PROBLEM:
# I have an array stock_prices_yesterday where:

# The indices are the time in minutes past trade opening time, which was 9:30am local time.
# The values are the price in dollars of Apple stock at that time.
# For example, the stock cost $500 at 10:30am, so stock_prices_yesterday[60] = 500.

# Write an efficient algorithm for computing the best profit I could have made from 1 purchase and 1 sale of 1 Apple stock yesterday.

# No "shorting"—you must buy before you sell. You may not buy and sell in the same time step (at least 1 minute must pass).

############ Solution 1: Brute force approach giving us O(n^2) because of the nested loops

# def get_max_profit(hash_of_stock_prices)
#   max_profit = 0

#   hash_of_stock_prices.each_pair do |key, value|
#     hash_of_stock_prices.each_pair do |inner_key, inner_value|
#       earlier_time = [key, inner_key].min
#       later_time   = [key, inner_key].max

#       earlier_price = hash_of_stock_prices[earlier_time]
#       later_price   = hash_of_stock_prices[later_time]

#       potential_profit = later_price - earlier_price

#       max_profit = potential_profit if potential_profit > max_profit
#     end
#   end
#   p max_profit
# end


############ Solution 2: O(n)Greedy Approach by keeping a running max profit until the end. Would have been O(1) space if I didn't flatten the hash but becausse I did it is now O(n) space :/

def get_max_profit(hash_of_stock_prices)
  raise "Getting a profit requires at least two prices" if hash_of_stock_prices.size < 2
  flattened_stock_prices = hash_of_stock_prices.flatten

  min_price  = flattened_stock_prices[1]
  max_profit = flattened_stock_prices[3] - flattened_stock_prices[1]

  i = 0
  hash_of_stock_prices.each_pair do |current_time, current_price|
    if i == 0
      i += 1
      next
    end

    potential_profit = current_price - min_price
    max_profit = potential_profit if potential_profit > max_profit
    min_price = current_price if current_price < min_price
  end
  p max_profit
end



####################################################################################

# DRIVER TESTS

hash_of_stock_prices = {}
hash_of_stock_prices[30] = 400
hash_of_stock_prices[40] = 200
hash_of_stock_prices[60] = 500
hash_of_stock_prices[70] = 600

loosing_stock_prices1 = {30=> 400, 60=> 360, 90=> 350, 120=> 200}
loosing_stock_prices2 = {30=> 400, 60=> 400, 90=> 350, 120=> 200}


p get_max_profit(hash_of_stock_prices) == 400
p get_max_profit(loosing_stock_prices1) == -10
p get_max_profit(loosing_stock_prices2) == 0

