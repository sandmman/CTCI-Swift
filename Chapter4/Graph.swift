//
//  Graph.swift
//  CTCI
//
//  Created by Aaron Liberatore on 1/5/19.
//

import Foundation

/*
 * Adjacentcy List
 */
class Graph<T> where T: Hashable {
    
    class Vertex: Equatable, CustomStringConvertible, Hashable {
        
        public let value: T
        public let index: Int
        public var edges: [Edge] = []
        
        public var description: String {
            return "Vertex: \(index) | Value: \(value)"
        }
        
        public var hashValue: Int {
            return index.hashValue
        }
        
        public init(value: T, index: Int) {
            self.value = value
            self.index = index
        }
        
        public func add(edge: Edge) {
            edges.append(edge)
        }
        
        public static func == (lhs: Graph<T>.Vertex, rhs: Graph<T>.Vertex) -> Bool {
            return lhs.value == rhs.value
        }
    }
    
    class Edge: Equatable, Hashable, CustomStringConvertible {
        
        public let from: Vertex
        public let to: Vertex
        public let weight: Double?
        
        public var description: String {
            return "Edge from \(from) : to \(to) : weight \(String(describing: weight))"
        }
        
        public var hashValue: Int {
            return from.hashValue + to.hashValue
        }
        
        public init(from: Vertex, to: Vertex, weight: Double?) {
            self.from = from
            self.to = to
            self.weight = weight
        }
        
        public static func == (lhs: Graph<T>.Edge, rhs: Graph<T>.Edge) -> Bool {
            return lhs.from == rhs.from && lhs.to == rhs.to
        }
    }
    
    private var vertices: [Vertex] = []
    
    init() {}
    
    public func createVertex(value: T) -> Vertex {
        let vertex = Vertex(value: value, index: vertices.count)
        vertices.append(vertex)
        return vertex
    }
    
    public func addDirectedEdge(from start: Vertex, to end: Vertex, weight: Double?) {
        let edge = Edge(from: start, to: end, weight: weight)
        start.add(edge: edge)
    }
    
    public func addUndirectedEdge(from start: Vertex, to end: Vertex, weight: Double?) {
        let forward = Edge(from: start, to: end, weight: weight)
        let backwards = Edge(from: end, to: start, weight: weight)
        start.add(edge: forward)
        end.add(edge: backwards)
    }
}

extension Graph {
    
    public func existsPath(from start: Vertex, to end: Vertex, visited: Set<Vertex> = Set()) -> Bool {
        
        guard !visited.contains(start) else {
            return false
        }
        
        if start == end {
            return true
        }
        
        var visited = visited
        visited.insert(start)
        
        for edge in start.edges {
            if existsPath(from: edge.to, to: end, visited: visited) {
                return true
            }
        }
        
        return false
    }
    
}

// 4.7
extension Graph {

    // Algorithm for strongly connected components. Is there a sink(s)? Is there a DAG(s)?
    public static func buildOrder(projects: [T], dependencies: [(T, T)]) -> [T]? {
        let graph = Graph<T>()
        var vertexMap = [T: Vertex]()
        
        for project in projects {
            let vertex = graph.createVertex(value: project)
            vertexMap[project] = vertex
        }
        
        for (proj1, proj2) in dependencies {
            guard let p1 = vertexMap[proj1], let p2 = vertexMap[proj2] else {
                return nil
            }
            
            graph.addDirectedEdge(from: p2, to: p1, weight: nil)
        }
        return nil
    }
}
