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
For all implementations and **n** push operations Space Complexity is <code>O(n)</code> and Time Complexity is <code>O(1)</code>.<br>
The array(s) implemented will be circular where the last element and first element are contiguous, otherwise the initial slots of the array would be wasted.

- **Simple Circular Array:**
- **Dynamic Circular Array:** For the dynamic array implementation to have the complexity mentioned above, the approach to add elements to a full stack has to be "Repeated Doubling" as opposed to "Incremental Strategy". Repeated doubling is when the stack is full to create a new array of twice the size and copy items over. Incremental strategy on the other hand creates a new array of bigger size, copies all the elements of the old array to it and adds the new element at the end, and repeats the whole process again when adding a new element (this results in a Time Complexity of <code>O(n^2)</code>).
- **Linked List:** Elements are added and deleted to the beginning of the list (head node).

##### COMPARISON OF IMPLEMENTATIONS:
**Array Implementation:**<br>
- Operations take constant time.
- Expensive doubling operation every once in a while (see dynamic array implementation above).
- Starting from an empty stack *n* number of operations take time proportional to *n*.
<br>

**Linked List Implementation:**<br>
- Grows and shrinks nicely.
- Every opertion takes constant time.
- Every operation takes extra space and time to deal with referencing.





