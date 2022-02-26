// Pentagonal Trapezohedron
//   4 sided faces = 10
//   degree 3 vertices = 10
//   degree 5 vertices = 2
//   coords via: http://dmccooey.com/polyhedra/Octahedron.html
//
use <polyhedra_primitives.scad>;

txt_depth = .09;
txt_size = .4;
txt_font = "Arial:style=Bold";
diameter = 24; // distance from one vertex to the vertex opposite
//minko = 0.1;   // chamfer the edges [0 = disabled]
roll = -0.1;   // round by intersection with a smaller sphere [0 = disabled]
minkfn = 80;   // $fn variable for chamfer and the sphere

// sharp edges
minko = 0.03;

// shape constants
C0 = 0.0520950836016870306476547719793196081537;
C1 = 1; 
C2 = -1.5019535518686029797197730724235309017711;
zint = -(C0 + 1) / 4 * C1 - 1 / (C2 * C1); // z intersect perpendicular to face
original_diameter = C1 + minko;
scaling_factor = diameter / 2 /original_diameter;

// this labeling has balanced opposed faces
// Four [degree 3] vertices deviate by 2.5 and four deviate by 1.5;
// the rest, including the degree 7 vertices, deviate by 0.5.
labels = ["2", "10", "11", "3", "6.", "14", "7", "9.", "1", "8", "13", "5", "4", "12"];

vertices = [
    [            0,             0,  C1], [0,          0,                -C1],
    [sin(180/7* 1), cos(180/7* 1),  C0], [sin(180/7* 2), cos(180/7* 2), -C0],
    [sin(180/7* 3), cos(180/7* 3),  C0], [sin(180/7* 4), cos(180/7* 4), -C0],
    [sin(180/7* 5), cos(180/7* 5),  C0], [sin(180/7* 6), cos(180/7* 6), -C0],
    [sin(180/7* 7), cos(180/7* 7),  C0], [sin(180/7* 8), cos(180/7* 8), -C0],
    [sin(180/7* 9), cos(180/7* 9),  C0], [sin(180/7*10), cos(180/7*10), -C0],
    [sin(180/7*11), cos(180/7*11),  C0], [sin(180/7*12), cos(180/7*12), -C0],
    [sin(180/7*13), cos(180/7*13),  C0], [sin(180/7*14), cos(180/7*14), -C0]
];

faces = [
    [0,  2,  3,  4], [0,  4,  5,  6], [0,  6,  7, 8], [0,  8,  9, 10],
    [0, 10, 11, 12], [0, 12, 13, 14], [0, 14, 15, 2],
    [1,  5,  4,  3], [1,  7,  6,  5], [1,  9,  8, 7], [1, 11, 10,  9],
    [1, 13, 12, 11], [1, 15, 14, 13], [1,  3,  2, 15]
];

// polyhedron rendered with labels and chamfering
render_10_12(labels, scaling_factor, vertices, faces, minko,
             original_diameter, roll, minkfn,
             txt_font, txt_size, txt_depth,
             2, zint);
