# Sorting Algorithm Implementations in Ruby

### Insertion Sort
###### What does it do?
<p>It iterates through the array starting with the 2nd element of the array, and compares it against every element(s) that come(s) before it and swaps them if it is smaller and stops when it comes to an element which it is bigger than. Then moves on to the next element (3rd in this case), comparing it to every element that are before them (elements 1 and 2) swapping if it is smaller, and so on. </p>

###### Properties
- Stable
- O(1) extra space
- O(n2) comparisons and swaps
- Adaptive: O(n) time when nearly sorted
- Very low overhead

###### Notes
Algorithm of choice either when:
- the data is nearly sorted => because it is adaptive, or
- the problem size is small => because it has low overhead.

Because it is also stable, it's often used as the recursive base case (when the problem size is small) for higher overhead divide-and-conquer sorting algorithms - such as merge sort or quick sort.

### Selection Sort
###### What does it do?
<p>It basically iterates through the array looking for the smallest element (), placing it in the smallest index (which at the start is 0), then repeats the same with the remainder of the array (where smallest index becomes +1 with every iteration).</p>

<p>It starts iterating with the first element, compares it with the 2nd element, and swaps them if the 2nd element is smaller. Then it checks the 3rd element against the first element (formerly 2nd element) and swaps them if the 3 rd element is smaller, then the 4th element against first element...until all the elements in the array are compared. Then it moves on to the second element and checks it again the 3rd element, etc etc repeating the sweep.</p>

###### Properties
- Not stable
- O(1) extra space
- Θ(n2) comparisons
- Θ(n) swaps
- Not adaptive

###### Notes
In applications where the cost of swapping items is high, selection sort very well may be the algorithm of choice because it has the property of minimizing the number of swaps.


<em>*Resource for "Properties" and "Notes": www.sorting-algorithms.com</em>
