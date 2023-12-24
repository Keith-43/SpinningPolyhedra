//
// Dodecahedron.swift
// SpinningPolyhedra
//
// A Platonic Solid is a 3D shape where: (1) each face is the same regular polygon, and (2) the same number of polygons meet at each vertex (corner). There are only 5 of them.
//
// "dodeca" denotes twelve
// "hedron" denotes a solid geometry having a specified number of plane faces
//
// A dodecahedron has 20 vertices, 30 edges, and 12 regular-pentagonal faces.
// https://en.wikipedia.org/wiki/Dodecahedron
//
// Vertex and index lists from: http://dmccooey.com/polyhedra/
//
// SceneKit (and Metal) only support UInt8, UInt16 and UInt32.
// https://stackoverflow.com/questions/44480111/how-to-debug-custom-geometry-in-scenekit-with-swift/44529231#44529231

// SceneKit – Drawing a line between two points (Silberz answer, 2019)
// https://stackoverflow.com/questions/21886224/scenekit-drawing-a-line-between-two-points
//
// SceneKit – Drawing a line between two points.    See answer "Swift version" by Andy Jazz.
// https://stackoverflow.com/questions/21886224/scenekit-drawing-a-line-between-two-points
//
// Code from: https://github.com/aheze/CustomSCNGeometry
//
// Created by Keith Bromley on 10/8/23.
//

import Foundation
import SceneKit
import SwiftUI


final class Dodecahedron {
    
    static let C0: Float = 0.809016994374947424102293417183             // = (1 + sqrt(5)) / 4
    static let C1: Float = 1.30901699437494742410229341718              // = (3 + sqrt(5)) / 4
    
    // A dodecahedron has 20 vertices, 30 edges, and 12 regular-pentagonal faces:
    let vertexCount: Int = 20
    let edgeCount: Int = 30
    let faceCount: Int = 12

    static let circumscribedRadius: Float = 1.4012585384440735447       // = (sqrt(3)+sqrt(15)) / 4
    let scale: Float =  1.0 / circumscribedRadius

    let vertices: [SCNVector3] = [                // A dodecahedron has 20 vertices.
        SCNVector3(  0.0,    0.5,       C1 ),            // vertex = 0
        SCNVector3(  0.0,    0.5,      -C1 ),            // vertex = 1
        SCNVector3(  0.0,   -0.5,       C1 ),            // vertex = 2
        SCNVector3(  0.0,   -0.5,      -C1 ),            // vertex = 3
        SCNVector3(   C1,    0.0,      0.5 ),            // vertex = 4
        SCNVector3(   C1,    0.0,     -0.5 ),            // vertex = 5
        SCNVector3(  -C1,    0.0,      0.5 ),            // vertex = 6
        SCNVector3(  -C1,    0.0,     -0.5 ),            // vertex = 7
        SCNVector3(  0.5,     C1,      0.0 ),            // vertex = 8
        SCNVector3(  0.5,    -C1,      0.0 ),            // vertex = 9
        SCNVector3( -0.5,     C1,      0.0 ),            // vertex = 10
        SCNVector3( -0.5,    -C1,      0.0 ),            // vertex = 11
        SCNVector3(   C0,     C0,       C0 ),            // vertex = 12
        SCNVector3(   C0,     C0,      -C0 ),            // vertex = 13
        SCNVector3(   C0,    -C0,       C0 ),            // vertex = 14
        SCNVector3(   C0,    -C0,      -C0 ),            // vertex = 15
        SCNVector3(  -C0,     C0,       C0 ),            // vertex = 16
        SCNVector3(  -C0,     C0,      -C0 ),            // vertex = 17
        SCNVector3(  -C0,    -C0,       C0 ),            // vertex = 18
        SCNVector3(  -C0,    -C0,      -C0 )             // vertex = 19
    ]
    
