//
// Rhombicuboctahedron.swift
// SpinningPolyhedra
//
// A Platonic Solid is a 3D shape where: each face is the same regular polygon, and the same number of polygons meet
// at each vertex (corner). There are only 5 of them: tetrahedron, cube, octahedron, dodecahedron, and icosahedron.
// https://www.mathsisfun.com/platonic_solids.html
//
// A rhombicuboctahedron has 24 vertices, 48 edges, and 26 faces (8 triangles, 6 square, 12 rectangles)
// It is one of the 18 Archimedean solids.
// https://en.wikipedia.org/wiki/Rhombicuboctahedron
//
// Vertex and index lists from: http://dmccooey.com/polyhedra/
//
// In macOS, the x, y, and z fields in SCNVector3 are CGFloat values.  In iOS, these fields are Float values.
//
// Code from: https://github.com/aheze/CustomSCNGeometry
//
// Created by Keith Bromley on 10/8/23.
//

import Foundation
import SceneKit
import SwiftUI


final class Rhombicuboctahedron {

    static let C0: Float = 1.20710678118654752440084436210              // = (1 + sqrt(2)) / 2

    // A rhombicuboctahedron has 24 vertices, 48 edges, and 26 faces (8 triangles, 6 square, 12 rectangles):
    let vertexCount: Int = 24
    let edgeCount: Int = 48
    let faceCount: Int = 26      // We'll render only the 18 squares and rectangles. (No)

    static let circumscribedRadius: Float = 1.3989663259659067020       // = sqrt(5+2*sqrt(2)) / 2
    let scale: Float =  1.0 / circumscribedRadius

    let vertices: [SCNVector3] = [        // A cube rhombicuboctahedron has 24 vertices.
        SCNVector3( 0.5,  0.5,   C0 ),           // vertex = 0
        SCNVector3( 0.5,  0.5,  -C0 ),           // vertex = 1
        SCNVector3( 0.5, -0.5,   C0 ),           // vertex = 2
        SCNVector3( 0.5, -0.5,  -C0 ),           // vertex = 3
        SCNVector3(-0.5,  0.5,   C0 ),           // vertex = 4
        SCNVector3(-0.5,  0.5,  -C0 ),           // vertex = 5
        SCNVector3(-0.5, -0.5,   C0 ),           // vertex = 6
        SCNVector3(-0.5, -0.5,  -C0 ),           // vertex = 7
        SCNVector3(  C0,  0.5,  0.5 ),           // vertex = 8
        SCNVector3(  C0,  0.5, -0.5 ),           // vertex = 9
        SCNVector3(  C0, -0.5,  0.5 ),           // vertex = 10
        SCNVector3(  C0, -0.5, -0.5 ),           // vertex = 11
        SCNVector3( -C0,  0.5,  0.5 ),           // vertex = 12
        SCNVector3( -C0,  0.5, -0.5 ),           // vertex = 13
        SCNVector3( -C0, -0.5,  0.5 ),           // vertex = 14
        SCNVector3( -C0, -0.5, -0.5 ),           // vertex = 15
        SCNVector3( 0.5,   C0,  0.5 ),           // vertex = 16
        SCNVector3( 0.5,   C0, -0.5 ),           // vertex = 17
        SCNVector3( 0.5,  -C0,  0.5 ),           // vertex = 18
        SCNVector3( 0.5,  -C0, -0.5 ),           // vertex = 19
        SCNVector3(-0.5,   C0,  0.5 ),           // vertex = 20
        SCNVector3(-0.5,   C0, -0.5 ),           // vertex = 21
        SCNVector3(-0.5,  -C0,  0.5 ),           // vertex = 22
        SCNVector3(-0.5,  -C0, -0.5 )            // vertex = 23
    ]


    // A rhombicuboctahedron has 26 faces (18 rectangles, 8 triangles)
    let counts: [UInt8] = [ 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
                            3, 3, 3, 3, 3, 3, 3, 3 ]

