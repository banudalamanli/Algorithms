## TREES

Trees are abstract data structures with linked nodes where each node points to a number of nodes (similar to linked list).
Order is not important in trees.

#### CONCEPTS:
- **Root        :** Node with no parents
- **Edge        :** Link(s) from parent to child
- **Leaf        :** Node with no child
- **Siblings    :** Nodes of same parent
- **Ancestors   :** A node's ancestors are all the nodes that are on the direct path from itself to the root node.
- **Descendants :** A node's descendants are all the nodes that it is the ancestor of.
- **Size of a node   :** n of (Self + descendants)
- **Level of a node  :** n of (Self + ascestors)
- **Height of a node :** n of descendants
- **Depth of a node  :** n of ancestors


- **Height of a tree :** The maximum height among all the nodes of the tree. Or in other words, it is the number of edges on the longest downward path between the root and a leaf
- **Depth of a tree :** The maximum depth among all the nodes of the tree <br>
*For a given tree the depth and height returns the same value.*


### BINARY TREES
A tree is called a binary tree where each node has either zero child, one child, or two children.

#### Recursive Height Function in Pseudocode

```JavaScript
function height( BinaryTree Node t ) {
  return -1 if t is a null/empty tree

  hl = height( left subtree of t )
  hr = height( right subtree of t )
  h = 1 + maximum of hl and hr
  return h
}
```
