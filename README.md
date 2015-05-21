# Sorting Algorithm Implementations in Ruby

### Insertion Sort
###### How does it work?
<p>It is about the element.</p>
<p>Starts from the beginning (2nd element) and moves backwards.</p>
<p>Takes the element and moves it towards the beginning, until it meets an element that is smaller.</p>
<p>To be more explicit: It iterates through the array starting with the 2nd element of the array, and compares it against every element(s) that come(s) before it and swaps them if it is smaller and stops when it comes to an element which it is bigger than. Then moves on to the next element (3rd in this case), comparing it to every element that are before them (elements 1 and 2) swapping if it is smaller, and so on. </p>

###### Properties
- Stable
- O(1) extra space
- O(n^2) comparisons and swaps
- Adaptive: O(n) time when nearly sorted
- Very low overhead

###### Notes
Algorithm of choice either when:
- the data is nearly sorted => because it is adaptive, or
- the problem size is small => because it has low overhead.

Because it is also stable, it's often used as the recursive base case (when the problem size is small) for higher overhead divide-and-conquer sorting algorithms - such as merge sort or quick sort.

### Selection Sort
###### How does it work?
<p>It is about the position not the element.</p>
<p>Starts from the beginning and moves forward.</p>
<p>Takes the element in position (first one would be the one in index 0), compares it to every element that comes after, while placing the whichever is smaller to the position. Then moves on to the next position and repeats. </p>

<p>To be more explicit: It starts iterating with the first element, compares it with the 2nd element, and swaps them if the 2nd element is smaller. Then it checks the 3rd element against the first element (formerly 2nd element) and swaps them if the 3 rd element is smaller, then the 4th element against first element...until all the elements in the array are compared. Then it moves on to the 2nd element and checks the 3rd element against it, etc etc repeating the sweep.</p>

###### Properties
- Not stable
- O(1) extra space
- Θ(n^2) comparisons
- Θ(n) swaps
- Not adaptive

###### Notes
In applications where the cost of swapping items is high, selection sort very well may be the algorithm of choice because it has the property of minimizing the number of swaps.

### Bubble Sort
###### How does it work?
<p>It is about the position not the element.</p>
<p>It starts from the end and moves backwards. </p>
<p>Takes the last element (let's say nth element), compares it to the one below, swapping if it is smaller and leaving as is if not. Then checks the (n-1)th element and checks it with the one below it, swapping if it is smaller and again leaving as is if not - all the way to index 0. Since along the sweep the smallest element gets pushed all the way to the beginning, the second sweep starts the same way (from the last element) but ends when comparisons reach index 1 (not index 0). The next sweep starts at the end again, and stops at index 2, so on and so forth.</p>

###### Properties
- Stable
- O(1) extra space
- O(n2) comparisons and swaps
- Adaptive: O(n) when nearly sorted

###### Notes
It has many of the same properties as insertion sort, but has slightly higher overhead. In the case of nearly sorted data, bubble sort takes O(n) time, but requires at least 2 passes through the data (whereas insertion sort requires something more like 1 pass).

<!-- ### Sort
###### What does it do?
<p></p>
<p></p>

###### Properties

###### Notes -->

<em>*Resource for "Properties" and "Notes": www.sorting-algorithms.com</em>
