## TREES

Trees are abstract data structures with linked nodes where each node points to a
number of nodes (similar to linked list).
Order is not important in trees.

#### CONCEPTS:
<bold>Root        :</bold> Node with no parents
<bold>Edge        :</bold> Link(s) from parent to child
<bold>Leaf        :</bold> Node with no child
<bold>Siblings    :</bold> Nodes of same parent
<bold>Ancestors   :</bold> A node's ancestors are all the nodes that are on the direct path from itself to the root node.
<bold>Descendants :</bold> A node's descendants are all the nodes that it is the ancestor of.
<bold>Size of a node   :</bold> n of (Self + descendants)
<bold>Depth of a node  :</bold> n of ancestors
<bold>Height of a node :</bold> n of descendants

<bold>Height of a tree :</bold> The maximum height among all the nodes of the tree (n of descendants of Root node)


### BINARY TREES
A tree is called a binary tree where each node has either zero child, one child, or two children.

#### Recursive Height Function in Pseudocode

function height( BinaryTree Node t ) {
  return -1 if t is a null/empty tree

  hl = height( left subtree of t )
  hr = height( right subtree of t )
  h = 1 + maximum of hl and hr
  return h
}
