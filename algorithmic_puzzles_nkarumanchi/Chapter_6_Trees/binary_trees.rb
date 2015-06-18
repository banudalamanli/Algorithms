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

####################################
=begin
----- EXAMPLE TREE -----

            1
          /   \
         2     3
        / \   / \
       4   5 6   7

=end
####################################


class BinaryTree
  attr_accessor :root

  def initialize(data)
    @root = BinaryTreeNode.new(data)
  end

  # PRE-ORDER TRAVERSAL: Order of visit => root-left-right
  # The nodes of the tree would be visited in the following order:
  # 1 2 4 5 3 6 7
  def preorder_traversal_recursive(start_node = @root) # Time complexity O(n), Space complexity O(n)
    if start_node != nil
      preorder_traversal_recursive(start_node.left)
      p start_node.to_s
      preorder_traversal_recursive(start_node.right)
    end
  end

  def preorder_traversal_iterative(start_node = @root) # Time complexity O(n), Space complexity O(n)
    result = []
    return result if start_node == nil

    stack = []
    stack << start_node
    until stack.empty?
      temp_node = stack.pop
      result << temp_node.data
      stack << temp_node.right if temp_node.right != nil
      stack << temp_node.left if temp_node.left != nil
    end
    result
  end


  def to_s
    p "*" * 30
    printed_list = ''
    printed_list += preorder_traversal_recursive(@root).to_s
    # OR printed_list += preorder_traversal_iterative(@root).to_s
    "#{printed_list}"
  end

end


#####################################
# TESTS

my_binary_tree = BinaryTree.new(1)
print "root is: "
puts my_binary_tree.root
puts my_binary_tree

my_binary_tree.root.left  = BinaryTreeNode.new(2)
puts my_binary_tree

my_binary_tree.root.right = BinaryTreeNode.new(3)
puts my_binary_tree

my_binary_tree.root.left.left  = BinaryTreeNode.new(4)
puts my_binary_tree

my_binary_tree.root.left.right = BinaryTreeNode.new(5)
puts my_binary_tree

my_binary_tree.root.right.left  = BinaryTreeNode.new(6)
puts my_binary_tree

my_binary_tree.root.right.right = BinaryTreeNode.new(7)
puts my_binary_tree












