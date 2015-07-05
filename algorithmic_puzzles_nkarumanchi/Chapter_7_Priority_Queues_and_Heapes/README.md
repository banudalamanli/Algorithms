## PRIORITY QUEUES AND HEAPES

### PRIORITY QUEUE
Is an abstract data structure that is very similar to queues. However, in Priority Queues the order in which the elements enter may not be the same the order they are processed.


#### Operations On Priority Queues:
###### BASIC:
- Insert
- Delete Min
- Delete Max

###### Auxilary:
- nth smallest/nth largest
- Size
- Heap Sort: Sorts based on priority(key)

#### Applications:
- Huffman Coding Algorithm (Data Compression)
- Dijkstra's Algorithm (Shortest Path Algorithm)
- Prim's Algorithm (Minimum Spanning Tree Algorithm)
- Event driven simulation
- Selection problem

### HEAPS AND BINARY HEAPS
A heap is a tree with following special properties:<br>
- The value of a node must be `>=` (or `<=`) to the value(s) of its children. (*heap property*)
- All leaves should be at `h` or `h-1` levels. In other words, it should be a *complete binary tree*
* *Being a complete binary tree, there won't be any wasted space*

###### Types of Heaps?
- **Min Heap:** The value of a node must be less or equal to the value(s) of its children
- **Max Heap:** The value of a node must be greater or equal to the value(s) of its children

#### BINARY HEAPS
In binary heaps each node can only have up to 2 children.

###### Heapifying an element:
After inserting an element to a heap, the collection might not satisfy the heap property. In that case the locations will need to be readjusted and this process is called *heapifying*. <br>
In max heap to heapify an element we need to find the child with the max value and swap it with the current and repeat this process until the heap property is satisfied at every node.

- **Percolate Down:** Is the heapification from top to bottom. Used after deleting an element. (*Top-down approach*)
- **Percolate Up:** Is the heapification from bottom up. Used after inserting an element (to the bottom). (*Bottom-up approach*)

##### HEAPSORT ALGORITHM
Inserts all elements (from an unsorted array) into a heap, then removes them form the root of a heap until the heap is empty.



