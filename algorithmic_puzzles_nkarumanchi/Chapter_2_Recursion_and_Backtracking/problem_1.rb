# Towers of Hanoi

###### SOLUTION:

def towers_of_hanoi(disks, destination = [], temp = [], num_of_disks = disks.length)
  # if there is only one disk, return move the peg
  destination << disks.pop if num_of_disks == 1

  towers_of_hanoi(disks, temp, destination, num_of_disks-1)
  destination << disks.pop
  towers_of_hanoi(temp, destination, disks, num_of_disks-1)
end

my_disks = [1, 2, 3]
p towers_of_hanoi(my_disks)
