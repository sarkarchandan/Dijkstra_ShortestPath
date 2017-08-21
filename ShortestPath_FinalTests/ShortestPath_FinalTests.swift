//
//  Dijkstra_ShortestPathTests.swift
//  Dijkstra_ShortestPathTests
//
//  Created by Chandan Sarkar on 17.08.17.
//  Copyright © 2017 Chandan. All rights reserved.
//

import XCTest
import CoreLocation
@testable import ShortestPath_Final

class Dijkstra_ShortestPathTests: XCTestCase {
    
    var node_1: MyNode!
    var node_4: MyNode!
    var node_6: MyNode!
    var node_3: MyNode!
    var node_9: MyNode!
    var node_15: MyNode!
    
    var edge_1_4: MyEdge!
    var edge_1_6: MyEdge!
    var edge_4_6: MyEdge!
    var edge_4_3: MyEdge!
    var edge_6_9: MyEdge!
    var edge_3_9: MyEdge!
    var edge_3_15: MyEdge!
    var edge_9_15: MyEdge!
    
    
    var shortestNodePath: [MyNode]!
//    var singleNodeGraph: MyGraph!
    
    //Test setup
    override func setUp() {
        super.setUp()
        node_1 = MyNode(with: 1, at: CLLocation(latitude: 37.2, longitude: 22.9))
        node_4 = MyNode(with: 4, at: CLLocation(latitude: 25.8, longitude: 18.7))
        node_6 = MyNode(with: 6, at: CLLocation(latitude: 34.2, longitude: 39.8))
        node_3 = MyNode(with: 3, at: CLLocation(latitude: 19.5, longitude: 29.3))
        node_9 = MyNode(with: 9, at: CLLocation(latitude: 12.8, longitude: 27.8))
        node_15 = MyNode(with: 15, at: CLLocation(latitude: 39.0, longitude: 49.8))
        
        edge_1_4 = MyEdge(node_1, to: node_4)
        edge_1_6 = MyEdge(node_1, to: node_6)
        edge_4_6 = MyEdge(node_4, to: node_6)
        edge_4_3 = MyEdge(node_4, to: node_3)
        edge_6_9 = MyEdge(node_6, to: node_9)
        edge_3_9 = MyEdge(node_3, to: node_9)
        edge_3_15 = MyEdge(node_3, to: node_15)
        edge_9_15 = MyEdge(node_9, to: node_15)
        
        
//        let singleNodeGraphNodeList: [MyNode] = [node_1]
//        let singleNodeGraphEdgeList: [MyEdge] = []
//        singleNodeGraph = MyGraph(with: singleNodeGraphNodeList, and: singleNodeGraphEdgeList)
        
        
    }
    
    override func tearDown() {
        super.tearDown()
        print("Nothing to tear down...")
    }
    
    //Test function for the Dijkstra Shortest Path implementation
    func testDijkstraShortestPath(){
        //Given
        let nodeList: [MyNode] = [node_1,node_4,node_6,node_3,node_9,node_15]
        let edgeList: [MyEdge] = [edge_1_4,edge_1_6,edge_4_6,edge_4_3,edge_6_9,edge_3_9,edge_3_15,edge_9_15]
        let graph = MyGraph(with: nodeList, and: edgeList)
        let fromNode = node_1!
        let toNode = node_15!
        //When
        let actualResult = Dijkstra.getShortestPath(in: graph, from: fromNode, to: toNode)
        //Then
        let expectedResult: [MyNode] = [node_1,node_4,node_3,node_15]
        
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testDijkstraForSingleNode() {
        //Given
        let singleNodeGraphNodeList: [MyNode] = [node_1]
        let singleNodeGraphEdgeList: [MyEdge] = []
        let singleNodeGraph = MyGraph(with: singleNodeGraphNodeList, and: singleNodeGraphEdgeList)
        let fromNode = node_1!
        let toNode = node_1!
        //When
        let actualResult = Dijkstra.getShortestPath(in: singleNodeGraph, from: fromNode, to: toNode)
        //Then
        let expectedResult = [node_1!]

        XCTAssertEqual(actualResult, expectedResult)
   }
    
    func testDijkstraCouldNotReachDestination() {
        //Given
        let nodeList: [MyNode] = [node_1,node_4,node_6,node_3,node_9,node_15]
        let edgeList: [MyEdge] = [edge_1_4,edge_1_6,edge_4_6,edge_4_3,edge_6_9,edge_3_9]
        let graph = MyGraph(with: nodeList, and: edgeList)
        let startNode = node_1!
        let targetNode = node_15!
        //When
        let actualResult = Dijkstra.getShortestPath(in: graph, from: startNode, to: targetNode)
        //Then
        let expectedResult: [MyNode] = []
        
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testDijkstraWithEmptyGraph() {
        //Given
        let nodeList: [MyNode] = []
        let edgeList: [MyEdge] = []
        let graph = MyGraph(with: nodeList, and: edgeList)
        let startNode = node_1!
        let targetNode = node_15!
        //When
        let actualResult = Dijkstra.getShortestPath(in: graph, from: startNode, to: targetNode)
        //Then
        let expectedResult: [MyNode] = []
        
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testDijkstraWithToSolutionsWithSameLength() {
        //Given
        let startNode = MyNode(with: 100, at: CLLocation(latitude: 10.0, longitude: 10.0))
        let upperNode = MyNode(with: 101, at: CLLocation(latitude: 14.0, longitude: 15.0))
        let lowerNode = MyNode(with: 102, at: CLLocation(latitude: 16.0, longitude: 5.0))
        let endNode = MyNode(with: 103, at: CLLocation(latitude: 20.0, longitude: 10.0))
        let startUpperEdge = MyEdge(startNode, to: upperNode)
        let startLowerEdge = MyEdge(startNode, to: lowerNode)
        let upperEndEdge = MyEdge(upperNode, to: endNode)
        let lowerEndEdge = MyEdge(lowerNode, to: endNode)
        let nodeList: [MyNode] = [startNode, upperNode, lowerNode, endNode]
        let edgeList: [MyEdge] = [startUpperEdge, startLowerEdge, upperEndEdge, lowerEndEdge]
        let graph = MyGraph(with: nodeList, and: edgeList)
        //When
        let actualResult = Dijkstra.getShortestPath(in: graph, from: startNode, to: endNode)
        //Then
        let expectedResult: [MyNode] = [startNode, upperNode, endNode]
        
        XCTAssertEqual(actualResult, expectedResult)
    }
    
}
