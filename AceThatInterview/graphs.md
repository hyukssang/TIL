# Graphs
A collection of nodes with edges between them

## Characteristics
- Can be either **directed** (one-way) or **undirected** (two-way).
- Might consist of multiple isolated subgraphs. If there is a path between every pair of vertices, it's called a **connected graph**.
- Can also have cycles, and an **acyclic graph** is one without cycles.

## Simple class definition for a graph node
```cpp
class Graph{
	Node[] nodes;
}
class Node{
	string name;
	Node[] children;
}
```

## Types of Graphs
### Adjacency List
A graph in which every vertex stores a list of adjacent vertices. In an undirected graph, an edge like (a, b) would be stored twice. Once in (a, b), another in (b, a)

You don't necessarily need any additional classes to represent a graph. An array (or a hash table) of lists (arrays, linked lists, etc.) can store the adjacency list. But, this isn't quite as clean, and so we tend to use node classes. 

### Adjacency Matrices
An NxN boolean matrix (where N is the number of nodes), where a `true` value at `matrix[i][j]` indicates an edge from node i to node j.

In an undirected graph, an adjacency matrix will be symmetric. In a directed graph, it will not (necessarily) be. 

The same graph algorithms that are used on adjacency lists can be performed with adjacency matrices, but they may be somewhat less efficient. For example, when iterating through the neighbors of a node, in the adjacency list representation, we simply need to iterate through a list, while in the adjacency matrix representation, we need to iterate through all the nodes.

## Graph Search
For demonstration of the graph searches visit: [Visualgo](https://visualgo.net/)
### Depth First Search (DFS)
We start at the root (or arbitrarily selected node) and explore each branch completely before moving onto the next branch.

Preferred if we want to visit every node in the graph

Pseudocode for DFS:
```
void search(Node root){
	if(root == null)
		return;
	visit(root);
	root.visited = true;
	for each (Node n in root.adjacent){
		if(n.visited == false){
			search(n);
		}
	}
}
```

### Breadth First Search (BFS)
We start at the root (or another arbitrarily selected node) and explore each neighbor before going on to any of their children.

Preferred if we want to find the shortest path (or just any path) between two nodes. 

Pseudocode for BFS (Many people falsely assume that BFS is recursive. It's not. It uses a queue):
```
void search(Node root){
	Queue queue = new Queue();
	root.marked = true;
	queue.enqueue(root);
	
	while(!queue.isEmpty()){
		Node r = queue.dequeue();
		visit(r);
		foreach (Node n in r.adjacent){
			if(n.marked == false){
				n.marked = true;
				queue.enqueue(n);
			}
		}
	}
}
```

### Bidirectional Search
Bidirectional Search is used to find the shortest path between a source and destination node. It operates by essentially running two simultaneous BFS, one from each node. When the two paths collide, we have found a path.

#### Run time 
In traditional BFS, we would search up to k nodes in the first level of the search. In the second level, we would search up to k nodes for each of those first k nodes. so k^2 nodes total. We would do this for d times, so that's O(k^d) nodes.

In bidirectional search, we have two searches that collide after approximately d/2 levels. The search from each side visits approximately k^(d/2). In total we would have something like 2k^(d/2), or O(k^(d/2)) nodes. 

Note that this is a huge improvement, as originally it was:
k^d = (k^(d/2)) * (k^(d/2))
And bidirectional search is faster by a factor of k^(d/2)

## Reference
- Cracking the Coding Interview by Gayle LaakMann McDowell

