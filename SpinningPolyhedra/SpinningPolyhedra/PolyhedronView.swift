//
//  SpinningTetrahedronView.swift
//  SpinningPolyhedra
//
//  Created by Keith Bromley on 12/4/23.
//

import SwiftUI
import SceneKit

struct PolyhedronView: View {
    @Environment(\.colorScheme) var colorScheme

    @Binding var selectedMeshGeometry: String
    @Binding var selectedDisplayMode: String

    let scene = SCNScene()
    let cameraNode = SCNNode()

    let spinNode0 = SCNNode()        // node for spinning the selected polyhedron
    let spinNode1 = SCNNode()        // node for spinning polyhedron 1
    let spinNode2 = SCNNode()        // node for spinning polyhedron 2
    let spinNode3 = SCNNode()        // node for spinning polyhedron 3
    let spinNode4 = SCNNode()        // node for spinning polyhedron 4
    let spinNode5 = SCNNode()        // node for spinning polyhedron 5

    var solidNode = SolidNode()
    var edgesNode = EdgesNode()
    var facesNode = FacesNode()
    var radius: Float = 1.0

    let loop0 = SCNAction.repeatForever(SCNAction.rotate(by: 2.0*CGFloat.pi, around: SCNVector3(1, 0, 0), duration: 10))
    let loop1 = SCNAction.repeatForever(SCNAction.rotate(by: 2.0*CGFloat.pi, around: SCNVector3(1, 1, 0), duration: 11))
    let loop2 = SCNAction.repeatForever(SCNAction.rotate(by: 2.0*CGFloat.pi, around: SCNVector3(0, 1, 0), duration: 12))
    let loop3 = SCNAction.repeatForever(SCNAction.rotate(by: 2.0*CGFloat.pi, around: SCNVector3(0, 1, 1), duration: 13))
    let loop4 = SCNAction.repeatForever(SCNAction.rotate(by: 2.0*CGFloat.pi, around: SCNVector3(0, 0, 1), duration: 14))
    let loop5 = SCNAction.repeatForever(SCNAction.rotate(by: 2.0*CGFloat.pi, around: SCNVector3(1, 0, 1), duration: 15))

