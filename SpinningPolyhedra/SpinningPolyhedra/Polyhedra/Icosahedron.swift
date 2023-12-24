//
//  Icosahedron.swift
//  SpinningPolyhedra
//
//  A Platonic Solid is a 3D shape where: (1) each face is the same regular polygon, and (2) the same number of polygons meet at each vertex (corner). There are only 5 of them.
//
//  "icosa" denotes twenty
//  "hedron" denotes a solid geometry having a specified number of plane faces
//
//  An icosahedron has 12 vertices, 30 edges, and 20 equilateral-triangle faces.
//  https://en.wikipedia.org/wiki/Icosahedron
//
// Vertex and index lists from: http://dmccooey.com/polyhedra/
//
//  Code from: https://github.com/aheze/CustomSCNGeometry
//
//  Created by Keith Bromley on 10/8/23.
//

import Foundation
import SceneKit
import SwiftUI

final class Icosahedron {
    
    static let C0: Float = 0.809016994374947424102293417183                 // = (1 + sqrt(5)) / 4
    
    // An icosahedron has 12 vertices, 30 edges, and 20 equilateral-triangle faces:
    let vertexCount: Int = 12
    let edgeCount: Int = 30
    let faceCount: Int = 20

    static let circumscribedRadius: Float = 0.95105651629515357212          // = sqrt(2*(5+sqrt(5))) / 4
    let scale: Float =  1.0 / circumscribedRadius

    let vertices: [SCNVector3] = [              // An Icosahedron has 12 vertices.
         SCNVector3(   0.5,     0.0,       C0),          // vertex = 0
         SCNVector3(   0.5,     0.0,      -C0),          // vertex = 1
         SCNVector3(  -0.5,     0.0,       C0),          // vertex = 2
         SCNVector3(  -0.5,     0.0,      -C0),          // vertex = 3
         SCNVector3(    C0,     0.5,      0.0),          // vertex = 4
         SCNVector3(    C0,    -0.5,      0.0),          // vertex = 5
         SCNVector3(   -C0,     0.5,      0.0),          // vertex = 6
         SCNVector3(   -C0,    -0.5,      0.0),          // vertex = 7
         SCNVector3(   0.0,      C0,      0.5),          // vertex = 8
         SCNVector3(   0.0,      C0,     -0.5),          // vertex = 9
         SCNVector3(   0.0,     -C0,      0.5),          // vertex = 10
         SCNVector3(   0.0,     -C0,     -0.5)           // vertex = 11
    ]
    
    let indices: [UInt32] = [       // An icosahedron has 20 polygons (faces), each with 3 corners
        3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
        0,  2, 10,              // index to vertices array for face = 0
        0, 10,  5,              // index to vertices array for face = 1
        0,  5,  4,              // index to vertices array for face = 2
        0,  4,  8,              // index to vertices array for face = 3
        0,  8,  2,              // index to vertices array for face = 4
        3,  1, 11,              // index to vertices array for face = 5
        3, 11,  7,              // index to vertices array for face = 6
        3,  7,  6,              // index to vertices array for face = 7
        3,  6,  9,              // index to vertices array for face = 8
        3,  9,  1,              // index to vertices array for face = 9
        2,  6,  7,              // index to vertices array for face = 10
        2,  7, 10,              // index to vertices array for face = 11
        10, 7, 11,              // index to vertices array for face = 12
        10,11,  5,              // index to vertices array for face = 13
        5, 11,  1,              // index to vertices array for face = 14
        5,  1,  4,              // index to vertices array for face = 15
        4,  1,  9,              // index to vertices array for face = 16
        4,  9,  8,              // index to vertices array for face = 17
        8,  9,  6,              // index to vertices array for face = 18
        8,  6,  2               // index to vertices array for face = 19
    ]


    //------------------------------------------------------------------------------------------------------------------
    // An Icosahedron has 30 edges.
    //edgeStartIndices: 0, 0, 0, 0, 0, 1, 1, 1, 1, 1,    2, 2, 2, 2, 3, 3, 3, 3, 4, 4,     4, 5, 5, 6, 6, 6, 7, 7, 8,10
    //edgeEndIndices:   2, 4, 5, 8,10, 3, 4, 5, 9,11,    6, 7, 8,10, 6, 7, 9,11, 5, 8,     9,10,11, 7, 8, 9,10,11, 9,11

