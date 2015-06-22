## QUEUES

An ordered list in which insertion is done at the *rear* and deletion are done at the *front*. The first elemented added is the first one to be deleted. It is also called FIFO (First In First Out) or LILO (Last In Last Our) list.

##### CONCEPTS:
* **Same as Stack** *
- **Underflow :** Trying to delete an element from an empty queue.
- **Overflow  :** Trying to add an element to a full queue.


##### SOME APPLICATIONS:
- Simulation of real world queues
- Asynchronus data transfer (file I/O, pipes)
- **Indirect application:** Auxilary data structure for algorithms

### IMPLEMENTATIONS
For all implementations and **n** number of elements Space Complexity is <code>O(n)</code> and Time Complexity is <code>O(1)</code> (time complexity is *average* for dynamic circular and linked list implementations).<br>
The array(s) implemented will be circular where the last element and first element are contiguous, otherwise the initial slots of the array would be wasted.

- **Simple Circular Array:** The max size of the array has to be defined at the beginning and can not be changed after. There are two variables to keep track of first and last element of array. When both first and last pointers point to -1 it means that the queue is empty.
- **Dynamic Circular Array**
- **Linked List:** Elements are deleted from the beginning of the list (head node) and are deleted from the added to the end of the list (tail node).

##### COMPARISON OF IMPLEMENTATIONS:
Same as stacks (Chapter 4)





