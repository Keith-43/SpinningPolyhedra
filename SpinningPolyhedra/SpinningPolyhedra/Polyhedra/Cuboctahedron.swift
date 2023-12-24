//
// Cuboctahedron.swift
// SpinningPolyhedra
//
// A Platonic Solid is a 3D shape where: each face is the same regular polygon, and the same number of polygons meet
// at each vertex (corner). There are only 5 of them: tetrahedron, cube, octahedron, dodecahedron, and icosahedron.
// https://www.mathsisfun.com/platonic_solids.html
//
// A Cuboctahedron has 12 vertices, 24 edges, and 14 faces (8 equilateral triangles and 6 squares).
// A Cuboctahedron is a cube whose eight corners have been sliced off.
// https://en.wikipedia.org/wiki/Cuboctahedron
//
// Vertex and index lists from: http://dmccooey.com/polyhedra/
//
// Code from: https://github.com/aheze/CustomSCNGeometry
//
// Created by Keith Bromley on 10/8/23.
//

import Foundation
import SceneKit
import SwiftUI


final class Cuboctahedron {
    
    static let C0: Float = 0.7071067811865475244008443621048            // = sqrt(2) / 2
    
    // A Cuboctahedron has 12 vertices, 24 edges, and 14 faces (8 equilateral triangles and 6 squares):
    let vertexCount: Int = 12
    let edgeCount: Int = 24
    let faceCount: Int = 14          // We'll render only the 6 square faces. (No)

    static let circumscribedRadius: Float = 1.0
    let scale: Float =  1.0 / circumscribedRadius

    let vertices: [SCNVector3] = [        // A cuboctahedron has 12 vertices.
        SCNVector3(  C0, 0.0,  C0 ),             // vertex = 0
        SCNVector3(  C0, 0.0, -C0 ),             // vertex = 1
        SCNVector3( -C0, 0.0,  C0 ),             // vertex = 2
        SCNVector3( -C0, 0.0, -C0 ),             // vertex = 3
        SCNVector3(  C0,  C0, 0.0 ),             // vertex = 4
        SCNVector3(  C0, -C0, 0.0 ),             // vertex = 5
        SCNVector3( -C0,  C0, 0.0 ),             // vertex = 6
        SCNVector3( -C0, -C0, 0.0 ),             // vertex = 7
        SCNVector3( 0.0,  C0,  C0 ),             // vertex = 8
        SCNVector3( 0.0,  C0, -C0 ),             // vertex = 9
        SCNVector3( 0.0, -C0,  C0 ),             // vertex = 10
        SCNVector3( 0.0, -C0, -C0 )              // vertex = 11
    ]

    let indices: [UInt32] = [
        4, 4, 4, 4, 4, 4, 3, 3, 3, 3, 3, 3, 3, 3,   // A cuboctahedron has 14 faces (6 square, 8 triangles)
        0,  5,  1,  4,                              // index to vertices array for square = 0
        0,  8,  2, 10,                              // index to vertices array for square = 1
        7,  2,  6,  3,                              // index to vertices array for square = 2
        7, 11,  5, 10,                              // index to vertices array for square = 3
        9,  1, 11,  3,                              // index to vertices array for square = 4
        9,  6,  8,  4,                              // index to vertices array for square = 5
        0,  4,  8,                                  // index to vertices array for triangle = 0
        1,  5, 11,                                  // index to vertices array for triangle = 1
        2,  7, 10,                                  // index to vertices array for triangle = 2
        3,  6,  9,                                  // index to vertices array for triangle = 3
        4,  1,  9,                                  // index to vertices array for triangle = 4
        5,  0, 10,                                  // index to vertices array for triangle = 5
        6,  2,  8,                                  // index to vertices array for triangle = 6
        7,  3, 11                                   // index to vertices array for triangle = 7
    ]


    //------------------------------------------------------------------------------------------------------------------
    // A Cuboctahedron has 24 edges:
    // edgeStartIndices: 0, 0, 0, 0, 1, 1, 1, 1, 2, 2,   2, 2, 3, 3, 3, 3, 4, 4, 5, 5,   6, 6, 7, 7
    // edgeEndIndices:   4, 5, 8,10, 4, 5, 9,11, 6, 7,   8,10, 6, 7, 9,11, 8, 9,10,11,   8, 9,10,11
     
