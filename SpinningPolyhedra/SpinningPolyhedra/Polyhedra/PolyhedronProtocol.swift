//
//  Polyhedron.swift
//  SpinningPolyhedra
//
//  Assigning a class dynamically from a class name string:
//  https://developer.apple.com/forums/thread/122469
//
//  Created by Keith Bromley on 11/24/23.
//

import Foundation
import SceneKit


protocol PolyhedronProtocol: AnyObject {
    init()

    var vertexCount: Int { get }
    var vertices: [SCNVector3] { get }
    var indices: [UInt32] { get }
    var scale: Float { get }

    var edgeCount: Int { get }
    var edgeStartVertices: [SCNVector3] { get }
    var edgeEndVertices: [SCNVector3] { get }

    var faceCount: Int { get }
    var faceIndices: [[UInt32]] { get }
}

extension Plane: PolyhedronProtocol {}
extension Tetrahedron: PolyhedronProtocol {}
extension Cube: PolyhedronProtocol {}
extension Cuboctahedron: PolyhedronProtocol {}
extension Dodecahedron: PolyhedronProtocol {}
extension Icosahedron: PolyhedronProtocol {}
extension Octahedron: PolyhedronProtocol {}
extension Rhombicuboctahedron: PolyhedronProtocol {}
extension TruncatedIcosahedron: PolyhedronProtocol {}
