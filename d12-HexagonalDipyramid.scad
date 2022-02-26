// Hexagonal Dipyramid
//   3 sided faces = 12
//   degree 4 vertices = 6
//   degree 6 vertices = 2
//   halves = 8 (two are the degree 6 vertices)
//   coords via: http://dmccooey.com/polyhedra
//
use <polyhedra_primitives.scad>;
 
txt_depth = .11;
txt_size = .475;
txt_font = "Arial:style=Bold";
diameter = 27; // distance from one vertex to the vertex opposite
minkfn = 80;   // $fn variable for chamfer and the sphere

// heavily rounded
/*
minko = 0.4;   // chamfer the edges [0 = disabled]
roll = 0.2;    // round by intersection with a smaller sphere [0 = disabled]
*/
// traditional/sharp edges
minko = 0.03;
roll = 0;

// shape constants
C0 = 1 / sqrt(3);
C1 = 2 / sqrt(3);
// height of each pyramid in the dipyramid; different from original coords (2)
C2 = C1; 
original_diameter = max(C2, C1) + minko;
scaling_factor = diameter / 2 / original_diameter; 
// z intersect of the ray perpendicular to the faces
zint = -C2 / 3 + 2 / (3 * C2); // 1 / sqrt(27); 

// The following labeling has balanced opposed faces;
// vertices of degree 4 are also balanced;
// vertices of degree 6 deviate by 1 point; halves deviate by 2 points.
labels = ["1","8","9.","3","6.","11","4","5","12","2","7","10"];

vertices = [
    [ 0.0, 0.0,  C2], [ 0.0, 0.0, -C2],
    [ 1.0,  C0, 0.0], [ 1.0, -C0, 0.0],
    [-1.0,  C0, 0.0], [-1.0, -C0, 0.0],
    [ 0.0,  C1, 0.0], [ 0.0, -C1, 0.0]
];

faces = [
    [6, 2, 0], [4, 6, 0], [5, 4, 0], [7, 5, 0], [3, 7, 0], [2, 3, 0],
    [3, 2, 1], [7, 3, 1], [5, 7, 1], [4, 5, 1], [6, 4, 1], [2, 6, 1]
];

// polyhedron rendered with labels and chamfering
render_10_12(labels, scaling_factor, vertices, faces, minko,
             original_diameter, roll, minkfn,
             txt_font, txt_size, txt_depth,
             2, zint);


