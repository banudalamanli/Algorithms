# Implementation done using array class.

class Heap
  attr_accessor :heap
  attr_reader :type, :size

  def initialize(type = 'min_heap')
    @heap = []
    @type = type
    @size = @heap.size
  end

  def parent(node_index)
  # for a node at i-th location its parent is at (i-1)/2 th location
    raise ArgumentError if node_index <= 0 || node_index >= @size
    (node_index - 1) / 2
  end

  def left_child(node_index)
  # for a node at i-th location its left child is at 2*i+1 th location
    left_child = 2 * node_index + 1
    raise "Node does not exist" if left_child >= @size
    left_child
  end

  def right_child(node_index)
  # for a node at i-th location its parent is at 2*i+2 th location
    right_child = 2 * node_index + 2
    raise "Node does not exist" if right_child >= @size
    left_child
  end

  def get_maximum
    raise "The collection is empty." if @size == 0
    @heap.first
  end

  def delete_max
    # Pseudocode: 1) Copy root (max) element to a var, 2) Move last element into root pos, 3) Percolate down from root, 4) Return max element.
    # Time complexity O(log n).
    raise "The collection is empty." if @size == 0

    max      = @heap[0]
    @heap[0] = @heap[@size-1]
    @size   -= 1

    percolate_down(0)
    max
  end

  def destroy
    @heap = nil
    @type = nil
    @size = nil
  end

  private
  # To heapify
  # Time complexity O(log n), Space complexity O(1)
  def percolate_down(node_index)
    left  = left_child(node_index)
    right = right_child(node_index)

    if left_child && @heap[left] > @heap[node_index]
      max = left
    else
      max = node_index
    end

    if right_child && @heap[right] > @heap[node_index]
      max = right
    end

    if max != node_index
      @heap[node_index], @heap[max] = @heap[max], @heap[node_index]
    end

    percolate_down(max)
  end
end