    init(selectedMeshGeometry: Binding<String>, selectedDisplayMode: Binding<String>) {

        self._selectedMeshGeometry = selectedMeshGeometry
        self._selectedDisplayMode = selectedDisplayMode

        var polyhedron: PolyhedronProtocol    // https://developer.apple.com/forums/thread/122469

        switch selectedMeshGeometry.wrappedValue {
            case "plane":               polyhedron = Plane()
            case "tetrahedron":         polyhedron = Tetrahedron()
            case "cube":                polyhedron = Cube()
            case "octahedron":          polyhedron = Octahedron()
            case "dodecahedron":        polyhedron = Dodecahedron()
            case "cuboctahedron":       polyhedron = Cuboctahedron()
            case "icosahedron":         polyhedron = Icosahedron()
            case "rhombicuboctahedron": polyhedron = Rhombicuboctahedron()
            case "truncatedIcosahedron":polyhedron = TruncatedIcosahedron()
            default:                    polyhedron = Cube()
        }

        spinNode0.position = SCNVector3(x: 0.0, y: 0.0, z: 0.0)     // spinNode0 is the farthest away from the camera
        spinNode1.position = SCNVector3(x: 0.0, y: 0.0, z: 1.0)
        spinNode2.position = SCNVector3(x: 0.0, y: 0.0, z: 1.5)
        spinNode3.position = SCNVector3(x: 0.0, y: 0.0, z: 2.0)
        spinNode4.position = SCNVector3(x: 0.0, y: 0.0, z: 2.5)
        spinNode5.position = SCNVector3(x: 0.0, y: 0.0, z: 3.0)

        let displayMode: String = selectedDisplayMode.wrappedValue

        if ( displayMode == "solid" ||
             displayMode == "solid+edges") {
            solidNode = SolidNode( polyhedron: polyhedron, radius: 1.0 )
            spinNode0.addChildNode(solidNode)
        }

        if (displayMode == "edges" ||
            displayMode == "solid+edges" ||
            displayMode == "faces+edges" ) {
            edgesNode = EdgesNode(polyhedron: polyhedron, radius: 1.0)
                spinNode0.addChildNode(edgesNode)
        }

        if (displayMode == "faces" ||
            displayMode == "faces+edges") {
                facesNode = FacesNode(polyhedron: polyhedron, mesh: selectedMeshGeometry.wrappedValue)
                spinNode0.addChildNode(facesNode)
        }

        if (displayMode == "multiSolids" ||
            displayMode == "multiSolids+multiEdges") {

            for solidNum in 0 ..< 6 {       // Render 6 spinning solids of different radii.
                switch solidNum {
                case 0:     radius = 1.00    // solidNum 0 is the biggest and farthest away
                case 1:     radius = 0.70
                case 2:     radius = 0.50
                case 3:     radius = 0.30
                case 4:     radius = 0.15
                case 5:     radius = 0.05
                default:    radius = 1.00
                }
                solidNode = SolidNode( polyhedron: polyhedron, radius: radius )

                if(solidNum == 0) { spinNode0.addChildNode(solidNode) }
                else if(solidNum == 1) { spinNode1.addChildNode(solidNode) }
                else if(solidNum == 2) { spinNode2.addChildNode(solidNode) }
                else if(solidNum == 3) { spinNode3.addChildNode(solidNode) }
                else if(solidNum == 4) { spinNode4.addChildNode(solidNode) }
                else if(solidNum == 5) { spinNode5.addChildNode(solidNode) }
            }

            if (displayMode == "multiSolids+multiEdges") {

                for solidNum in 0 ..< 6 {       // Render 6 spinning solids of different radii.
                    switch solidNum {
                    case 0:     radius = 1.00    // solidNum 0 is the biggest and farthest away
                    case 1:     radius = 0.70
                    case 2:     radius = 0.50
                    case 3:     radius = 0.30
                    case 4:     radius = 0.15
                    case 5:     radius = 0.05
                    default:    radius = 1.00
                    }
                    edgesNode = EdgesNode( polyhedron: polyhedron, radius: radius )

                    if(solidNum == 0)       { spinNode0.addChildNode(edgesNode) }
                    else if(solidNum == 1)  { spinNode1.addChildNode(edgesNode) }
                    else if(solidNum == 2)  { spinNode2.addChildNode(edgesNode) }
                    else if(solidNum == 3)  { spinNode3.addChildNode(edgesNode) }
                    else if(solidNum == 4)  { spinNode4.addChildNode(edgesNode) }
                    else if(solidNum == 5)  { spinNode5.addChildNode(edgesNode) }
                }
            }
        }

        let camera = SCNCamera()
        camera.zFar = 100
        camera.fieldOfView = 26.0                   // fieldOfView = 26 degrees
        cameraNode.camera = camera
        cameraNode.position = SCNVector3(x: 0.0, y: 0, z: 5.0)
        let constraint = SCNLookAtConstraint(target: spinNode0)
        constraint.isGimbalLockEnabled = true
        cameraNode.constraints = [constraint]

        let ambientLight = SCNLight()
        ambientLight.color = CGColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
        ambientLight.type = SCNLight.LightType.ambient
        cameraNode.light = ambientLight

        scene.rootNode.addChildNode(cameraNode) // camera attached to the rootNode

        scene.rootNode.addChildNode(spinNode0)
        scene.rootNode.addChildNode(spinNode1)
        scene.rootNode.addChildNode(spinNode2)
        scene.rootNode.addChildNode(spinNode3)
        scene.rootNode.addChildNode(spinNode4)
        scene.rootNode.addChildNode(spinNode5)

        spinNode0.runAction(loop0)
        spinNode1.runAction(loop1)
        spinNode2.runAction(loop2)
        spinNode3.runAction(loop3)
        spinNode4.runAction(loop4)
        spinNode5.runAction(loop5)
    }

    var body: some View {
        VStack {
            SceneView(
                scene: {
#if os(macOS)
                    scene.background.contents = colorScheme == .light ? NSColor.white : NSColor.black
#elseif os(iOS)
                    scene.background.contents = colorScheme == .light ? UIColor.white : UIColor.black
#endif
                    return scene
                }(),
                pointOfView: cameraNode,
                options: [
                    .allowsCameraControl,
                    .autoenablesDefaultLighting,
                ]
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
