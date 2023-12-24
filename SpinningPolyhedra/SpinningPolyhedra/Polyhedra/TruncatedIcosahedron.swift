//
// TruncatedIcosahedron.swift
// SpinningPolyhedra
//
// A Platonic Solid is a 3D shape where: (1) each face is the same regular polygon, and (2) the same number of polygons meet at each vertex (corner). There are only 5 of them.
//
// "icosa" denotes twenty
// "hedron" denotes a solid geometry having a specified number of plane faces
//
// A truncated icosahedron has 60 vertices, 90 edges, 12 regular pentagonal faces, and 20 regular hexagonal faces.
// https://en.wikipedia.org/wiki/Truncated_icosahedron
//
// Vertex and index lists from: http://dmccooey.com/polyhedra/
//
// Helpful SceneKit Swift code examples:
// https://stackoverflow.com/questions/44922164/scngeometry-with-polygon-as-primitivetype
// https://stackoverflow.com/questions/44480111/how-to-debug-custom-geometry-in-scenekit-with-swift/44529231#44529231
// https://github.com/aheze/CustomSCNGeometry
//
// Created by Keith Bromley on 10/8/23.
//

import Foundation
import SceneKit
import SwiftUI


final class TruncatedIcosahedron {
    
    static let C0: Float = 0.809016994374947424102293417183         // = (1 + sqrt(5)) / 4
    static let C1: Float = 1.61803398874989484820458683437          // = (1 + sqrt(5)) / 2
    static let C2: Float = 1.80901699437494742410229341718          // = (5 + sqrt(5)) / 4
    static let C3: Float = 2.11803398874989484820458683437          // = (2 + sqrt(5)) / 2
    static let C4: Float = 2.427050983124842272306880251548         // = 3 * (1 + sqrt(5)) / 4

    // A truncated icosahedron has 60 vertices, 90 edges, 12 regular pentagonal faces, and 20 regular hexagonal faces:
    let vertexCount: Int = 60
    let edgeCount: Int = 90
    let faceCount: Int = 32          // We'll render only the 12 pentagonal faces. (No)

    static let circumscribedRadius: Float = 2.4780186590676155376   // = sqrt(2*(29+9*sqrt(5))) / 4
    let scale: Float =  1.0 / circumscribedRadius