    let indices: [UInt32] = [
        // A rhombicuboctahedron has 26 faces (18 rectangles, 8 triangles)
         4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 3, 3, 3, 3, 3, 3, 3, 3,
         0,  4,  6,  2,                       // index to vertices array for rectangle = 0
         1,  3,  7,  5,                       // index to vertices array for rectangle = 1
         8, 10, 11,  9,                       // index to vertices array for rectangle = 2
        12, 13, 15, 14,                       // index to vertices array for rectangle = 3
        16, 17, 21, 20,                       // index to vertices array for rectangle = 4
        18, 22, 23, 19,                       // index to vertices array for rectangle = 5
         0,  2, 10,  8,                       // index to vertices array for rectangle = 6
         0, 16, 20,  4,                       // index to vertices array for rectangle = 7
         7,  3, 19, 23,                       // index to vertices array for rectangle = 8
         7, 15, 13,  5,                       // index to vertices array for rectangle = 9
        11,  3,  1,  9,                       // index to vertices array for rectangle = 10
        11, 10, 18, 19,                       // index to vertices array for rectangle = 11
        12, 14,  6,  4,                       // index to vertices array for rectangle = 12
        12, 20, 21, 13,                       // index to vertices array for rectangle = 13
        17,  1,  5, 21,                       // index to vertices array for rectangle = 14
        17, 16,  8,  9,                       // index to vertices array for rectangle = 15
        22, 14, 15, 23,                       // index to vertices array for rectangle = 16
        22, 18,  2,  6,                       // index to vertices array for rectangle = 17
         0,  8, 16,                           // index to vertices array for triangle = 0
         1, 17,  9,                           // index to vertices array for triangle = 1
         2, 18, 10,                           // index to vertices array for triangle = 2
         3, 11, 19,                           // index to vertices array for triangle = 3
         4, 20, 12,                           // index to vertices array for triangle = 4
         5, 13, 21,                           // index to vertices array for triangle = 5
         6, 14, 22,                           // index to vertices array for triangle = 6
         7, 23, 15                            // index to vertices array for triangle = 7
    ]


    //------------------------------------------------------------------------------------------------------------------
    // A rhombicuboctahedron has 48 edges:
    //edgeStartIndices: 0, 0, 0, 0, 1, 1, 1, 1, 2, 2,   2, 3, 3, 3, 4, 4, 4, 5, 5, 5,   6, 6, 7, 7, 8, 8, 8, 9, 9,10,  10,11,12,12,12,13,13,14,14,15,  16,16,17,18,18,19,20,22
    //edgeEndIndices:   2, 4, 8,16, 3, 5, 9,17, 6,10,  18, 7,11,19, 6,12,20, 7,13,21,  14,22,15,23, 9,10,16,11,17,11,  18,19,13,14,20,15,21,15,22,23,  17,20,21,19,22,23,21,23
    
