class Node
  attr_accessor :value, :next, :prev

  def initialize(value = nil, prev_node = nil, next_node = nil)
    @value = value
    @prev  = prev_node
    @next  = next_node
  end

  def next_node(value)
    @next = Node.new(value)
  end

  def prev_node(node)
    @prev = node
  end

  def to_s
    "#{@value.to_s}"
  end
end



class DoublyLinkedList
  attr_accessor :head, :tail
  def initialize(value)
    @head = Node.new(value)
    @tail = @head
  end

  def length # Time complexity = O(n), Space complexity = O(1)
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

  def insert(position, value)
    raise "The position argument needs to be an integer." unless position.is_a? Integer

    list_size = self.length

    raise "There is no such position in given linked list" if position > (list_size + 1)

    if position == 1
      new_head   = Node.new(value, nil, @head)
      @head.prev = new_head
      @head      = new_head
    elsif position == (list_size + 1)
      @head.next = @tail if list_size == 1
      new_tail   = Node.new(value, @tail)
      @tail.next = new_tail
      @tail      = new_tail
    else
      previous_node = self.find_nth_node(position-1)
      insertion = Node.new(value, previous_node, previous_node.next)
      previous_node.next.prev = insertion
      previous_node.next = insertion
    end
  end

  def delete(position)
    raise "The position argument needs to be a positive number." unless position.is_a? Integer and position > 0
    num_of_nodes = self.length
    raise "There is no such position in given linked list" if position > (num_of_nodes + 1)

    if position == 1
      target = @head
      @head = @head.next
      @head.prev = nil
      target.next = nil
      target
    elsif position == num_of_nodes
      previous_node = @tail.prev
      previous_node.next = nil
      @tail.prev = nil
      target = @tail
      @tail = previous_node
      target
    else
      previous_node = self.find_nth_node(position-1)
      target = previous_node.next
      previous_node.next = target.next
      target.next.prev = previous_node
      target.next, target.prev = nil
      target
    end
  end

  def delete_list
    # List is traversed and as the head moves to the next pointer, the old head is freed up. The iteration is done length-1 times because the tail is freed up after the loop.
    (self.length-1).times do
      old_head = @head
      @head = @head.next
      old_head = nil
    end
    @tail = nil
    self
  end

  def to_s
    current_node = @head
    printed_list = ''
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
my_list = DoublyLinkedList.new(5)

my_list.insert(1, "beginning")
puts my_list # => beginning, 5

my_list.insert(3, "at end")
puts my_list # => beginning, 5, at end

p "***** INSERT IN MID"
my_list.insert(3, "inserted!!!!!")
puts my_list # => beginning, 5, inserted!!!!!, at end


p "========================= DELETION ================="

p "Deleting START"
my_list.delete(1)
puts my_list # => 5, inserted!!!!!, at end

p "Deleting MIDDLE"
my_list.delete(2)
puts my_list # => 5, at end

p "Deleting END"
my_list.delete(my_list.length)
puts my_list # => 5

p "==================================================="


p "****************** HEAD NODE: head - prev - next"
# puts my_list.head
# puts my_list.head.inspect
# p "--- prev"
# puts my_list.head.prev.inspect
# p "--- next"
# puts my_list.head.next.inspect


# p "****************** INSERTED NODE: head - prev - next"
# middle_node = my_list.find_nth_node(3)
# puts middle_node
# puts middle_node.inspect
# p "--- prev"
# puts middle_node.prev.inspect
# p "--- next"
# puts middle_node.next.inspect


# p "****************** TAIL NODE: head - prev - next"
# puts my_list.tail
# puts my_list.tail.inspect
# p "--- prev"
# puts my_list.tail.prev.inspect
# p "--- next"
# puts my_list.tail.next.inspect


p "============= DELETING THE WHOLE LIST ================="
puts "my_list.delete_list returns: #{my_list.delete_list}"  # => my_list.delete_list returns = <  >
puts my_list  # =>



















