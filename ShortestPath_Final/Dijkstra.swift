//
//  Dijkstra.swift
//  Dijkstra_ShortestPath
//
//  Created by Chandan Sarkar on 17.08.17.
//  Copyright © 2017 Chandan. All rights reserved.
//

import Foundation
import CoreLocation

public class Dijkstra {
    
    public static func getShortestPath<DijkstraGraph: Graph>(in graph: DijkstraGraph, from source: DijkstraGraph.GraphEdge.EdgeNode, to destination: DijkstraGraph.GraphEdge.EdgeNode) -> [DijkstraGraph.GraphEdge.EdgeNode] {
        
        if graph.graphNodes.count == 1 {
            return graph.graphNodes
        }

        var frontier = [Path<DijkstraGraph.GraphEdge.EdgeNode>]()
        var possiblePaths = [Path<DijkstraGraph.GraphEdge.EdgeNode>]()
        var betterPath: Path<DijkstraGraph.GraphEdge.EdgeNode>?
        /**
         Build initial frontier
         */
        //Using the source edge to create the initial frontier/paths
        for eachEdge in graph.graphEdges where eachEdge.from == source {
            
            let distance = distanceBetween(firstLocation: eachEdge.from.coordinate, andSecondLocation: eachEdge.to.coordinate)
            
            let newPath: Path = Path(distance: distance,for: nil,from: eachEdge.from, to: eachEdge.to)
            
            //Adding a new Path to frontier
            frontier.append(newPath)
        }
        
        /**
         Iterate over the frontier while frontier itself will grow and shrink
         */
        //Checking all adjacent nodes for source node. During this process frontier will grow
        //and shrink
        while frontier.count != 0 {
            
            betterPath = Path()
            var pathIndex: Int = 0
            
            // Iterating over all the Paths of current frontier
            for index in 0..<frontier.count {
                
                let itemPath: Path<DijkstraGraph.GraphEdge.EdgeNode> = frontier[index]
                
                //If condition says either we have not found a better path at this point
                //or current Path we are dealing with has better distance cost compared to current
                //better path distance
                if betterPath?.distance == 0 || itemPath.distance < (betterPath?.distance)! {
                    betterPath = itemPath
                    pathIndex = index
                }
            }
            
            //Now we again determine what are the adjacent edges of the  current better path
            //destination node
            for eachAdjacentEdgeOfCurrentBetter in graph.graphEdges where eachAdjacentEdgeOfCurrentBetter.from == betterPath?.destination {
                
                //Calculating the distance of the fromNode and toNode of each of the adjacent
                //edges of current better
                let newDistance = distanceBetween(firstLocation: eachAdjacentEdgeOfCurrentBetter.from.coordinate, andSecondLocation: eachAdjacentEdgeOfCurrentBetter.to.coordinate)
                
                //Creating reference for each new Path
                let newPath: Path<DijkstraGraph.GraphEdge.EdgeNode> = Path(distance: (betterPath!.distance + newDistance), for: betterPath, from: eachAdjacentEdgeOfCurrentBetter.from, to: eachAdjacentEdgeOfCurrentBetter.to)
                
                //Expanding the frontier by adding this new Path
                frontier.append(newPath)
            }
            
            //Preserving only those paths which have the chosen destination
            if betterPath?.destination == destination {
                possiblePaths.append(betterPath!)
            }
            
            //Removing the better path from frontier to keep things moving
            frontier.remove(at: pathIndex)
        }
        
        //Sorting the List iof shortest paths
        let sortedPath = possiblePaths.sorted(by: {firstPath, secondPath in
            return firstPath.distance < secondPath.distance
        })
        
        let filteredSortedPath = sortedPath.filter({
            $0.destination == destination
        })
        
        if filteredSortedPath.isEmpty {
            let empty: [DijkstraGraph.GraphEdge.EdgeNode] = []
            return empty
        } else {
            return nodes(for: filteredSortedPath[0], to: source)
        }
    }
    
    //Calculates the distance between two CLLocations
    private static func distanceBetween(firstLocation start: CLLocation, andSecondLocation end: CLLocation) -> Double {
        let distance = start.distance(from: end)
        return (distance/100000).rounded()
    }
    
    //Walks the Path linked list backward to create an ordered collection of nodes
    private static func nodes<NodeType: Node>(for shortestPath: Path<NodeType>?,to source: NodeType) -> [NodeType]{
        var temp = shortestPath
        var shortestNodePath = [NodeType]()
        while temp != nil {
            shortestNodePath.append((temp?.destination)!)
            temp = temp?.previous
        }
        shortestNodePath.append(source)
        return shortestNodePath.reversed()
    }
}