    let edgeStartVertices: [SCNVector3] = [
        SCNVector3(  C0, 0.0,  C0 ),            // vertex = 0
        SCNVector3(  C0, 0.0,  C0 ),            // vertex = 0
        SCNVector3(  C0, 0.0,  C0 ),            // vertex = 0
        SCNVector3(  C0, 0.0,  C0 ),            // vertex = 0
        SCNVector3(  C0, 0.0, -C0 ),            // vertex = 1
        SCNVector3(  C0, 0.0, -C0 ),            // vertex = 1
        SCNVector3(  C0, 0.0, -C0 ),            // vertex = 1
        SCNVector3(  C0, 0.0, -C0 ),            // vertex = 1
        SCNVector3( -C0, 0.0,  C0 ),            // vertex = 2
        SCNVector3( -C0, 0.0,  C0 ),            // vertex = 2
        SCNVector3( -C0, 0.0,  C0 ),            // vertex = 2
        SCNVector3( -C0, 0.0,  C0 ),            // vertex = 2
        SCNVector3( -C0, 0.0, -C0 ),            // vertex = 3
        SCNVector3( -C0, 0.0, -C0 ),            // vertex = 3
        SCNVector3( -C0, 0.0, -C0 ),            // vertex = 3
        SCNVector3( -C0, 0.0, -C0 ),            // vertex = 3
        SCNVector3(  C0,  C0, 0.0 ),            // vertex = 4
        SCNVector3(  C0,  C0, 0.0 ),            // vertex = 4
        SCNVector3(  C0, -C0, 0.0 ),            // vertex = 5
        SCNVector3(  C0, -C0, 0.0 ),            // vertex = 5
        SCNVector3( -C0,  C0, 0.0 ),            // vertex = 6
        SCNVector3( -C0,  C0, 0.0 ),            // vertex = 6
        SCNVector3( -C0, -C0, 0.0 ),            // vertex = 7
        SCNVector3( -C0, -C0, 0.0 )             // vertex = 7
    ]

    let edgeEndVertices: [SCNVector3] = [
        SCNVector3(  C0,  C0, 0.0 ),            // vertex = 4
        SCNVector3(  C0, -C0, 0.0 ),            // vertex = 5
        SCNVector3( 0.0,  C0,  C0 ),            // vertex = 8
        SCNVector3( 0.0, -C0,  C0 ),            // vertex = 10
        SCNVector3(  C0,  C0, 0.0 ),            // vertex = 4
        SCNVector3(  C0, -C0, 0.0 ),            // vertex = 5
        SCNVector3( 0.0,  C0, -C0 ),            // vertex = 9
        SCNVector3( 0.0, -C0, -C0 ),            // vertex = 11
        SCNVector3( -C0,  C0, 0.0 ),            // vertex = 6
        SCNVector3( -C0, -C0, 0.0 ),            // vertex = 7
        SCNVector3( 0.0,  C0,  C0 ),            // vertex = 8
        SCNVector3( 0.0, -C0,  C0 ),            // vertex = 10
        SCNVector3( -C0,  C0, 0.0 ),            // vertex = 6
        SCNVector3( -C0, -C0, 0.0 ),            // vertex = 7
        SCNVector3( 0.0,  C0, -C0 ),            // vertex = 9
        SCNVector3( 0.0, -C0, -C0 ),            // vertex = 11
        SCNVector3( 0.0,  C0,  C0 ),            // vertex = 8
        SCNVector3( 0.0,  C0, -C0 ),            // vertex = 9
        SCNVector3( 0.0, -C0,  C0 ),            // vertex = 10
        SCNVector3( 0.0, -C0, -C0 ),            // vertex = 11
        SCNVector3( 0.0,  C0,  C0 ),            // vertex = 8
        SCNVector3( 0.0,  C0, -C0 ),            // vertex = 9
        SCNVector3( 0.0, -C0,  C0 ),            // vertex = 10
        SCNVector3( 0.0, -C0, -C0 )             // vertex = 11
    ]


    //------------------------------------------------------------------------------------------------------------------
    // A cuboctahedron has 14 faces (6 square, 8 triangles)

    let faceIndices: [[UInt32]] = [         // We'll render only the 6 square faces. (No)

        [ 4, 0,  5,  1,   4 ],                              // index to vertices array for square = 0
        [ 4, 0,  8,  2,  10 ],                              // index to vertices array for square = 1
        [ 4, 7,  2,  6,   3 ],                              // index to vertices array for square = 2
        [ 4, 7, 11,  5,  10 ],                              // index to vertices array for square = 3
        [ 4, 9,  1, 11,   3 ],                              // index to vertices array for square = 4
        [ 4, 9,  6,  8,   4 ],                              // index to vertices array for square = 5
        [ 3,  0,  4,  8 ],                                  // index to vertices array for triangle = 0
        [ 3,  1,  5, 11 ],                                  // index to vertices array for triangle = 1
        [ 3,  2,  7, 10 ],                                  // index to vertices array for triangle = 2
        [ 3,  3,  6,  9 ],                                  // index to vertices array for triangle = 3
        [ 3,  4,  1,  9 ],                                  // index to vertices array for triangle = 4
        [ 3,  5,  0, 10 ],                                  // index to vertices array for triangle = 5
        [ 3,  6,  2,  8 ],                                  // index to vertices array for triangle = 6
        [ 3,  7,  3, 11 ]                                   // index to vertices array for triangle = 7
    ]
}
