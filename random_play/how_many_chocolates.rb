################# PROBLEM:
# Write a function that takes three parameters: your allowance, costs of a chocolate, and a the amount of wrappers that you bring to get a free one, and returns the maximum amount of chocolates you can get.

# The commented out parts can be uncommented for a breakdown of the logic.


def how_many_chocos(money, cost, freeby)
  total_chocos = money/cost
  extra_chocos = 0
  wrappers = total_chocos

  # p "Your allowance is #{money}."
  # p "A choco costs #{cost} $"
  # p "You get a free choco for every #{freeby} wrapper you bring."

  # p "Initial total_chocos: #{total_chocos}"
  # p "You already ate those initial chocos and now have #{wrappers} wrappers"

  # count = 0
  until (extra_chocos + wrappers) < freeby
    # p "count is #{count}"
    bonus = extra_chocos + wrappers
    # p "After eating the extra chocos you got (#{extra_chocos}) plus the wrappers you had (#{wrappers}) you now have #{bonus} wrappers before turning them in for new extra chocos"
    extra_chocos = bonus / freeby
    wrappers = bonus % freeby
    total_chocos += extra_chocos

    # p "You got #{extra_chocos} extra_chocos from the wrappers you had"
    # p "wrappers is now #{wrappers}"
    # p "total_chocos you had is now #{total_chocos}"
    # count += 1
  end
  total_chocos
end

# DRIVER TESTS
p how_many_chocos(10, 2, 5) == 6
p how_many_chocos(12, 4, 4) == 3
p how_many_chocos(6, 2, 2) == 5
p how_many_chocos(10, 2, 2) == 9


