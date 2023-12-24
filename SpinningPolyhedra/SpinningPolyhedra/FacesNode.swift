//
//  FacesNode.swift
//  SpinningPolyhedra
//
//  Created by Keith Bromley on 7 Dec 2023.
//

import SwiftUI
import SceneKit


class FacesNode: SCNNode {

    var polyhedron: PolyhedronProtocol = Dodecahedron()           // https://developer.apple.com/forums/thread/122469
    var mesh: String = "dodecahedron"

    convenience init(polyhedron: PolyhedronProtocol, mesh: String) {
        self.init()

        for faceNum in 0 ..< polyhedron.faceCount {
            let faceMaterial = SCNMaterial()
            let myHue: Double = Double(faceNum) / Double(polyhedron.faceCount)
            
#if os(macOS)
            faceMaterial.diffuse.contents = NSColor(hue: myHue, saturation: 1.0, brightness: 1.0, alpha: 1.0)
#elseif os(iOS)
            faceMaterial.diffuse.contents = UIColor(hue: myHue, saturation: 1.0, brightness: 1.0, alpha: 1.0)
#endif
            // faceMaterial.isDoubleSided = true
            let positionSource = SCNGeometrySource(vertices: polyhedron.vertices)
            let data = Data(bytes: polyhedron.faceIndices[faceNum],
                            count: polyhedron.faceIndices[faceNum].count * MemoryLayout<UInt32>.size)

            var element = SCNGeometryElement()

            // Use triangles for Octahedron, Tetrahedron, Icosaheron; Use polygons for the rest:
            if(mesh == "octahedron" || mesh == "tetrahedron" || mesh == "icosahedron" ) {
                element = SCNGeometryElement(data: data,
                                                 primitiveType: .triangles,
                                                 primitiveCount: 1,
                                                 bytesPerIndex: MemoryLayout<UInt32>.size)
            } else {
                element = SCNGeometryElement(data: data,
                                                 primitiveType: .polygon,
                                                 primitiveCount: 1,
                                                 bytesPerIndex: MemoryLayout<UInt32>.size)
            }

            let faceGeometry = SCNGeometry(sources: [positionSource], elements: [element])
            faceGeometry.materials = [faceMaterial]
            let faceNode = SCNNode(geometry: faceGeometry)
            self.addChildNode(faceNode)
        }
        self.position = SCNVector3(x: 0, y: 0, z: 0)
        self.simdScale = SIMD3(x: polyhedron.scale, y: polyhedron.scale, z: polyhedron.scale)
    }
}