    let edgeStartVertices: [SCNVector3] = [
        SCNVector3(   0.5,     0.0,       C0),        // vertex = 0
        SCNVector3(   0.5,     0.0,       C0),        // vertex = 0
        SCNVector3(   0.5,     0.0,       C0),        // vertex = 0
        SCNVector3(   0.5,     0.0,       C0),        // vertex = 0
        SCNVector3(   0.5,     0.0,       C0),        // vertex = 0
        SCNVector3(   0.5,     0.0,      -C0),        // vertex = 1
        SCNVector3(   0.5,     0.0,      -C0),        // vertex = 1
        SCNVector3(   0.5,     0.0,      -C0),        // vertex = 1
        SCNVector3(   0.5,     0.0,      -C0),        // vertex = 1
        SCNVector3(   0.5,     0.0,      -C0),        // vertex = 1
        
        SCNVector3(  -0.5,     0.0,       C0),        // vertex = 2
        SCNVector3(  -0.5,     0.0,       C0),        // vertex = 2
        SCNVector3(  -0.5,     0.0,       C0),        // vertex = 2
        SCNVector3(  -0.5,     0.0,       C0),        // vertex = 2
        SCNVector3(  -0.5,     0.0,      -C0),        // vertex = 3
        SCNVector3(  -0.5,     0.0,      -C0),        // vertex = 3
        SCNVector3(  -0.5,     0.0,      -C0),        // vertex = 3
        SCNVector3(  -0.5,     0.0,      -C0),        // vertex = 3
        SCNVector3(    C0,     0.5,      0.0),        // vertex = 4
        SCNVector3(    C0,     0.5,      0.0),        // vertex = 4
        
        SCNVector3(    C0,     0.5,      0.0),        // vertex = 4
        SCNVector3(    C0,    -0.5,      0.0),        // vertex = 5
        SCNVector3(    C0,    -0.5,      0.0),        // vertex = 5
        SCNVector3(   -C0,     0.5,      0.0),        // vertex = 6
        SCNVector3(   -C0,     0.5,      0.0),        // vertex = 6
        SCNVector3(   -C0,     0.5,      0.0),        // vertex = 6
        SCNVector3(   -C0,    -0.5,      0.0),        // vertex = 7
        SCNVector3(   -C0,    -0.5,      0.0),        // vertex = 7
        SCNVector3(   0.0,      C0,      0.5),        // vertex = 8
        SCNVector3(   0.0,     -C0,      0.5)         // vertex = 10
    ]

    let edgeEndVertices: [SCNVector3] = [
        SCNVector3(  -0.5,     0.0,       C0),        // vertex = 2
        SCNVector3(    C0,     0.5,      0.0),        // vertex = 4
        SCNVector3(    C0,    -0.5,      0.0),        // vertex = 5
        SCNVector3(   0.0,      C0,      0.5),        // vertex = 8
        SCNVector3(   0.0,     -C0,      0.5),        // vertex = 10
        SCNVector3(  -0.5,     0.0,      -C0),        // vertex = 3
        SCNVector3(    C0,     0.5,      0.0),        // vertex = 4
        SCNVector3(    C0,    -0.5,      0.0),        // vertex = 5
        SCNVector3(   0.0,      C0,     -0.5),        // vertex = 9
        SCNVector3(   0.0,     -C0,     -0.5),        // vertex = 11
        
        SCNVector3(   -C0,     0.5,      0.0),        // vertex = 6
        SCNVector3(   -C0,    -0.5,      0.0),        // vertex = 7
        SCNVector3(   0.0,      C0,      0.5),        // vertex = 8
        SCNVector3(   0.0,     -C0,      0.5),        // vertex = 10
        SCNVector3(   -C0,     0.5,      0.0),        // vertex = 6
        SCNVector3(   -C0,    -0.5,      0.0),        // vertex = 7
        SCNVector3(   0.0,      C0,     -0.5),        // vertex = 9
        SCNVector3(   0.0,     -C0,     -0.5),        // vertex = 11
        SCNVector3(    C0,    -0.5,      0.0),        // vertex = 5
        SCNVector3(   0.0,      C0,      0.5),        // vertex = 8
        
        SCNVector3(   0.0,      C0,     -0.5),        // vertex = 9
        SCNVector3(   0.0,     -C0,      0.5),        // vertex = 10
        SCNVector3(   0.0,     -C0,     -0.5),        // vertex = 11
        SCNVector3(   -C0,    -0.5,      0.0),        // vertex = 7
        SCNVector3(   0.0,      C0,      0.5),        // vertex = 8
        SCNVector3(   0.0,      C0,     -0.5),        // vertex = 9
        SCNVector3(   0.0,     -C0,      0.5),        // vertex = 10
        SCNVector3(   0.0,     -C0,     -0.5),        // vertex = 11
        SCNVector3(   0.0,      C0,     -0.5),        // vertex = 9
        SCNVector3(   0.0,     -C0,     -0.5)         // vertex = 11
    ]


    //------------------------------------------------------------------------------------------------------------------
    // An Icosahedron has 20 faces, each with 3 corners (triangles):
    
    let faceIndices: [[UInt32]] = [
        [ 0,  2, 10 ],              // index to vertices array for face = 0
        [ 0, 10,  5 ],              // index to vertices array for face = 1
        [ 0,  5,  4 ],              // index to vertices array for face = 2
        [ 0,  4,  8 ],              // index to vertices array for face = 3
        [ 0,  8,  2 ],              // index to vertices array for face = 4
        [ 3,  1, 11 ],              // index to vertices array for face = 5
        [ 3, 11,  7 ],              // index to vertices array for face = 6
        [ 3,  7,  6 ],              // index to vertices array for face = 7
        [ 3,  6,  9 ],              // index to vertices array for face = 8
        [ 3,  9,  1 ],              // index to vertices array for face = 9
        [ 2,  6,  7 ],              // index to vertices array for face = 10
        [ 2,  7, 10 ],              // index to vertices array for face = 11
        [10,  7, 11 ],              // index to vertices array for face = 12
        [10, 11,  5 ],              // index to vertices array for face = 13
        [ 5, 11,  1 ],              // index to vertices array for face = 14
        [ 5,  1,  4 ],              // index to vertices array for face = 15
        [ 4,  1,  9 ],              // index to vertices array for face = 16
        [ 4,  9,  8 ],              // index to vertices array for face = 17
        [ 8,  9,  6 ],              // index to vertices array for face = 18
        [ 8,  6,  2 ]               // index to vertices array for face = 19
    ]
}