    let edgeStartVertices: [SCNVector3] = [
        SCNVector3( 0.5,  0.5,   C0 ),          // vertex = 0
        SCNVector3( 0.5,  0.5,   C0 ),          // vertex = 0
        SCNVector3( 0.5,  0.5,   C0 ),          // vertex = 0
        SCNVector3( 0.5,  0.5,   C0 ),          // vertex = 0
        SCNVector3( 0.5,  0.5,  -C0 ),          // vertex = 1
        SCNVector3( 0.5,  0.5,  -C0 ),          // vertex = 1
        SCNVector3( 0.5,  0.5,  -C0 ),          // vertex = 1
        SCNVector3( 0.5,  0.5,  -C0 ),          // vertex = 1
        SCNVector3( 0.5, -0.5,   C0 ),          // vertex = 2
        SCNVector3( 0.5, -0.5,   C0 ),          // vertex = 2
        SCNVector3( 0.5, -0.5,   C0 ),          // vertex = 2
        SCNVector3( 0.5, -0.5,  -C0 ),          // vertex = 3
        SCNVector3( 0.5, -0.5,  -C0 ),          // vertex = 3
        SCNVector3( 0.5, -0.5,  -C0 ),          // vertex = 3
        SCNVector3(-0.5,  0.5,   C0 ),          // vertex = 4
        SCNVector3(-0.5,  0.5,   C0 ),          // vertex = 4
        SCNVector3(-0.5,  0.5,   C0 ),          // vertex = 4
        SCNVector3(-0.5,  0.5,  -C0 ),          // vertex = 5
        SCNVector3(-0.5,  0.5,  -C0 ),          // vertex = 5
        SCNVector3(-0.5,  0.5,  -C0 ),          // vertex = 5
        SCNVector3(-0.5, -0.5,   C0 ),          // vertex = 6
        SCNVector3(-0.5, -0.5,   C0 ),          // vertex = 6
        SCNVector3(-0.5, -0.5,  -C0 ),          // vertex = 7
        SCNVector3(-0.5, -0.5,  -C0 ),          // vertex = 7
        SCNVector3(  C0,  0.5,  0.5 ),          // vertex = 8
        SCNVector3(  C0,  0.5,  0.5 ),          // vertex = 8
        SCNVector3(  C0,  0.5,  0.5 ),          // vertex = 8
        SCNVector3(  C0,  0.5, -0.5 ),          // vertex = 9
        SCNVector3(  C0,  0.5, -0.5 ),          // vertex = 9
        SCNVector3(  C0, -0.5,  0.5 ),          // vertex = 10
        SCNVector3(  C0, -0.5,  0.5 ),          // vertex = 10
        SCNVector3(  C0, -0.5, -0.5 ),          // vertex = 11
        SCNVector3( -C0,  0.5,  0.5 ),          // vertex = 12
        SCNVector3( -C0,  0.5,  0.5 ),          // vertex = 12
        SCNVector3( -C0,  0.5,  0.5 ),          // vertex = 12
        SCNVector3( -C0,  0.5, -0.5 ),          // vertex = 13
        SCNVector3( -C0,  0.5, -0.5 ),          // vertex = 13
        SCNVector3( -C0, -0.5,  0.5 ),          // vertex = 14
        SCNVector3( -C0, -0.5,  0.5 ),          // vertex = 14
        SCNVector3( -C0, -0.5, -0.5 ),          // vertex = 15
        SCNVector3( 0.5,   C0,  0.5 ),          // vertex = 16
        SCNVector3( 0.5,   C0,  0.5 ),          // vertex = 16
        SCNVector3( 0.5,   C0, -0.5 ),          // vertex = 17
        SCNVector3( 0.5,  -C0,  0.5 ),          // vertex = 18
        SCNVector3( 0.5,  -C0,  0.5 ),          // vertex = 18
        SCNVector3( 0.5,  -C0, -0.5 ),          // vertex = 19
        SCNVector3(-0.5,   C0,  0.5 ),          // vertex = 20
        SCNVector3(-0.5,  -C0,  0.5 )           // vertex = 22
    ]
    
    let edgeEndVertices: [SCNVector3] = [
        SCNVector3( 0.5, -0.5,   C0 ),          // vertex = 2
        SCNVector3(-0.5,  0.5,   C0 ),          // vertex = 4
        SCNVector3(  C0,  0.5,  0.5 ),          // vertex = 8
        SCNVector3( 0.5,   C0,  0.5 ),          // vertex = 16
        SCNVector3( 0.5, -0.5,  -C0 ),          // vertex = 3
        SCNVector3(-0.5,  0.5,  -C0 ),          // vertex = 5
        SCNVector3(  C0,  0.5, -0.5 ),          // vertex = 9
        SCNVector3( 0.5,   C0, -0.5 ),          // vertex = 17
        SCNVector3(-0.5, -0.5,   C0 ),          // vertex = 6
        SCNVector3(  C0, -0.5,  0.5 ),          // vertex = 10
        SCNVector3( 0.5,  -C0,  0.5 ),          // vertex = 18
        SCNVector3(-0.5, -0.5,  -C0 ),          // vertex = 7
        SCNVector3(  C0, -0.5, -0.5 ),          // vertex = 11
        SCNVector3( 0.5,  -C0, -0.5 ),          // vertex = 19
        SCNVector3(-0.5, -0.5,   C0 ),          // vertex = 6
        SCNVector3( -C0,  0.5,  0.5 ),          // vertex = 12
        SCNVector3(-0.5,   C0,  0.5 ),          // vertex = 20
        SCNVector3(-0.5, -0.5,  -C0 ),          // vertex = 7
        SCNVector3( -C0,  0.5, -0.5 ),          // vertex = 13
        SCNVector3(-0.5,   C0, -0.5 ),          // vertex = 21
        SCNVector3( -C0, -0.5,  0.5 ),          // vertex = 14
        SCNVector3(-0.5,  -C0,  0.5 ),          // vertex = 22
        SCNVector3( -C0, -0.5, -0.5 ),          // vertex = 15
        SCNVector3(-0.5,  -C0, -0.5 ),          // vertex = 23
        SCNVector3(  C0,  0.5, -0.5 ),          // vertex = 9
        SCNVector3(  C0, -0.5,  0.5 ),          // vertex = 10
        SCNVector3( 0.5,   C0,  0.5 ),          // vertex = 16
        SCNVector3(  C0, -0.5, -0.5 ),          // vertex = 11
        SCNVector3( 0.5,   C0, -0.5 ),          // vertex = 17
        SCNVector3(  C0, -0.5, -0.5 ),          // vertex = 11
        SCNVector3( 0.5,  -C0,  0.5 ),          // vertex = 18
        SCNVector3( 0.5,  -C0, -0.5 ),          // vertex = 19
        SCNVector3( -C0,  0.5, -0.5 ),          // vertex = 13
        SCNVector3( -C0, -0.5,  0.5 ),          // vertex = 14
        SCNVector3(-0.5,   C0,  0.5 ),          // vertex = 20
        SCNVector3( -C0, -0.5, -0.5 ),          // vertex = 15
        SCNVector3(-0.5,   C0, -0.5 ),          // vertex = 21
        SCNVector3( -C0, -0.5, -0.5 ),          // vertex = 15
        SCNVector3(-0.5,  -C0,  0.5 ),          // vertex = 22
        SCNVector3(-0.5,  -C0, -0.5 ),          // vertex = 23
        SCNVector3( 0.5,   C0, -0.5 ),          // vertex = 17
        SCNVector3(-0.5,   C0,  0.5 ),          // vertex = 20
        SCNVector3(-0.5,   C0, -0.5 ),          // vertex = 21
        SCNVector3( 0.5,  -C0, -0.5 ),          // vertex = 19
        SCNVector3(-0.5,  -C0,  0.5 ),          // vertex = 22
        SCNVector3(-0.5,  -C0, -0.5 ),          // vertex = 23
        SCNVector3(-0.5,   C0, -0.5 ),          // vertex = 21
        SCNVector3(-0.5,  -C0, -0.5 )           // vertex = 23
    ]


