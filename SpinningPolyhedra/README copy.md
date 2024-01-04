# SpinningPolyhedra

SpinningPolyhedra is an open-source multi-platform app (using SwiftUI, Swift, and Xcode) to provide sample code of what can be done using Apple's' SceneKit API. Currently it renders various spinning polyhedra. 

This app runs on macOS, iOS, and iPadOS devices. The source code can be downloaded [(here)](https://github.com/Keith-43/SpinningPolyhedra) . 

The ContentView struct provides the user interface to the app.

It provides a top toolbar allowing the user to select the mesh geometry she wants to display.  The nine options are:
            Plane,
            Tetrahedron,
            Cube,
            Octahedron,
            Dodecahedron,
            Cuboctahedron,
            Icosahedron,
            Rhombicuboctahedron, and
            TruncatedIcosahedron.
            
It also provides a bottom toolbar allowing the user to select the desired display mode.  The five options are:
            solid,
            edges,
            solid + edges,
            faces,
            faces + edges,
            multiSolid, and
            multiSolid + edges.
            
Between these two toolbars is the main visualization pane rendering the desired View.

The solid body is rendered with a shiny metalic gold color.  The edges (comprised of thin cylinders) are rendered with a simple orange color.  And the faces are each rendered with a different value of the hue color gamut.  In my humble opinion, the result is pretty impressive.  It looks partcularly striking when viewed in Dark Mode.

The multiSolid bodies are 6 polyhedra of different radii and at different distances from the camera.  Each one spins on a different axis and at a different rate.

A drag gesture (using either macOS or iOS) moves the x,y position of the camera - while it remains pointed at the center of the largest polyhedron.