    let vertices: [SCNVector3] = [               // A TruncatedIcosahedron has 60 vertices.
         SCNVector3(  0.5,   0.0,    C4),         // vertex = 0
         SCNVector3(  0.5,   0.0,   -C4),         // vertex = 1
         SCNVector3( -0.5,   0.0,    C4),         // vertex = 2
         SCNVector3( -0.5,   0.0,   -C4),         // vertex = 3
         SCNVector3(   C4,   0.5,   0.0),         // vertex = 4
         SCNVector3(   C4,  -0.5,   0.0),         // vertex = 5
         SCNVector3(  -C4,   0.5,   0.0),         // vertex = 6
         SCNVector3(  -C4,  -0.5,   0.0),         // vertex = 7
         SCNVector3(  0.0,    C4,   0.5),         // vertex = 8
         SCNVector3(  0.0,    C4,  -0.5),         // vertex = 9
         SCNVector3(  0.0,   -C4,   0.5),         // vertex = 10
         SCNVector3(  0.0,   -C4,  -0.5),         // vertex = 11
         SCNVector3(  1.0,    C0,    C3),         // vertex = 12
         SCNVector3(  1.0,    C0,   -C3),         // vertex = 13
         SCNVector3(  1.0,   -C0,    C3),         // vertex = 14
         SCNVector3(  1.0,   -C0,   -C3),         // vertex = 15
         SCNVector3( -1.0,    C0,    C3),         // vertex = 16
         SCNVector3( -1.0,    C0,   -C3),         // vertex = 17
         SCNVector3( -1.0,   -C0,    C3),         // vertex = 18
         SCNVector3( -1.0,   -C0,   -C3),         // vertex = 19
         SCNVector3(   C3,   1.0,    C0),         // vertex = 20
         SCNVector3(   C3,   1.0,   -C0),         // vertex = 21
         SCNVector3(   C3,  -1.0,    C0),         // vertex = 22
         SCNVector3(   C3,  -1.0,   -C0),         // vertex = 23
         SCNVector3(  -C3,   1.0,    C0),         // vertex = 24
         SCNVector3(  -C3,   1.0,   -C0),         // vertex = 25
         SCNVector3(  -C3,  -1.0,    C0),         // vertex = 26
         SCNVector3(  -C3,  -1.0,   -C0),         // vertex = 27
         SCNVector3(   C0,    C3,   1.0),         // vertex = 28
         SCNVector3(   C0,    C3,  -1.0),         // vertex = 29
         SCNVector3(   C0,   -C3,   1.0),         // vertex = 30
         SCNVector3(   C0,   -C3,  -1.0),         // vertex = 31
         SCNVector3(  -C0,    C3,   1.0),         // vertex = 32
         SCNVector3(  -C0,    C3,  -1.0),         // vertex = 33
         SCNVector3(  -C0,   -C3,   1.0),         // vertex = 34
         SCNVector3(  -C0,   -C3,  -1.0),         // vertex = 35
         SCNVector3(  0.5,    C1,    C2),         // vertex = 36
         SCNVector3(  0.5,    C1,   -C2),         // vertex = 37
         SCNVector3(  0.5,   -C1,    C2),         // vertex = 38
         SCNVector3(  0.5,   -C1,   -C2),         // vertex = 39
         SCNVector3( -0.5,    C1,    C2),         // vertex = 40
         SCNVector3( -0.5,    C1,   -C2),         // vertex = 41
         SCNVector3( -0.5,   -C1,    C2),         // vertex = 42
         SCNVector3( -0.5,   -C1,   -C2),         // vertex = 43
         SCNVector3(   C2,    0.5,   C1),         // vertex = 44
         SCNVector3(   C2,    0.5,  -C1),         // vertex = 45
         SCNVector3(   C2,   -0.5,   C1),         // vertex = 46
         SCNVector3(   C2,   -0.5,  -C1),         // vertex = 47
         SCNVector3(  -C2,    0.5,   C1),         // vertex = 48
         SCNVector3(  -C2,    0.5,  -C1),         // vertex = 49
         SCNVector3(  -C2,   -0.5,   C1),         // vertex = 50
         SCNVector3(  -C2,   -0.5,  -C1),         // vertex = 51
         SCNVector3(   C1,     C2,  0.5),         // vertex = 52
         SCNVector3(   C1,     C2, -0.5),         // vertex = 53
         SCNVector3(   C1,    -C2,  0.5),         // vertex = 54
         SCNVector3(   C1,    -C2, -0.5),         // vertex = 55
         SCNVector3(  -C1,     C2,  0.5),         // vertex = 56
         SCNVector3(  -C1,     C2, -0.5),         // vertex = 57
         SCNVector3(  -C1,    -C2,  0.5),         // vertex = 58
         SCNVector3(  -C1,    -C2, -0.5)          // vertex = 59
    ]

    // A TruncatedIcosahedron has 20 faces with 6 corners, and 12 faces with 5 corners:
    // let counts: [UInt8] = [ 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6,
                            // 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 ]
    
    let indices: [UInt32] = [
        6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, // We have 20 polygons (faces), each with 6 corners
        5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,                         // We have 12 polygons (faces), each with 5 corners
        
         0,  2, 18, 42, 38, 14,                     // index to vertices array for hexagon = 0
         1,  3, 17, 41, 37, 13,                     // index to vertices array for hexagon = 1
         2,  0, 12, 36, 40, 16,                     // index to vertices array for hexagon = 2
         3,  1, 15, 39, 43, 19,                     // index to vertices array for hexagon = 3
         4,  5, 23, 47, 45, 21,                     // index to vertices array for hexagon = 4
         5,  4, 20, 44, 46, 22,                     // index to vertices array for hexagon = 5
         6,  7, 26, 50, 48, 24,                     // index to vertices array for hexagon = 6
         7,  6, 25, 49, 51, 27,                     // index to vertices array for hexagon = 7
         8,  9, 33, 57, 56, 32,                     // index to vertices array for hexagon = 8
         9,  8, 28, 52, 53, 29,                     // index to vertices array for hexagon = 9
        10, 11, 31, 55, 54, 30,                     // index to vertices array for hexagon = 10
        11, 10, 34, 58, 59, 35,                     // index to vertices array for hexagon = 11
        12, 44, 20, 52, 28, 36,                     // index to vertices array for hexagon = 12
        13, 37, 29, 53, 21, 45,                     // index to vertices array for hexagon = 13
        14, 38, 30, 54, 22, 46,                     // index to vertices array for hexagon = 14
        15, 47, 23, 55, 31, 39,                     // index to vertices array for hexagon = 15
        16, 40, 32, 56, 24, 48,                     // index to vertices array for hexagon = 16
        17, 49, 25, 57, 33, 41,                     // index to vertices array for hexagon = 17
        18, 50, 26, 58, 34, 42,                     // index to vertices array for hexagon = 18
        19, 43, 35, 59, 27, 51,                     // index to vertices array for hexagon = 19
         0, 14, 46, 44, 12,                         // index to vertices array for pentagon = 0
         1, 13, 45, 47, 15,                         // index to vertices array for pentagon = 1
         2, 16, 48, 50, 18,                         // index to vertices array for pentagon = 2
         3, 19, 51, 49, 17,                         // index to vertices array for pentagon = 3
         4, 21, 53, 52, 20,                         // index to vertices array for pentagon = 4
         5, 22, 54, 55, 23,                         // index to vertices array for pentagon = 5
         6, 24, 56, 57, 25,                         // index to vertices array for pentagon = 6
         7, 27, 59, 58, 26,                         // index to vertices array for pentagon = 7
         8, 32, 40, 36, 28,                         // index to vertices array for pentagon = 8
         9, 29, 37, 41, 33,                         // index to vertices array for pentagon = 9
        10, 30, 38, 42, 34,                         // index to vertices array for pentagon = 10
        11, 35, 43, 39, 31                          // index to vertices array for pentagon = 11
    ]


    //------------------------------------------------------------------------------------------------------------------
    // A truncated icosahedron has 90 edges:
    // First 30 edgeIndices:
    // edgeStartIndices:  0, 0, 0, 1, 1, 1, 2, 2, 3, 3,   4, 4, 4, 5, 5, 6, 6, 6, 7, 7,   8, 8, 8, 9, 9,10,10,10,11,11,
    // edgeEndIndices:    2,12,14, 3,13,15,16,18,17,19,   5,20,21,22,23, 7,24,25,26,27,   9,28,32,29,33,11,30,34,31,35,
    
    // Second 30 edgeIndices:
    // edgeStartIndices: 12,12,13,13,14,14,15,15,16,16,  17,17,18,18,19,19,20,20,21,21,  22,22,23,23,24,24,25,25,26,26,
    // edgeEndIndices:   36,44,37,45,38,46,39,47,40,48,  41,49,42,50,43,51,44,52,45,53,  46,54,47,55,48,56,49,57,50,58,
    
    // Third 30 edgeIndices:
    // edgeStartIndices: 27,27,28,28,29,29,30,30,31,31,  32,32,33,33,34,34,35,35,36,37,  38,39,44,45,48,49,52,54,56,58,
    // edgeEndIndices:   51,59,36,52,37,53,38,54,39,55,  40,56,41,57,42,58,43,59,40,41,  42,43,46,47,50,51,53,55,57,59,
    
    let edgeStartVertices: [SCNVector3] = [
        SCNVector3(  0.5,   0.0,    C4),         // vertex = 0
        SCNVector3(  0.5,   0.0,    C4),         // vertex = 0
        SCNVector3(  0.5,   0.0,    C4),         // vertex = 0
        SCNVector3(  0.5,   0.0,   -C4),         // vertex = 1
        SCNVector3(  0.5,   0.0,   -C4),         // vertex = 1
        SCNVector3(  0.5,   0.0,   -C4),         // vertex = 1
        SCNVector3( -0.5,   0.0,    C4),         // vertex = 2
        SCNVector3( -0.5,   0.0,    C4),         // vertex = 2
        SCNVector3( -0.5,   0.0,   -C4),         // vertex = 3
        SCNVector3( -0.5,   0.0,   -C4),         // vertex = 3
        SCNVector3(   C4,   0.5,   0.0),         // vertex = 4
        SCNVector3(   C4,   0.5,   0.0),         // vertex = 4
        SCNVector3(   C4,   0.5,   0.0),         // vertex = 4
        SCNVector3(   C4,  -0.5,   0.0),         // vertex = 5
        SCNVector3(   C4,  -0.5,   0.0),         // vertex = 5
        SCNVector3(  -C4,   0.5,   0.0),         // vertex = 6
        SCNVector3(  -C4,   0.5,   0.0),         // vertex = 6
        SCNVector3(  -C4,   0.5,   0.0),         // vertex = 6
        SCNVector3(  -C4,  -0.5,   0.0),         // vertex = 7
        SCNVector3(  -C4,  -0.5,   0.0),         // vertex = 7
        SCNVector3(  0.0,    C4,   0.5),         // vertex = 8
        SCNVector3(  0.0,    C4,   0.5),         // vertex = 8
        SCNVector3(  0.0,    C4,   0.5),         // vertex = 8
        SCNVector3(  0.0,    C4,  -0.5),         // vertex = 9
        SCNVector3(  0.0,    C4,  -0.5),         // vertex = 9
        SCNVector3(  0.0,   -C4,   0.5),         // vertex = 10
        SCNVector3(  0.0,   -C4,   0.5),         // vertex = 10
        SCNVector3(  0.0,   -C4,   0.5),         // vertex = 10
        SCNVector3(  0.0,   -C4,  -0.5),         // vertex = 11
        SCNVector3(  0.0,   -C4,  -0.5),         // vertex = 11
        
        SCNVector3(  1.0,    C0,    C3),         // vertex = 12
        SCNVector3(  1.0,    C0,    C3),         // vertex = 12
        SCNVector3(  1.0,    C0,   -C3),         // vertex = 13
        SCNVector3(  1.0,    C0,   -C3),         // vertex = 13
        SCNVector3(  1.0,   -C0,    C3),         // vertex = 14
        SCNVector3(  1.0,   -C0,    C3),         // vertex = 14
        SCNVector3(  1.0,   -C0,   -C3),         // vertex = 15
        SCNVector3(  1.0,   -C0,   -C3),         // vertex = 15
        SCNVector3( -1.0,    C0,    C3),         // vertex = 16
        SCNVector3( -1.0,    C0,    C3),         // vertex = 16
        SCNVector3( -1.0,    C0,   -C3),         // vertex = 17
        SCNVector3( -1.0,    C0,   -C3),         // vertex = 17
        SCNVector3( -1.0,   -C0,    C3),         // vertex = 18
        SCNVector3( -1.0,   -C0,    C3),         // vertex = 18
        SCNVector3( -1.0,   -C0,   -C3),         // vertex = 19
        SCNVector3( -1.0,   -C0,   -C3),         // vertex = 19
        SCNVector3(   C3,   1.0,    C0),         // vertex = 20
        SCNVector3(   C3,   1.0,    C0),         // vertex = 20
        SCNVector3(   C3,   1.0,   -C0),         // vertex = 21
        SCNVector3(   C3,   1.0,   -C0),         // vertex = 21
        SCNVector3(   C3,  -1.0,    C0),         // vertex = 22
        SCNVector3(   C3,  -1.0,    C0),         // vertex = 22
        SCNVector3(   C3,  -1.0,   -C0),         // vertex = 23
        SCNVector3(   C3,  -1.0,   -C0),         // vertex = 23
        SCNVector3(  -C3,   1.0,    C0),         // vertex = 24
        SCNVector3(  -C3,   1.0,    C0),         // vertex = 24
        SCNVector3(  -C3,   1.0,   -C0),         // vertex = 25
        SCNVector3(  -C3,   1.0,   -C0),         // vertex = 25
        SCNVector3(  -C3,  -1.0,    C0),         // vertex = 26
        SCNVector3(  -C3,  -1.0,    C0),         // vertex = 26
        
        SCNVector3(  -C3,  -1.0,   -C0),         // vertex = 27
        SCNVector3(  -C3,  -1.0,   -C0),         // vertex = 27
        SCNVector3(   C0,    C3,   1.0),         // vertex = 28
        SCNVector3(   C0,    C3,   1.0),         // vertex = 28
        SCNVector3(   C0,    C3,  -1.0),         // vertex = 29
        SCNVector3(   C0,    C3,  -1.0),         // vertex = 29
        SCNVector3(   C0,   -C3,   1.0),         // vertex = 30
        SCNVector3(   C0,   -C3,   1.0),         // vertex = 30
        SCNVector3(   C0,   -C3,  -1.0),         // vertex = 31
        SCNVector3(   C0,   -C3,  -1.0),         // vertex = 31
        SCNVector3(  -C0,    C3,   1.0),         // vertex = 32
        SCNVector3(  -C0,    C3,   1.0),         // vertex = 32
        SCNVector3(  -C0,    C3,  -1.0),         // vertex = 33
        SCNVector3(  -C0,    C3,  -1.0),         // vertex = 33
        SCNVector3(  -C0,   -C3,   1.0),         // vertex = 34
        SCNVector3(  -C0,   -C3,   1.0),         // vertex = 34
        SCNVector3(  -C0,   -C3,  -1.0),         // vertex = 35
        SCNVector3(  -C0,   -C3,  -1.0),         // vertex = 35
        SCNVector3(  0.5,    C1,    C2),         // vertex = 36
        SCNVector3(  0.5,    C1,   -C2),         // vertex = 37
        SCNVector3(  0.5,   -C1,    C2),         // vertex = 38
        SCNVector3(  0.5,   -C1,   -C2),         // vertex = 39
        SCNVector3(   C2,    0.5,   C1),         // vertex = 44
        SCNVector3(   C2,    0.5,  -C1),         // vertex = 45
        SCNVector3(  -C2,    0.5,   C1),         // vertex = 48
        SCNVector3(  -C2,    0.5,  -C1),         // vertex = 49
        SCNVector3(   C1,     C2,  0.5),         // vertex = 52
        SCNVector3(   C1,    -C2,  0.5),         // vertex = 54
        SCNVector3(  -C1,     C2,  0.5),         // vertex = 56
        SCNVector3(  -C1,    -C2,  0.5)          // vertex = 58
    ]

    let edgeEndVertices: [SCNVector3] = [
        SCNVector3( -0.5,   0.0,    C4),         // vertex = 2
        SCNVector3(  1.0,    C0,    C3),         // vertex = 12
        SCNVector3(  1.0,   -C0,    C3),         // vertex = 14
        SCNVector3( -0.5,   0.0,   -C4),         // vertex = 3
        SCNVector3(  1.0,    C0,   -C3),         // vertex = 13
        SCNVector3(  1.0,   -C0,   -C3),         // vertex = 15
        SCNVector3( -1.0,    C0,    C3),         // vertex = 16
        SCNVector3( -1.0,   -C0,    C3),         // vertex = 18
        SCNVector3( -1.0,    C0,   -C3),         // vertex = 17
        SCNVector3( -1.0,   -C0,   -C3),         // vertex = 19
        SCNVector3(   C4,  -0.5,   0.0),         // vertex = 5
        SCNVector3(   C3,   1.0,    C0),         // vertex = 20
        SCNVector3(   C3,   1.0,   -C0),         // vertex = 21
        SCNVector3(   C3,  -1.0,    C0),         // vertex = 22
        SCNVector3(   C3,  -1.0,   -C0),         // vertex = 23
        SCNVector3(  -C4,  -0.5,   0.0),         // vertex = 7
        SCNVector3(  -C3,   1.0,    C0),         // vertex = 24
        SCNVector3(  -C3,   1.0,   -C0),         // vertex = 25
        SCNVector3(  -C3,  -1.0,    C0),         // vertex = 26
        SCNVector3(  -C3,  -1.0,   -C0),         // vertex = 27
        SCNVector3(  0.0,    C4,  -0.5),         // vertex = 9
        SCNVector3(   C0,    C3,   1.0),         // vertex = 28
        SCNVector3(  -C0,    C3,   1.0),         // vertex = 32
        SCNVector3(   C0,    C3,  -1.0),         // vertex = 29
        SCNVector3(  -C0,    C3,  -1.0),         // vertex = 33
        SCNVector3(  0.0,   -C4,  -0.5),         // vertex = 11
        SCNVector3(   C0,   -C3,   1.0),         // vertex = 30
        SCNVector3(  -C0,   -C3,   1.0),         // vertex = 34
        SCNVector3(   C0,   -C3,  -1.0),         // vertex = 31
        SCNVector3(  -C0,   -C3,  -1.0),         // vertex = 35
        
        SCNVector3(  0.5,    C1,    C2),         // vertex = 36
        SCNVector3(   C2,    0.5,   C1),         // vertex = 44
        SCNVector3(  0.5,    C1,   -C2),         // vertex = 37
        SCNVector3(   C2,    0.5,  -C1),         // vertex = 45
        SCNVector3(  0.5,   -C1,    C2),         // vertex = 38
        SCNVector3(   C2,   -0.5,   C1),         // vertex = 46
        SCNVector3(  0.5,   -C1,   -C2),         // vertex = 39
        SCNVector3(   C2,   -0.5,  -C1),         // vertex = 47
        SCNVector3( -0.5,    C1,    C2),         // vertex = 40
        SCNVector3(  -C2,    0.5,   C1),         // vertex = 48
        SCNVector3( -0.5,    C1,   -C2),         // vertex = 41
        SCNVector3(  -C2,    0.5,  -C1),         // vertex = 49
        SCNVector3( -0.5,   -C1,    C2),         // vertex = 42
        SCNVector3(  -C2,   -0.5,   C1),         // vertex = 50
        SCNVector3( -0.5,   -C1,   -C2),         // vertex = 43
        SCNVector3(  -C2,   -0.5,  -C1),         // vertex = 51
        SCNVector3(   C2,    0.5,   C1),         // vertex = 44
        SCNVector3(   C1,     C2,  0.5),         // vertex = 52
        SCNVector3(   C2,    0.5,  -C1),         // vertex = 45
        SCNVector3(   C1,     C2, -0.5),         // vertex = 53
        SCNVector3(   C2,   -0.5,   C1),         // vertex = 46
        SCNVector3(   C1,    -C2,  0.5),         // vertex = 54
        SCNVector3(   C2,   -0.5,  -C1),         // vertex = 47
        SCNVector3(   C1,    -C2, -0.5),         // vertex = 55
        SCNVector3(  -C2,    0.5,   C1),         // vertex = 48
        SCNVector3(  -C1,     C2,  0.5),         // vertex = 56
        SCNVector3(  -C2,    0.5,  -C1),         // vertex = 49
        SCNVector3(  -C1,     C2, -0.5),         // vertex = 57
        SCNVector3(  -C2,   -0.5,   C1),         // vertex = 50
        SCNVector3(  -C1,    -C2,  0.5),         // vertex = 58

        SCNVector3(  -C2,   -0.5,  -C1),         // vertex = 51
        SCNVector3(  -C1,    -C2, -0.5),         // vertex = 59
        SCNVector3(  0.5,    C1,    C2),         // vertex = 36
        SCNVector3(   C1,     C2,  0.5),         // vertex = 52
        SCNVector3(  0.5,    C1,   -C2),         // vertex = 37
        SCNVector3(   C1,     C2, -0.5),         // vertex = 53
        SCNVector3(  0.5,   -C1,    C2),         // vertex = 38
        SCNVector3(   C1,    -C2,  0.5),         // vertex = 54
        SCNVector3(  0.5,   -C1,   -C2),         // vertex = 39
        SCNVector3(   C1,    -C2, -0.5),         // vertex = 55
        SCNVector3( -0.5,    C1,    C2),         // vertex = 40
        SCNVector3(  -C1,     C2,  0.5),         // vertex = 56
        SCNVector3( -0.5,    C1,   -C2),         // vertex = 41
        SCNVector3(  -C1,     C2, -0.5),         // vertex = 57
        SCNVector3( -0.5,   -C1,    C2),         // vertex = 42
        SCNVector3(  -C1,    -C2,  0.5),         // vertex = 58
        SCNVector3( -0.5,   -C1,   -C2),         // vertex = 43
        SCNVector3(  -C1,    -C2, -0.5),         // vertex = 59
        SCNVector3( -0.5,    C1,    C2),         // vertex = 40
        SCNVector3( -0.5,    C1,   -C2),         // vertex = 41
        SCNVector3( -0.5,   -C1,    C2),         // vertex = 42
        SCNVector3( -0.5,   -C1,   -C2),         // vertex = 43
        SCNVector3(   C2,   -0.5,   C1),         // vertex = 46
        SCNVector3(   C2,   -0.5,  -C1),         // vertex = 47
        SCNVector3(  -C2,   -0.5,   C1),         // vertex = 50
        SCNVector3(  -C2,   -0.5,  -C1),         // vertex = 51
        SCNVector3(   C1,     C2, -0.5),         // vertex = 53
        SCNVector3(   C1,    -C2, -0.5),         // vertex = 55
        SCNVector3(  -C1,     C2, -0.5),         // vertex = 57
        SCNVector3(  -C1,    -C2, -0.5)          // vertex = 59
    ]