    //------------------------------------------------------------------------------------------------------------------
    // A rhombicuboctahedron has 26 faces (8 triangles, 6 square, 12 rectangles).

     let faceIndices: [[UInt32]] = [                // Only render the 18 squares and rectangles. (No)
        [ 4,  0,  4,  6,  2 ],                       // index to vertices array for rectangle = 0
        [ 4,  1,  3,  7,  5 ],                       // index to vertices array for rectangle = 1
        [ 4,  8, 10, 11,  9 ],                       // index to vertices array for rectangle = 2
        [ 4, 12, 13, 15, 14 ],                       // index to vertices array for rectangle = 3
        [ 4, 16, 17, 21, 20 ],                       // index to vertices array for rectangle = 4
        [ 4, 18, 22, 23, 19 ],                       // index to vertices array for rectangle = 5
        [ 4,  0,  2, 10,  8 ],                       // index to vertices array for rectangle = 6
        [ 4,  0, 16, 20,  4 ],                       // index to vertices array for rectangle = 7
        [ 4,  7,  3, 19, 23 ],                       // index to vertices array for rectangle = 8
        [ 4,  7, 15, 13,  5 ],                       // index to vertices array for rectangle = 9
        [ 4, 11,  3,  1,  9 ],                       // index to vertices array for rectangle = 10
        [ 4, 11, 10, 18, 19 ],                       // index to vertices array for rectangle = 11
        [ 4, 12, 14,  6,  4 ],                       // index to vertices array for rectangle = 12
        [ 4, 12, 20, 21, 13 ],                       // index to vertices array for rectangle = 13
        [ 4, 17,  1,  5, 21 ],                       // index to vertices array for rectangle = 14
        [ 4, 17, 16,  8,  9 ],                       // index to vertices array for rectangle = 15
        [ 4, 22, 14, 15, 23 ],                       // index to vertices array for rectangle = 16
        [ 4, 22, 18,  2,  6 ],                       // index to vertices array for rectangle = 17
        [ 3,  0,  8, 16 ],                           // index to vertices array for triangle = 0
        [ 3,  1, 17,  9 ],                           // index to vertices array for triangle = 1
        [ 3,  2, 18, 10 ],                           // index to vertices array for triangle = 2
        [ 3,  3, 11, 19 ],                           // index to vertices array for triangle = 3
        [ 3,  4, 20, 12 ],                           // index to vertices array for triangle = 4
        [ 3,  5, 13, 21 ],                           // index to vertices array for triangle = 5
        [ 3,  6, 14, 22 ],                           // index to vertices array for triangle = 6
        [ 3,  7, 23, 15 ]                            // index to vertices array for triangle = 7
     ]
}
