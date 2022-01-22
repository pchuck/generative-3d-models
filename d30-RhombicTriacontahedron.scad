// Rhombic Triacontahedron
//   4 sided faces = 30
//   degree 3 vertices = 20
//   degree 5 vertices = 12
//   halves = 40
//   coords via: http://dmccooey.com/polyhedra/RhombicTriacontahedron.html
//
use <polyhedra_primitives.scad>;

txt_depth = .11;
txt_size = .54;
txt_font = "Arial:style=Bold";
diameter = 28; // distance from one vertex to the vertex opposite
minko = 0.4;   // chamfer the edges [0 = disabled]
roll = -.1;    // round by intersection with a smaller sphere [0 = disabled]
minkfn = 80;   // $fn variable for chamfer and the sphere

// shape constants
C0 = sqrt(5) / 4; 
C1 = (5 + sqrt(5)) / 8;
C2 = (5 + 3 * sqrt(5)) / 8;
original_diameter = sqrt(C1^2+C2^2) + minko;
scaling_factor = diameter / 2 / original_diameter;

// balanced opposed faces; the vertices are as balanced as can be
// (deviate by .5 points). The halves are not balanced.
labels = ["20","4","15","8","18","26","5","13","23","16","27","11","7","30","2","29","1","24","25","17","9.","3","19","21","10","12","28","22","14","6."]; 

vertices = [
    [ C1, 0.0,  C2], [ C1, 0.0, -C2], [-C1, 0.0,  C2], [-C1, 0.0, -C2],
    [ C2,  C1, 0.0], [ C2, -C1, 0.0], [-C2,  C1, 0.0], [-C2, -C1, 0.0],
    [0.0,  C2,  C1], [0.0,  C2, -C1], [0.0, -C2,  C1], [0.0, -C2, -C1],
    [0.0,  C0,  C2], [0.0,  C0, -C2], [0.0, -C0,  C2], [0.0, -C0, -C2],
    [ C2, 0.0,  C0], [ C2, 0.0, -C0], [-C2, 0.0,  C0], [-C2, 0.0, -C0],
    [ C0,  C2, 0.0], [ C0, -C2, 0.0], [-C0,  C2, 0.0], [-C0, -C2, 0.0],
    [ C1,  C1,  C1], [ C1,  C1, -C1], [ C1, -C1,  C1], [ C1, -C1, -C1],
    [-C1,  C1,  C1], [-C1,  C1, -C1], [-C1, -C1,  C1], [-C1, -C1, -C1]
];

faces = [
    [14,  2, 12,  0],
    [26, 10, 14,  0],
    [16,  5, 26,  0],
    [25,  9, 13,  1],
    [17,  4, 25,  1],
    [27,  5, 17,  1],
    [18,  6, 28,  2],
    [30,  7, 18,  2],
    [14, 10, 30,  2],
    [29,  6, 19,  3],
    [13,  9, 29,  3],
    [15,  1, 13,  3],
    [24,  8, 20,  4],
    [16,  0, 24,  4],
    [17,  5, 16,  4],
    [19,  6, 18,  7],
    [31,  3, 19,  7],
    [23, 11, 31,  7],
    [28,  6, 22,  8],
    [12,  2, 28,  8],
    [24,  0, 12,  8],
    [22,  6, 29,  9],
    [20,  8, 22,  9],
    [25,  4, 20,  9],
    [23,  7, 30, 10],
    [21, 11, 23, 10],
    [26,  5, 21, 10],
    [15,  3, 31, 11],
    [27,  1, 15, 11],
    [21,  5, 27, 11]
];

// polyhedron rendered with labels and chamfering
render(labels, scaling_factor, vertices, faces, minko,
       original_diameter, roll, minkfn,
       txt_font, txt_size, txt_depth);