    let indices: [UInt32] = [
        5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,// A dodecahedron has 12 polygons (faces), each with 5 corners
        0,  2, 14,  4, 12,                 // index to vertices array for face = 0
        0, 12,  8, 10, 16,                 // index to vertices array for face = 1
        0, 16,  6, 18,  2,                 // index to vertices array for face = 2
        7,  6, 16, 10, 17,                 // index to vertices array for face = 3
        7, 17,  1,  3, 19,                 // index to vertices array for face = 4
        7, 19, 11, 18,  6,                 // index to vertices array for face = 5
        9, 11, 19,  3, 15,                 // index to vertices array for face = 6
        9, 15,  5,  4, 14,                 // index to vertices array for face = 7
        9, 14,  2, 18, 11,                 // index to vertices array for face = 8
       13,  1, 17, 10,  8,                 // index to vertices array for face = 9
       13,  8, 12,  4,  5,                 // index to vertices array for face = 10
       13,  5, 15,  3,  1                  // index to vertices array for face = 11
    ]


    //------------------------------------------------------------------------------------------------------------------
    // A dodecahedron has 30 edges:
    // edgeStartIndices:0, 0, 0, 1, 1, 1,  2, 2, 3,  3, 4, 4,  4, 5, 5, 6, 6, 6,  7, 7, 8,  8, 8, 9,  9, 9,10, 10,11,11
    // edgeEndIndices:  2,12,16, 3,13,17, 14,18,15, 19, 5,12, 14,13,15, 7,16,18, 17,19,10, 12,13,11, 14,15,16, 17,18,19

    let edgeStartVertices: [SCNVector3] = [
        SCNVector3(  0.0,    0.5,       C1 ),          // vertex = 0
        SCNVector3(  0.0,    0.5,       C1 ),          // vertex = 0
        SCNVector3(  0.0,    0.5,       C1 ),          // vertex = 0
        SCNVector3(  0.0,    0.5,      -C1 ),          // vertex = 1
        SCNVector3(  0.0,    0.5,      -C1 ),          // vertex = 1
        SCNVector3(  0.0,    0.5,      -C1 ),          // vertex = 1
        SCNVector3(  0.0,   -0.5,       C1 ),          // vertex = 2
        SCNVector3(  0.0,   -0.5,       C1 ),          // vertex = 2
        SCNVector3(  0.0,   -0.5,      -C1 ),          // vertex = 3
        SCNVector3(  0.0,   -0.5,      -C1 ),          // vertex = 3
        SCNVector3(   C1,    0.0,      0.5 ),          // vertex = 4
        SCNVector3(   C1,    0.0,      0.5 ),          // vertex = 4
        SCNVector3(   C1,    0.0,      0.5 ),          // vertex = 4
        SCNVector3(   C1,    0.0,     -0.5 ),          // vertex = 5
        SCNVector3(   C1,    0.0,     -0.5 ),          // vertex = 5
        SCNVector3(  -C1,    0.0,      0.5 ),          // vertex = 6
        SCNVector3(  -C1,    0.0,      0.5 ),          // vertex = 6
        SCNVector3(  -C1,    0.0,      0.5 ),          // vertex = 6
        SCNVector3(  -C1,    0.0,     -0.5 ),          // vertex = 7
        SCNVector3(  -C1,    0.0,     -0.5 ),          // vertex = 7
        SCNVector3(  0.5,     C1,      0.0 ),          // vertex = 8
        SCNVector3(  0.5,     C1,      0.0 ),          // vertex = 8
        SCNVector3(  0.5,     C1,      0.0 ),          // vertex = 8
        SCNVector3(  0.5,    -C1,      0.0 ),          // vertex = 9
        SCNVector3(  0.5,    -C1,      0.0 ),          // vertex = 9
        SCNVector3(  0.5,    -C1,      0.0 ),          // vertex = 9
        SCNVector3( -0.5,     C1,      0.0 ),          // vertex = 10
        SCNVector3( -0.5,     C1,      0.0 ),          // vertex = 10
        SCNVector3( -0.5,    -C1,      0.0 ),          // vertex = 11
        SCNVector3( -0.5,    -C1,      0.0 )           // vertex = 11
    ]

