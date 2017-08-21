//
//  Path.swift
//  ShortestPath_Final
//
//  Created by Chandan on 21.08.17.
//  Copyright © 2017 Chandan. All rights reserved.
//

import Foundation
class Path<Node> {
    let distance: Double
    let previous: Path?
    let source: Node?
    let destination: Node?
    
    init(distance dist: Double, for path: Path? = nil, from source: Node?, to destination: Node?) {
        distance = dist
        previous = path
        self.source = source
        self.destination = destination
    }
    
    init() {
        distance = 0
        previous = nil
        source = nil
        destination = nil
    }
}

extension Path: CustomStringConvertible {
    public var description: String {
        return "\(String(describing: source)) : \(String(describing: destination)) : \(String(describing: distance)))"
    }
}
