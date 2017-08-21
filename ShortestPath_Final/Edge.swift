//
//  Edge.swift
//  ShortestPath_Final
//
//  Created by Chandan on 21.08.17.
//  Copyright © 2017 Chandan. All rights reserved.
//

import Foundation
public protocol Edge {
    associatedtype EdgeNode: Node
    var from: EdgeNode {get}
    var to: EdgeNode {get}
}

//Implementation for test purposes
class MyEdge: Edge {
    typealias Node = MyNode
    var from: Node
    var to: Node
    
    init(_ from: Node, to target: Node) {
        self.from = from
        self.to = target
    }
}
