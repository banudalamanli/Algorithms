class Node
  attr_accessor :value, :next, :prev

  def initialize(value = nil, next_node = nil, prev_node = nil)
    @value = value
    @next  = next_node
    @prev  = prev_node
  end

  def next_node(value)
    @next = Node.new(value)
  end

  def to_s
    "#{@value.to_s}"
  end
end

class DoublyLinkedList
  def initialize(args)

  end


end
