# Implementation done using array class.

class Heap
  attr_accessor :heap
  attr_reader :type, :size

  def initialize(data = [])
    @heap = data
    @size = data.size
  end

  def parent(node_index)
  # for a node at i-th location its parent is at (i-1)/2 th location
    return -1 if node_index <= 0 || node_index >= @size
    (node_index - 1) / 2
  end

  def left_child(node_index)
  # for a node at i-th location its left child is at 2*i+1 th location
    left = 2 * node_index + 1
    return -1 if left >= @size
    left
  end

  def right_child(node_index)
  # for a node at i-th location its right childis at 2*i+2 th location
    right = 2 * node_index + 2
    return -1 if right >= @size
    right
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

    # percolate_down
    # self.heapsort
    max
  end

  def heapsort!
    ((@size - 2) / 2).downto(0) {|start| percolate_down(start, @size - 1)}

    (@size - 1).downto(1) do |i|
      @heap[i], @heap[0] = @heap[0], @heap[i]
      percolate_down(0, i - 1)
    end
    @heap
  end

  def destroy
    @heap = nil
    @size = nil
  end

  private
  # Time complexity O(log n), Space complexity O(1)
  def percolate_down(node_index = 0, size = @size)
    left  = left_child(node_index)
    right = right_child(node_index)

    if (left != -1) && (@heap[left] > @heap[node_index])
      max = left
    else
      max = node_index
    end

    if (right != -1) && (@heap[right] > @heap[max])
      max = right
    end

    if max != node_index
      temp              = @heap[node_index]
      @heap[node_index] = @heap[max]
      @heap[max]        = temp
      # @heap[node_index], @heap[max] = @heap[max], @heap[node_index]
    end
    percolate_down(max)
  end

  # def percolate_down(node_index = 0, size = @size)
  #   ############ Note to self - WORK ON THIS: #############
  #   loop do
  #     child = node_index * 2 + 1
  #     break if child > @size

  #     if child + 1 <= @size and @heap[child] < @heap[child + 1]
  #       child += 1
  #     end

  #     if @heap[node_index] < @heap[child]
  #       @heap[node_index], @heap[child] = @heap[child], @heap[node_index]
  #       node_index = child
  #     else
  #       break
  #     end
  #   end
  # end

end



my_heap = Heap.new([0,  12, 13, 14, 21, 01, 02, 11, 22, 23, 24])
p my_heap
p "==" * 25
my_heap.heapsort!
p "my heap after sorting:"
p my_heap
# p "==" * 25
# my_heap.size.times do |index|
#   p "*" * 40
#   p "#{index}-th Element: #{my_heap.heap[index]}"
#   p "Left-Child : #{my_heap.heap[my_heap.left_child(index)]}"
#   p "Right-Child: #{my_heap.heap[my_heap.right_child(index)]}"
# end

# p "==" * 25
# p "DELETING MAX"
# p my_heap.delete_max
# p "==" * 25












