class BinaryTreeNode
  attr_accessor :data, :left, :right

  def initialize(data = nil, left = nil, right = nil)
    @data = data
    @left  = left
    @right  = right
  end

  def to_s
    "#{@data.to_s}"
  end
end



class BinaryTree
  def initialize(data)
    @root = BinaryTreeNode.new(data)
  end
end
