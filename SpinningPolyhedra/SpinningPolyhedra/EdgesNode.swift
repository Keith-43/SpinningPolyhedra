//
//  EdgesNode.swift
//  SpinningPolyhedra
//
//  Created by Keith Bromley on 7 Dec 2023.
//

import SwiftUI
import SceneKit


class EdgesNode: SCNNode {

    let edgeMaterial = SCNMaterial()
    var polyhedron: PolyhedronProtocol = Dodecahedron()           // https://developer.apple.com/forums/thread/122469

    convenience init(polyhedron: PolyhedronProtocol, radius: Float) {
        self.init()

        for edgeNum in 0 ..< polyhedron.edgeCount {
            let x1 = polyhedron.edgeStartVertices[edgeNum].x; let x2 = polyhedron.edgeEndVertices[edgeNum].x
            let y1 = polyhedron.edgeStartVertices[edgeNum].y; let y2 = polyhedron.edgeEndVertices[edgeNum].y
            let z1 = polyhedron.edgeStartVertices[edgeNum].z; let z2 = polyhedron.edgeEndVertices[edgeNum].z

            let distanceX = x2 - x1
            let distanceY = y2 - y1
            let distanceZ = z2 - z1

            let distanceSquaredX = distanceX * distanceX
            let distanceSquaredY = distanceY * distanceY
            let distanceSquaredZ = distanceZ * distanceZ

            let distance = ( distanceSquaredX + distanceSquaredY + distanceSquaredZ ).squareRoot()

#if os(macOS)
            let cylinder = SCNCylinder( radius: 0.01, height: distance )
            cylinder.radialSegmentCount = 5
            cylinder.firstMaterial?.diffuse.contents = NSColor.orange
#elseif os(iOS)
            let cylinder = SCNCylinder( radius: 0.01, height: CGFloat(distance) )
            cylinder.radialSegmentCount = 5
            cylinder.firstMaterial?.diffuse.contents = UIColor.orange
#endif

            let edgeNode = SCNNode(geometry: cylinder)
            edgeNode.position = SCNVector3( (x1 + x2) / 2, (y1 + y2) / 2, (z1 + z2) / 2 )

#if os(macOS)
            edgeNode.eulerAngles = SCNVector3(x: CGFloat.pi / 2,
                                              y: acos( distanceZ / distance ),
                                              z: atan2( distanceY, distanceX ) )
#elseif os(iOS)
            edgeNode.eulerAngles = SCNVector3(x: Float.pi / 2,
                                              y: acos( distanceZ / distance ),
                                              z: atan2( distanceY, distanceX ) )
#endif
            self.addChildNode(edgeNode)
        }
        let scale1: Float = radius * polyhedron.scale
        self.simdScale = SIMD3(x: scale1, y: scale1, z: scale1)
    }
}
