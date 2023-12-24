//
// Octahedron.swift
// SpinningPolyhedra
//
// A Platonic Solid is a 3D shape where: each face is the same regular polygon, and the same number of polygons meet
// at each vertex (corner). There are only 5 of them: tetrahedron, cube, octahedron, dodecahedron, and icosahedron.
// https://www.mathsisfun.com/platonic_solids.html
//
// An Octahedron has 6 vertices, 12 edges, and 8 faces.
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


final class Octahedron {
    
    static let C0: Float = 0.7071067811865475244008443621048                // = sqrt(2) / 2
    
    // An Octahedron has 6 vertices, 12 edges, and 8 faces:
    let vertexCount: Int = 6
    let edgeCount: Int = 12
    let faceCount: Int = 8
    
    static let circumscribedRadius: Float = 0.70710678118654752440          // = sqrt(2) / 2
    let scale: Float =  1.0 / circumscribedRadius

    let vertices: [SCNVector3] = [              // An octahedron has 6 vertices.
        SCNVector3(  0.0, 0.0,  C0 ),           // vertex = 0
        SCNVector3(  0.0, 0.0, -C0 ),           // vertex = 1
        SCNVector3(   C0, 0.0, 0.0 ),           // vertex = 2
        SCNVector3(  -C0, 0.0, 0.0 ),           // vertex = 3
        SCNVector3(  0.0,  C0, 0.0 ),           // vertex = 4
        SCNVector3(  0.0, -C0, 0.0 )            // vertex = 5
    ]

    // An octahedron has 8 faces, each with 3 corners
    let indices: [UInt32] = [
        3, 3, 3, 3, 3, 3, 3, 3,
        0, 2, 4,
        0, 4, 3,
        0, 3, 5,
        0, 5, 2,
        1, 2, 5,
        1, 5, 3,
        1, 3, 4,
        1, 4, 2
    ]



    //------------------------------------------------------------------------------------------------------------------
    let edgeStartIndices: [UInt16] = [ 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 3, 3 ]    // An Octahedron has 12 edges.
    let edgeEndIndices:   [UInt16] = [ 2, 3, 4, 5, 2, 3, 4, 5, 4, 5, 4, 5 ]    // An Octahedron has 12 edges.

    let edgeStartVertices: [SCNVector3] = [
        SCNVector3(  0.0, 0.0,  C0 ),           // vertex = 0
        SCNVector3(  0.0, 0.0,  C0 ),           // vertex = 0
        SCNVector3(  0.0, 0.0,  C0 ),           // vertex = 0
        SCNVector3(  0.0, 0.0,  C0 ),           // vertex = 0
        SCNVector3(  0.0, 0.0, -C0 ),           // vertex = 1
        SCNVector3(  0.0, 0.0, -C0 ),           // vertex = 1
        SCNVector3(  0.0, 0.0, -C0 ),           // vertex = 1
        SCNVector3(  0.0, 0.0, -C0 ),           // vertex = 1
        SCNVector3(   C0, 0.0, 0.0 ),           // vertex = 2
        SCNVector3(   C0, 0.0, 0.0 ),           // vertex = 2
        SCNVector3(  -C0, 0.0, 0.0 ),           // vertex = 3
        SCNVector3(  -C0, 0.0, 0.0 ),           // vertex = 3
    ]

    let edgeEndVertices: [SCNVector3] = [
        SCNVector3(   C0, 0.0, 0.0 ),           // vertex = 2
        SCNVector3(  -C0, 0.0, 0.0 ),           // vertex = 3
        SCNVector3(  0.0,  C0, 0.0 ),           // vertex = 4
        SCNVector3(  0.0, -C0, 0.0 ),           // vertex = 5
        SCNVector3(   C0, 0.0, 0.0 ),           // vertex = 2
        SCNVector3(  -C0, 0.0, 0.0 ),           // vertex = 3
        SCNVector3(  0.0,  C0, 0.0 ),           // vertex = 4
        SCNVector3(  0.0, -C0, 0.0 ),           // vertex = 5
        SCNVector3(  0.0,  C0, 0.0 ),           // vertex = 4
        SCNVector3(  0.0, -C0, 0.0 ),           // vertex = 5
        SCNVector3(  0.0,  C0, 0.0 ),           // vertex = 4
        SCNVector3(  0.0, -C0, 0.0 )            // vertex = 5
    ]


    //------------------------------------------------------------------------------------------------------------------
    // An octahedron has 8 faces, each with 3 corners (triangles):
    
    let faceIndices: [[UInt32]] = [
        [ 0, 2, 4 ],               // index to vertices array for face = 0
        [ 0, 4, 3 ],               // index to vertices array for face = 1
        [ 0, 3, 5 ],               // index to vertices array for face = 2
        [ 0, 5, 2 ],               // index to vertices array for face = 3
        [ 1, 2, 5 ],               // index to vertices array for face = 4
        [ 1, 5, 3 ],               // index to vertices array for face = 5
        [ 1, 3, 4 ],               // index to vertices array for face = 6
        [ 1, 4, 2 ]                // index to vertices array for face = 7
    ]
}
