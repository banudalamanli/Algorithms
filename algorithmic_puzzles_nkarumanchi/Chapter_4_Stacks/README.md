## STACKS

An ordered list with a fixed size in which insertion and deletion are done at the end. The last elemented added is the first one to be deleted. It is also called FILO (First In Last Out) or LIFO (Last In First Our) list.

##### CONCEPTS:
- **Underflow :** Trying to delete an element from an empty stack.
- **Overflow  :** Trying to add an element to a full stack.


##### SOME APPLICATIONS:
- Balancing of Symbols
- Implementing function calls (including recursion)
- Undo sequence in a text editor
-**Indirect application:** Tree traversal algorithm

### IMPLEMENTATIONS
For all implementations and **n** push operations Space Complexity is <code>O(n)</code> and Time Complexity is <code>O(1)</code>
-*Simple Array*
-*Dynamic Array:* For the dynamic array implementation to have the complexity mentioned above, the approach to add elements to a full stack has to be "Repeated Doubling" as opposed to "Incremental Strategy". Repeated doubling is when the stack is full to create a new array of twice the size and copy items over. Incremental strategy on the other hand creates a new array of bigger size, copies all the elements of the old array to it and adds the new element at the end, and repeats the whole process again when adding a new element (this results in a Time Complexity of <code>O(n^2)</code>).
-*Linked List*

##### COMPARISON OF IMPLEMENTATIONS:







