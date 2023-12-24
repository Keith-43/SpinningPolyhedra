//
// Cube.swift
// SpinningPolyhedra
//
// A Platonic Solid is a 3D shape where: each face is the same regular polygon, and the same number of polygons meet
// at each vertex (corner). There are only 5 of them: tetrahedron, cube, octahedron, dodecahedron, and icosahedron.
// https://www.mathsisfun.com/platonic_solids.html
//
// A cube (hexahedron) has 8 vertices, 12 edges, and 6 rectangular faces.
// https://en.wikipedia.org/wiki/Cube
//
// Vertex and index lists from: http://dmccooey.com/polyhedra/
//
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


final class Cube {

    // A cube (hexahedron) has 8 vertices, 12 edges, and 6 rectangular faces:
    let vertexCount: Int = 8
    let edgeCount: Int = 12
    let faceCount: Int = 6

    static let circumscribedRadius: Float = 0.86602540378443864676             // = sqrt(3) / 2
    let scale: Float =  1.0 / circumscribedRadius

    let vertices: [SCNVector3] = [        // A cube has 8 vertices.
        SCNVector3( 0.5,  0.5,  0.5 ),           // vertex = 0
        SCNVector3( 0.5,  0.5, -0.5 ),           // vertex = 1
        SCNVector3( 0.5, -0.5,  0.5 ),           // vertex = 2
        SCNVector3( 0.5, -0.5, -0.5 ),           // vertex = 3
        SCNVector3(-0.5,  0.5,  0.5 ),           // vertex = 4
        SCNVector3(-0.5,  0.5, -0.5 ),           // vertex = 5
        SCNVector3(-0.5, -0.5,  0.5 ),           // vertex = 6
        SCNVector3(-0.5, -0.5, -0.5 )            // vertex = 7
    ]

    let indices: [UInt32] = [
        4, 4, 4, 4, 4, 4,           // A cube has 6 polygons (faces), each with 4 corners
        0, 1, 5, 4,                 // index to vertices array for face = 0
        0, 4, 6, 2,                 // index to vertices array for face = 1
        0, 2, 3, 1,                 // index to vertices array for face = 2
        7, 3, 2, 6,                 // index to vertices array for face = 3
        7, 6, 4, 5,                 // index to vertices array for face = 4
        7, 5, 1, 3                  // index to vertices array for face = 5
    ]


    //------------------------------------------------------------------------------------------------------------------
    // let edgeStartIndices: [UInt16] = [0, 0, 0,   1, 1, 2,   2, 3, 4,   4, 5, 6]    // A cube has 12 edges.
    // let edgeEndIndices:   [UInt16] = [1, 2, 4,   3, 5, 3,   6, 7, 5,   6, 7, 7]    // A cube has 12 edges.
    
    let edgeStartVertices: [SCNVector3] = [
        SCNVector3( 0.5,  0.5,  0.5 ),         // vertex = 0
        SCNVector3( 0.5,  0.5,  0.5 ),         // vertex = 0
        SCNVector3( 0.5,  0.5,  0.5 ),         // vertex = 0
        SCNVector3( 0.5,  0.5, -0.5 ),         // vertex = 1
        SCNVector3( 0.5,  0.5, -0.5 ),         // vertex = 1
        SCNVector3( 0.5, -0.5,  0.5 ),         // vertex = 2
        SCNVector3( 0.5, -0.5,  0.5 ),         // vertex = 2
        SCNVector3( 0.5, -0.5, -0.5 ),         // vertex = 3
        SCNVector3(-0.5,  0.5,  0.5 ),         // vertex = 4
        SCNVector3(-0.5,  0.5,  0.5 ),         // vertex = 4
        SCNVector3(-0.5,  0.5, -0.5 ),         // vertex = 5
        SCNVector3(-0.5, -0.5,  0.5 )          // vertex = 6
    ]
    
    let edgeEndVertices: [SCNVector3] = [
        SCNVector3( 0.5,  0.5, -0.5 ),         // vertex = 1
        SCNVector3( 0.5, -0.5,  0.5 ),         // vertex = 2
        SCNVector3(-0.5,  0.5,  0.5 ),         // vertex = 4
        SCNVector3( 0.5, -0.5, -0.5 ),         // vertex = 3
        SCNVector3(-0.5,  0.5, -0.5 ),         // vertex = 5
        SCNVector3( 0.5, -0.5, -0.5 ),         // vertex = 3
        SCNVector3(-0.5, -0.5,  0.5 ),         // vertex = 6
        SCNVector3(-0.5, -0.5, -0.5 ),         // vertex = 7
        SCNVector3(-0.5,  0.5, -0.5 ),         // vertex = 5
        SCNVector3(-0.5, -0.5,  0.5 ),         // vertex = 6
        SCNVector3(-0.5, -0.5, -0.5 ),         // vertex = 7
        SCNVector3(-0.5, -0.5, -0.5 )          // vertex = 7
    ]


    //------------------------------------------------------------------------------------------------------------------
    // A cube has 6 polygons (faces), each with 4 corners

    let faceIndices: [[UInt32]] = [     // A cube has 6 polygons (faces), each with 4 corners
        [ 4, 0, 1, 5, 4, ],             // index to vertices array for face = 0
        [ 4, 0, 4, 6, 2, ],             // index to vertices array for face = 1
        [ 4, 0, 2, 3, 1, ],             // index to vertices array for face = 2
        [ 4, 7, 3, 2, 6, ],             // index to vertices array for face = 3
        [ 4, 7, 6, 4, 5, ],             // index to vertices array for face = 4
        [ 4, 7, 5, 1, 3  ]              // index to vertices array for face = 5
    ]
}
