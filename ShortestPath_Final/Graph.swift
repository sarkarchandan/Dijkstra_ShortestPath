//
//  Graph.swift
//  Dijkstra_ShortestPath
//
//  Created by Chandan Sarkar on 17.08.17.
//  Copyright © 2017 Chandan. All rights reserved.
//

import Foundation

public protocol Graph {
    associatedtype GraphEdge: Edge
    var graphNodes: [GraphEdge.EdgeNode] {get}
    var graphEdges: [GraphEdge] {get}
}

//Implementation for test purposes
class MyGraph: Graph {
    typealias Node = MyNode
    typealias Edge = MyEdge
    var graphNodes: [MyNode]
    var graphEdges: [MyEdge]
    
    init(with nodes: [MyNode], and edges: [MyEdge]) {
        graphNodes = nodes
        graphEdges = edges
    }
}