    //------------------------------------------------------------------------------------------------------------------
    //  A truncated icosahedron has 12 regular pentagonal faces, and 20 regular hexagonal faces.

    let faceIndices: [[UInt32]] = [                 // Only render the 12 pentagonal faces. (No)
        [ 6,   0,  2, 18, 42, 38, 14 ],             // index to vertices array for hexagon = 0
        [ 6,   1,  3, 17, 41, 37, 13 ],             // index to vertices array for hexagon = 1
        [ 6,   2,  0, 12, 36, 40, 16 ],             // index to vertices array for hexagon = 2
        [ 6,   3,  1, 15, 39, 43, 19 ],             // index to vertices array for hexagon = 3
        [ 6,   4,  5, 23, 47, 45, 21 ],             // index to vertices array for hexagon = 4
        [ 6,   5,  4, 20, 44, 46, 22 ],             // index to vertices array for hexagon = 5
        [ 6,   6,  7, 26, 50, 48, 24 ],             // index to vertices array for hexagon = 6
        [ 6,   7,  6, 25, 49, 51, 27 ],             // index to vertices array for hexagon = 7
        [ 6,   8,  9, 33, 57, 56, 32 ],             // index to vertices array for hexagon = 8
        [ 6,   9,  8, 28, 52, 53, 29 ],             // index to vertices array for hexagon = 9
        [ 6,  10, 11, 31, 55, 54, 30 ],             // index to vertices array for hexagon = 10
        [ 6,  11, 10, 34, 58, 59, 35 ],             // index to vertices array for hexagon = 11
        [ 6,  12, 44, 20, 52, 28, 36 ],             // index to vertices array for hexagon = 12
        [ 6,  13, 37, 29, 53, 21, 45 ],             // index to vertices array for hexagon = 13
        [ 6,  14, 38, 30, 54, 22, 46 ],             // index to vertices array for hexagon = 14
        [ 6,  15, 47, 23, 55, 31, 39 ],             // index to vertices array for hexagon = 15
        [ 6,  16, 40, 32, 56, 24, 48 ],             // index to vertices array for hexagon = 16
        [ 6,  17, 49, 25, 57, 33, 41 ],             // index to vertices array for hexagon = 17
        [ 6,  18, 50, 26, 58, 34, 42 ],             // index to vertices array for hexagon = 18
        [ 6,  19, 43, 35, 59, 27, 51 ],             // index to vertices array for hexagon = 19
        [ 5,  0, 14, 46, 44, 12 ],                  // index to vertices array for pentagon = 0
        [ 5,  1, 13, 45, 47, 15 ],                  // index to vertices array for pentagon = 1
        [ 5,  2, 16, 48, 50, 18 ],                  // index to vertices array for pentagon = 2
        [ 5,  3, 19, 51, 49, 17 ],                  // index to vertices array for pentagon = 3
        [ 5,  4, 21, 53, 52, 20 ],                  // index to vertices array for pentagon = 4
        [ 5,  5, 22, 54, 55, 23 ],                  // index to vertices array for pentagon = 5
        [ 5,  6, 24, 56, 57, 25 ],                  // index to vertices array for pentagon = 6
        [ 5,  7, 27, 59, 58, 26 ],                  // index to vertices array for pentagon = 7
        [ 5,  8, 32, 40, 36, 28 ],                  // index to vertices array for pentagon = 8
        [ 5,  9, 29, 37, 41, 33 ],                  // index to vertices array for pentagon = 9
        [ 5, 10, 30, 38, 42, 34 ],                  // index to vertices array for pentagon = 10
        [ 5, 11, 35, 43, 39, 31 ]                   // index to vertices array for pentagon = 11
    ]
}
