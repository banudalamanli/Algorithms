class Node
  attr_accessor :value, :next

  def initialize(value = nil, next_node = nil)
    @value = value
    @next  = next_node
  end

  def next_node(value)
    @next = Node.new(value)
  end

  def to_s
    "#{@value.to_s}"
  end
end

class SinglyLinkedList
  include GC
  attr_accessor :head, :tail

  def initialize(value = nil)
    @head = Node.new(value)
    @tail = @head
  end

  def length # Time complexity = O(n), Space complexity = O(1) for creating temp variable
    length = 0
    current_node = @head
    while current_node != nil
      current_node = current_node.next
      length += 1
    end
    length
  end

  def find_nth_node(n)
    nth_node = @head
    (n-1).times { nth_node = nth_node.next }
    nth_node
  end

  def insert(position, value) # Time complexity = O(n), Space complexity = O(1) for creating temp variable
    # Edge cases and errors
    raise "The position argument needs to be an integer." unless position.is_a? Integer
    list_size = self.length
    # Can't insert into linked list if position is beyond end point+1
    raise "There is no such position in given linked list" if position > (list_size + 1)

    # Adding to the beginning of the list - Time complexity = O(1), Space complexity = O(1)
    if position == 1
      old_head = @head
      @head    = Node.new(value, old_head)
    # Adding to the end of the list - Time complexity = O(1), Space complexity = O(1)
    elsif position == (list_size + 1)
      @head.next = @tail if list_size == 1
      @tail      = @tail.next_node(value)
    # Adding to the middle of the list - Time complexity = O(n), Space complexity = O(1)
    else
      insertion          = Node.new(value)
      previous_node      = self.find_nth_node(position-1)
      insertion.next     = previous_node.next
      previous_node.next = insertion
    end

    # EXTRA COMMENTS:
    # # Without a find_nth_node method, implementation can be as follows (The code commented out code below would replace <previous_node = self.find_nth_node(position-1)>):
    # # The pointer needs to hold the (n-1)th node as the "previous node" for insertions at position n.
    # # The pointer previous_node is set to @head for insertion at position n = 2, meaning the below code should run 0 times if argument position == 2 - and +1 for each +1 in position (i.e. 1 time for position 3, 2 times for position 4, and so on). Therefore we need to traverse through the list position-2 times to find the right "previous" node.

    # previous_node = @head
    # (position-2).times do
    #   previous_node = previous_node.next
    # end
  end

  def delete(position)
    num_of_nodes = self.length
    # Deleting first element from list - Time complexity = O(1), Space complexity = O(1)
    if position == 1
      temp  = @head
      @head = @head.next
      temp
    # Deleting last element from list - Time complexity = O(n), Space complexity = O(1)
    elsif position == num_of_nodes
      node_before_tail      = self.find_nth_node(num_of_nodes - 1)
      node_before_tail.next = nil
      last_node             = @tail
      @tail                 = node_before_tail
      last_node
    # Deleting intermediate element from list - Time complexity = O(n), Space complexity = O(1)
    else
      node_before_target      = self.find_nth_node(position - 1)
      target                  = node_before_target.next
      node_before_target.next = target.next
      target
    end
  end

  def delete_list
    (self.length).times do
      old_head = @head
      @head = @head.next
      old_head = nil
    end
    @tail = nil
    self
  end

  # private
  def to_s
    current_node = @head
    printed_list = ''
    # Iterating through the list length-1 times because the tail node will be added seperately at the end. Otherwise we would have to use .chop!.chop! to get rid of the extra ', '
    (self.length-1).times do
      printed_list += current_node.to_s + ', '
      current_node = current_node.next
    end
    printed_list += @tail.to_s
    "#{printed_list}"
  end
end

##########################################################
# TESTS
my_list = SinglyLinkedList.new(5)

p my_list.length == 1

my_list.insert(my_list.length+1, 10)
p my_list.length == 2
puts my_list

my_list.insert(my_list.length+1, 15)
puts my_list

my_list.insert(my_list.length+1, 20)
puts my_list

my_list.insert(1, 0)
puts my_list

p "CHECKING ADDITIONS:"
puts my_list.insert(6, "at end")
puts my_list

puts my_list.insert(1, "at beginning")
puts my_list

puts my_list.insert(4, "inserted!!")
puts my_list

# puts my_list.find_nth_node(4)

p "DELETIONS:"
puts my_list.delete(1)
puts my_list

puts my_list.delete(my_list.length)
puts my_list

puts my_list.delete(3)
puts my_list

puts "my_list.delete_list returns = < #{my_list.delete_list} >"
puts my_list



