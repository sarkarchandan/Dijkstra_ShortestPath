//
//  Node.swift
//  Dijkstra_ShortestPath
//
//  Created by Chandan Sarkar on 17.08.17.
//  Copyright © 2017 Chandan. All rights reserved.
//

import Foundation
import  CoreLocation

public protocol Node: Equatable {
    associatedtype NodeIdentifier: Equatable, Hashable
    var identifier: NodeIdentifier {get}
    var coordinate: CLLocation {get}
}

//Implementation for test purposes
class MyNode: Node {
    typealias T = Int
    var identifier: Int
    var coordinate: CLLocation
    
    init(with id: T,at coordinate: CLLocation) {
        self.identifier = id
        self.coordinate = coordinate
    }
}

extension MyNode: Equatable {
    public static func == (lhs: MyNode, rhs: MyNode) -> Bool {
        guard lhs.identifier == rhs.identifier else {
            return false
        }
        guard lhs.coordinate == rhs.coordinate else {
            return false
        }
        return true
    }
}

extension MyNode: Hashable {
    public var hashValue: Int {
        return "\(identifier)".hashValue
    }
}

extension MyNode: CustomStringConvertible {
    public var description: String {
        return "\(identifier)"
    }
}
