//
// Tetrahedron.swift
// SpinningPolyhedra
//
// A Platonic Solid is a 3D shape where: each face is the same regular polygon, and the same number of polygons meet
// at each vertex (corner). There are only 5 of them: tetrahedron, cube, octahedron, dodecahedron, and icosahedron.
// https://www.mathsisfun.com/platonic_solids.html
//
// A tetrahedron has 4 vertices, 6 edges, and 4 triangular faces.
// https://en.wikipedia.org/wiki/Tetrahedron
//
// Vertex and index lists from: http://dmccooey.com/polyhedra/
//
// SceneKit – Drawing a line between two points (Silberz answer, 2019)
// https://stackoverflow.com/questions/21886224/scenekit-drawing-a-line-between-two-points
//
// Code from: https://github.com/aheze/CustomSCNGeometry
//
// Created by Keith Bromley on 10/8/23.
//

import Foundation
import SceneKit
import SwiftUI


final class Tetrahedron {
    
    static let C0: Float = 0.353553390593273762200422181052                 // = sqrt(2) / 4
    
    // A tetrahedron has 4 vertices, 6 edges, and 4 triangular faces:
    let vertexCount: Int = 4
    let edgeCount: Int = 6
    let faceCount: Int = 4
    
    static let circumscribedRadius: Float =  0.612372435695794524549        // = sqrt(6) / 4
    let scale: Float =  1.0 / circumscribedRadius
    
    let vertices: [SCNVector3] = [        // A tetrahedron has 4 vertices.
        SCNVector3(  C0,  -C0,   C0 ),           // vertex = 0
        SCNVector3(  C0,   C0,  -C0 ),           // vertex = 1
        SCNVector3( -C0,   C0,   C0 ),           // vertex = 2
        SCNVector3( -C0,  -C0,  -C0 )            // vertex = 3
    ]

    let indices: [UInt32] = [
        3, 3, 3, 3,                         // A tetrahedron has 4 faces, each with 3 corners
        0, 1, 2,                            // indices to vertices array for face = 0
        1, 0, 3,                            // indices to vertices array for face = 1
        2, 3, 0,                            // indices to vertices array for face = 2
        3, 2, 1                             // indices to vertices array for face = 3
    ]


    //------------------------------------------------------------------------------------------------------------------
    // let edgeStartIndices: [UInt16] = [ 0, 0, 0, 1, 1, 2 ]    // A tetrahedron has 6 edges.
    // let edgeEndIndices:   [UInt16] = [ 1, 2, 3, 2, 3, 3 ]    // A tetrahedron has 6 edges.

    let edgeStartVertices: [SCNVector3] = [
        SCNVector3(  C0,  -C0,   C0 ),        // vertex = 0
        SCNVector3(  C0,  -C0,   C0 ),        // vertex = 0
        SCNVector3(  C0,  -C0,   C0 ),        // vertex = 0
        SCNVector3(  C0,   C0,  -C0 ),        // vertex = 1
        SCNVector3(  C0,   C0,  -C0 ),        // vertex = 1
        SCNVector3( -C0,   C0,   C0 )         // vertex = 2
    ]

    let edgeEndVertices: [SCNVector3] = [
        SCNVector3(  C0,   C0,  -C0 ),        // vertex = 1
        SCNVector3( -C0,   C0,   C0 ),        // vertex = 2
        SCNVector3( -C0,  -C0,  -C0 ),        // vertex = 3
        SCNVector3( -C0,   C0,   C0 ),        // vertex = 2
        SCNVector3( -C0,  -C0,  -C0 ),        // vertex = 3
        SCNVector3( -C0,  -C0,  -C0 )         // vertex = 3
    ]


    //------------------------------------------------------------------------------------------------------------------
    // A tetrahedron has 4 faces, each with 3 corners:
    
    let faceIndices: [[UInt32]] = [
        [ 0, 1, 2 ],                        // indices to vertices array for face = 0
        [ 1, 0, 3 ],                        // indices to vertices array for face = 1
        [ 2, 3, 0 ],                        // indices to vertices array for face = 2
        [ 3, 2, 1 ]                         // indices to vertices array for face = 3
    ]
}
