require_relative 'binary_trees.rb'

# PROBLEM 1: Find the maximum value in a binary tree with recursion.
# Solution: Find max in left subtree, then find max in right subtree, then compare them both with root.
def max_value_recursive(root)
  raise "Please pass the root of the binary tree as an argument." if root.is_a? BinaryTree

  max_value = 0
  if root != nil
    left_max = max_value_recursive(root.left)
    right_max = max_value_recursive(root.right)
    left_max > right_max ? max_value = left_max : max_value = right_max
    root.data > max_value ? max_value = root.data : max_value
  end
  max_value
end

# PROBLEM 2: Find the maximum value in a binary tree without recursion.
# Solution: Using level order traversal and keeping track of max value while deleting.
def max_value_iterative(root)
  raise "Please pass the root of the binary tree as an argument." if root.is_a? BinaryTree
  raise "Binary tree has no max value" if root == nil

  max_value = 0
  queue = Queue.new
  queue << root

  until queue.empty?
    temp_node = queue.pop
    max_value = temp_node.data if temp_node.data > max_value

    unless temp_node == nil
      queue << temp_node.left if temp_node.left != nil
      queue << temp_node.right if temp_node.right != nil
    end
  end
  max_value
end

# PROBLEM 3: Find element in binary tree with recursion
# Solution:
def find_node(root, data)
  raise "Please pass the root of the binary tree as an argument." if root.is_a? BinaryTree

  return false if root == nil
  return true if root.data == data
  return find_node(root.left, data) || find_node(root.right, data)
end


#####################################################
# EXAMPLE TREE FOR TESTS
=begin

               1
          /         \
         2           3
       /   \       /   \
      4     5     6     7
     / \   / \   / \   / \
    8   9 10 11 12 13 14 15

=end

my_binary_tree = BinaryTree.new(1)

my_binary_tree.root.left  = BinaryTreeNode.new(2)
my_binary_tree.root.right = BinaryTreeNode.new(3)

my_binary_tree.root.left.left   = BinaryTreeNode.new(4)
my_binary_tree.root.left.right  = BinaryTreeNode.new(5)
my_binary_tree.root.right.left  = BinaryTreeNode.new(6)
my_binary_tree.root.right.right = BinaryTreeNode.new(7)

my_binary_tree.root.left.left.left    = BinaryTreeNode.new(8)
my_binary_tree.root.left.left.right   = BinaryTreeNode.new(9)
my_binary_tree.root.left.right.left   = BinaryTreeNode.new(10)
my_binary_tree.root.left.right.right  = BinaryTreeNode.new(11)
my_binary_tree.root.right.left.left   = BinaryTreeNode.new(12)
my_binary_tree.root.right.left.right  = BinaryTreeNode.new(13)
my_binary_tree.root.right.right.left  = BinaryTreeNode.new(14)
my_binary_tree.root.right.right.right = BinaryTreeNode.new(15)


# ERROR TESTS
# p max_value_recursive(my_binary_tree)

# DRIVER TESTS
p max_value_recursive(my_binary_tree.root) == 15
p max_value_iterative(my_binary_tree.root) == 15
p find_node(my_binary_tree.root, 11) == true
p find_node(my_binary_tree.root, 24) == false

