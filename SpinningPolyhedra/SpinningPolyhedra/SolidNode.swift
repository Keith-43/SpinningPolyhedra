//
//  SolidNode.swift
//  SpinningPolyhedra
//
//  Created by Keith Bromley on 7 Dec 2023.
//

import SwiftUI
import SceneKit


class SolidNode: SCNNode {

    var solidGeometry = SCNGeometry()
    let solidMaterial = SCNMaterial()
    var polyhedron: PolyhedronProtocol = Dodecahedron()           // https://developer.apple.com/forums/thread/122469

    convenience init(polyhedron: PolyhedronProtocol, radius: Float) {
        self.init()
        self.polyhedron = polyhedron

        solidMaterial.lightingModel = .physicallyBased
        solidMaterial.metalness.contents = 1.0
        solidMaterial.roughness.contents = 0.0
        solidMaterial.diffuse.contents = CGColor(red: 0.95, green: 0.75, blue: 0.2,  alpha: 1.0)    // gold color

        solidGeometry = generateSolidGeometry()
        solidGeometry.materials = [solidMaterial]

        self.geometry = solidGeometry
        let scale1: Float = radius * polyhedron.scale
        self.simdScale = SIMD3(x: scale1, y: scale1, z: scale1)
    }


    // This function creates an SCNGeometry using vertex data:
    private func generateSolidGeometry() -> SCNGeometry {

        let positionSource = SCNGeometrySource(vertices: polyhedron.vertices)
        let data = Data(bytes: polyhedron.indices,
                 count: polyhedron.indices.count * MemoryLayout<UInt32>.size)
        let element = SCNGeometryElement(data: data,                    // Treate all faces as polygons.
                                  primitiveType: .polygon,
                                  primitiveCount: polyhedron.faceCount,
                                  bytesPerIndex: MemoryLayout<UInt32>.size)
        let solidGeometry = SCNGeometry(sources: [positionSource], elements: [element])
        return solidGeometry
    }
}
