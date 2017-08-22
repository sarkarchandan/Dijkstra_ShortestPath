# Dijkstra's Shortest Path Implementation.

####  This Cocoa framework project provides an implementation of the Dijkstra's Shortest Path algorithm. Dijkstra's algorithm is a greedy algorithm that trusts on the local optimal decisions with a hope to come up with the global optimal result.

### Mainrainer:
* Chandan Sarkar
* Alexander Albert

#### In this project we have implemented Dijkstra Shortest Path algorithm in the iterative way. This project includes two modules namely, Model  and Implementation.

#### **Model** includes the below types we have defined for the implementation :
```
- Node: To have an identifier of generic type and Coordinate of type CLLocation.
- Edge: To have a source Node and a destination Node.
- Graph: To have a collection of Nodes and a collection of Edges.
- Path: Having the fields, distance(cumulative), source node, destination node and previous path.  Path type helps us with separation of concerns. Previous path helps in achieving a linked list data structure for Nodes, from start to end in the shortest path.
```
#### **Implementation** includes the main implementation of the Dijkstra's Shortest Path algorithm.

#### We have also incorporated a test nodule to provide the test cases for the implementation under following assumptions:
* Usual test case for an expected shortest path in a dense graph.
* Test case for a graph with the single node.
* Test case for a graph where the destination node is disjoint.
* Test case for an empty graph with no zero nodes or edges.
* Test case for a graph with two alternate paths with same cost.

## # To Do
#### Currently the algorithm runs in O(n^2) time. However, we could improve the running time complexity to logarithmic time using a min heap data structure as a priority queue. We will be working on that.