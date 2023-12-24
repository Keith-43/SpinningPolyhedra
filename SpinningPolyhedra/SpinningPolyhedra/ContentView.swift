//
//  ContentView.swift
//  SpinningPolyhedra
//
//  Created by Keith Bromley on 12/4/23.
//

import SwiftUI


struct ContentView: View {

    @Environment(\.colorScheme) var colorScheme

    let MeshGeometry: [String] = [ "plane", "tetrahedron", "cube", "octahedron", "dodecahedron", "cuboctahedron",
                                   "icosahedron", "rhombicuboctahedron", "truncatedIcosahedron" ]

    let DisplayMode: [String] = [ "solid", "edges", "solid+edges", "faces", "faces+edges", "multiSolids", "multiSolids+multiEdges"  ]

    @State var selectedMeshGeometry: String = "dodecahedron"
    @State var selectedDisplayMode: String = "solid"

    var body: some View {
        VStack {
            Picker("MeshGeometry:", selection: $selectedMeshGeometry) {
                ForEach(MeshGeometry, id: \.self) { Text($0) }
            }
#if os(macOS)
            .pickerStyle(.radioGroup)           // 'radioGroup' is unavailable in iOS
            .horizontalRadioGroupLayout()       // 'horizontalRadioGroupLayout()' is unavailable in iOS
#endif

            PolyhedronView(selectedMeshGeometry: $selectedMeshGeometry, selectedDisplayMode: $selectedDisplayMode)

            Picker("Display Mode: ", selection: $selectedDisplayMode) {
                ForEach(DisplayMode, id: \.self) { Text($0) }
            }
#if os(macOS)
            .pickerStyle(.radioGroup)           // 'radioGroup' is unavailable in iOS
            .horizontalRadioGroupLayout()       // 'horizontalRadioGroupLayout()' is unavailable in iOS
#endif
        }  // end of VStack
    }  // end of var body: some View
}  // end of ContentView struct

