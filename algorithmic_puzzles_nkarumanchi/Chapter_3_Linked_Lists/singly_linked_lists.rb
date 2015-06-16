class Node
  attr_accessor :value, :next

  def initialize(value = nil, next_node = nil)
    @value = value
    @next = next_node
  end

  def next_node(value)
    @next = Node.new(value)
  end

  def to_s
    "#{@value.to_s}"
  end
end

class SinglyLinkedList
  attr_accessor :head, :tail

  def initialize(value = nil)
    @head = Node.new(value)
    @tail = @head
  end

  def insert_at_beginning(value)
    @head = Node.new(value, @head)
  end

  def insert_at_end(value)
    @head.next = @tail if self.length == 1
    @tail = @tail.next_node(value)
  end

  def insert_in_middle(position, value)
    insertion = Node.new(value)
    previous_node = @head
    following_node = @head.next

    position-1.times do
      previous_node = previous_node.next
      following_node = following_node.next
    end

    previous_node.next = insertion
    insertion.next = following_node
  end

  def length
    length = 0
    current_node = @head
    while current_node != nil
      current_node = current_node.next
      length += 1
    end
    length
  end


  def to_s
    current_node = @head
    printed_list = ''
    while current_node != nil
      printed_list += current_node.to_s + ', '
      current_node = current_node.next
    end
  p "printing linked list:"
    "#{printed_list.chop!.chop!}"
  end
end


my_linked_list = SinglyLinkedList.new(5)
p my_linked_list.length == 1
my_linked_list.insert_at_end(10)
p my_linked_list.length == 2
puts my_linked_list
my_linked_list.insert_at_end(15)
puts my_linked_list
my_linked_list.insert_at_end(20)
puts my_linked_list

my_linked_list.insert_at_beginning(0)
puts my_linked_list

my_linked_list.insert_in_middle(3, "insane")
puts my_linked_list
