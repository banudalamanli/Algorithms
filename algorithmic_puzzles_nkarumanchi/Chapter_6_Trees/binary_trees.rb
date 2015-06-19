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
      p start_node.to_s
      preorder_traversal_recursive(start_node.left)
      preorder_traversal_recursive(start_node.right)
    end
  end

  def preorder_traversal_iterative(start_node = @root) # Time complexity O(n), Space complexity O(n)
    result = []
    return result if start_node == nil

    stack = []
    stack << start_node
    until stack.empty?
      current_node = stack.pop
      result << current_node.data
      stack << current_node.right if current_node.right != nil
      stack << current_node.left if current_node.left != nil
    end
    result
  end

  # IN-ORDER TRAVERSAL: Order of visit => left-root-right
  # The nodes of the tree would be visited in the following order:
  # 4 2 5 1 6 3 7
  def inorder_traversal_recursive(start_node = @root) # Time complexity O(n), Space complexity O(n)
    if start_node != nil
      inorder_traversal_recursive(start_node.left)
      p start_node.to_s
      inorder_traversal_recursive(start_node.right)
    end
  end

  def inorder_traversal_iterative(start_node = @root) # Time complexity O(n), Space complexity O(n)
    result = []
    stack  = []

    current_node = start_node
    done = false

    until done
      if current_node != nil
        stack << current_node
        current_node = current_node.left
      else
        if stack.empty?
          done = true
        else
          current_node = stack.pop
          result << current_node.data
          current_node = current_node.right
        end
      end
    end
    result
  end

  # POST-ORDER TRAVERSAL: Order of visit => left-right-root
  # The nodes of the tree would be visited in the following order:
  # 4 5 2 6 7 3 1
  def postorder_traversal_recursive(start_node = @root) # Time complexity O(n), Space complexity O(n)
    if start_node != nil
      postorder_traversal_recursive(start_node.left)
      postorder_traversal_recursive(start_node.right)
      p start_node.to_s
    end
  end

  # In the iterative postorder traversal method each node is visited twice. Meaning after processing the left subtree the current node will be visited and after processing the right subtree the same current node will be visited again. The node should be processed on the second visit. To differentiate this: after popping an element from stack, check whether that element and the right element of top of the stack are the same. If they are the same the left subtree is completed.
  def postorder_traversal_iterative(start_node = @root) # Time complexity O(n), Space complexity O(n)
    result = []
    return result if start_node == nil

    stack = []
    stack << start_node
    prev = nil

    until stack.empty?
      current_node = stack[-1]
      if (prev == nil) || (prev.left == current_node) || (prev.right = current_node)
        if current_node.right != nil
          stack << current_node.right
        elsif current_node.left != nil
          stack << current_node.left
        end
      elsif current_node.left == prev
        stack << current_node.right if current_node.right != nil
      else
        result << current_node.data
        stack.pop
      end
      prev = current_node
      # p "at the end of iteration prev is: #{prev}"
      # p "result now is: #{result}"
      # p "*" * 30
    end
    result
  end

  def level_traversal(start_node = @root)
    result = []
    return result if start_node == nil

    queue = Queue.new
    queue << start_node
    queue << nil
    current_results = []

    until queue.empty?
      temp_node = queue.pop
      if temp_node != nil
        current_results << temp_node.data
        queue << temp_node.left unless temp_node.left == nil
        queue << temp_node.right unless temp_node.right == nil
        queue << nil
      elsif temp_node == nil
        result << current_results
        current_results = []
      end
    end
    result.flatten
  end

  def to_s
    printed_list = ''
    array_of_data = level_traversal
    array_of_data.each { |data| printed_list += data.to_s + ', ' }
    # printed_list += preorder_traversal_recursive.to_s
    # printed_list += preorder_traversal_iterative.to_s
    # printed_list += inorder_traversal_recursive.to_s
    # printed_list += inorder_traversal_iterative.to_s
    # printed_list += postorder_traversal_recursive.to_s
    # printed_list += postorder_traversal_iterative.to_s
    "#{printed_list.chop!.chop!}"
  end

end


#####################################
# TESTS

my_binary_tree = BinaryTree.new(1)
# print "root is: "
# puts my_binary_tree.root
# puts my_binary_tree

my_binary_tree.root.left  = BinaryTreeNode.new(2)
# puts my_binary_tree

my_binary_tree.root.right = BinaryTreeNode.new(3)
# puts my_binary_tree

my_binary_tree.root.left.left  = BinaryTreeNode.new(4)
# puts my_binary_tree

my_binary_tree.root.left.right = BinaryTreeNode.new(5)
# puts my_binary_tree

my_binary_tree.root.right.left  = BinaryTreeNode.new(6)
# puts my_binary_tree

my_binary_tree.root.right.right = BinaryTreeNode.new(7)
puts my_binary_tree