    let edgeEndVertices: [SCNVector3] = [
        SCNVector3(  0.0,   -0.5,       C1 ),          // vertex = 2
        SCNVector3(   C0,     C0,       C0 ),          // vertex = 12
        SCNVector3(  -C0,     C0,       C0 ),          // vertex = 16
        SCNVector3(  0.0,   -0.5,      -C1 ),          // vertex = 3
        SCNVector3(   C0,     C0,      -C0 ),          // vertex = 13
        SCNVector3(  -C0,     C0,      -C0 ),          // vertex = 17
        SCNVector3(   C0,    -C0,       C0 ),          // vertex = 14
        SCNVector3(  -C0,    -C0,       C0 ),          // vertex = 18
        SCNVector3(   C0,    -C0,      -C0 ),          // vertex = 15
        SCNVector3(  -C0,    -C0,      -C0 ),          // vertex = 19
        SCNVector3(   C1,    0.0,     -0.5 ),          // vertex = 5
        SCNVector3(   C0,     C0,       C0 ),          // vertex = 12
        SCNVector3(   C0,    -C0,       C0 ),          // vertex = 14
        SCNVector3(   C0,     C0,      -C0 ),          // vertex = 13
        SCNVector3(   C0,    -C0,      -C0 ),          // vertex = 15
        SCNVector3(  -C1,    0.0,     -0.5 ),          // vertex = 7
        SCNVector3(  -C0,     C0,       C0 ),          // vertex = 16
        SCNVector3(  -C0,    -C0,       C0 ),          // vertex = 18
        SCNVector3(  -C0,     C0,      -C0 ),          // vertex = 17
        SCNVector3(  -C0,    -C0,      -C0 ),          // vertex = 19
        SCNVector3( -0.5,     C1,      0.0 ),          // vertex = 10
        SCNVector3(   C0,     C0,       C0 ),          // vertex = 12
        SCNVector3(   C0,     C0,      -C0 ),          // vertex = 13
        SCNVector3( -0.5,    -C1,      0.0 ),          // vertex = 11
        SCNVector3(   C0,    -C0,       C0 ),          // vertex = 14
        SCNVector3(   C0,    -C0,      -C0 ),          // vertex = 15
        SCNVector3(  -C0,     C0,       C0 ),          // vertex = 16
        SCNVector3(  -C0,     C0,      -C0 ),          // vertex = 17
        SCNVector3(  -C0,    -C0,       C0 ),          // vertex = 18
        SCNVector3(  -C0,    -C0,      -C0 )           // vertex = 19
    ]


//----------------------------------------------------------------------------------------------------------------------
    //  A dodecahedron has 12 regular-pentagonal faces:
    let faceIndices: [[UInt32]] = [
        [ 5,  0,  2, 14,  4, 12 ],                 // index to vertices array for face = 0
        [ 5,  0, 12,  8, 10, 16 ],                 // index to vertices array for face = 1
        [ 5,  0, 16,  6, 18,  2 ],                 // index to vertices array for face = 2
        [ 5,  7,  6, 16, 10, 17 ],                 // index to vertices array for face = 3
        [ 5,  7, 17,  1,  3, 19 ],                 // index to vertices array for face = 4
        [ 5,  7, 19, 11, 18,  6 ],                 // index to vertices array for face = 5
        [ 5,  9, 11, 19,  3, 15 ],                 // index to vertices array for face = 6
        [ 5,  9, 15,  5,  4, 14 ],                 // index to vertices array for face = 7
        [ 5,  9, 14,  2, 18, 11 ],                 // index to vertices array for face = 8
        [ 5, 13,  1, 17, 10,  8 ],                 // index to vertices array for face = 9
        [ 5, 13,  8, 12,  4,  5 ],                 // index to vertices array for face = 10
        [ 5, 13,  5, 15,  3,  1 ]                  // index to vertices array for face = 11
    ]
}
