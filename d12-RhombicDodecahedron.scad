// Rhombic Dodecahedron 
//   4 sided faces = 12
//   degree 3 vertices = 6
//   degree 4 vertices = 8
//   coords via: http://dmccooey.com/polyhedra
//
use <polyhedra_primitives.scad>;

txt_depth = .09;
txt_size = .475; //.55
txt_font = "Arial:style=Bold";
diameter = 24;  // distance from one vertex to the vertex opposite
minkfn = 80;    // $fn variable for chamfer and the sphere

// heavily rounded
/*
minko = .2; // chamfer the edges [0 = disabled]
roll = 0.2; // round by intersection with a smaller sphere [0 = disabled]
*/
// traditional/sharp edges
minko = .05;
roll = 0;

// shape constants
C0 = 3 * sqrt(2) / 8;
C1 = 3 * sqrt(2) / 4;
original_diameter = C1 + minko; 
scaling_factor = diameter / 2 / original_diameter;

// minimise vertex imbalance, and have balanced opposed faces.
// (degree 3 vertices cannot be better balanced)
labels = ["1", "11", "8", "6.", "9.", "5", "12", "4", "3", "7", "2", "10"];

vertices = [
    [0.0, 0.0,  C1], [0.0, 0.0, -C1],
    [ C1, 0.0, 0.0], [-C1, 0.0, 0.0],
    [0.0,  C1, 0.0], [0.0, -C1, 0.0],
    [ C0,  C0,  C0], [ C0,  C0, -C0],
    [ C0, -C0,  C0], [ C0, -C0, -C0],
    [-C0,  C0,  C0], [-C0,  C0, -C0],
    [-C0, -C0,  C0], [-C0, -C0, -C0]
];
faces = [
    [2,  8,  0,  6], [4,  7,  2,  6], [0, 10,  4,  6],
    [2,  7,  1,  9], [5,  8,  2,  9], [1, 13,  5,  9],
    [3, 13,  1, 11], [4, 10,  3, 11], [1,  7,  4, 11],
    [3, 10,  0, 12], [5, 13,  3, 12], [0,  8,  5, 12]
];

// polyhedron rendered with labels and chamfering
render(labels, scaling_factor, vertices, faces, minko,
       original_diameter, roll, minkfn,
       txt_font, txt_size, txt_depth);
