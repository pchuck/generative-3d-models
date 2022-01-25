// TetrakisHexahedron
//   3 sided faces = 24
//   degree 4 vertices = 6
//   degree 6 vertices = 8
//   halves = 8
//   coords via: http://dmccooey.com/polyhedra/TetrakisHexahedron.html
//
use <polyhedra_primitives.scad>;

txt_depth = .09;
txt_size = .5;
txt_font = "Arial:style=Bold";
diameter = 26; // distance from one vertex to the vertex opposite
minko = 0.2; // .4   // chamfer the edges [0 = disabled]
roll = 0; //.225;  // round by intersection with a smaller sphere [0 = disabled]
minkfn = 80;   // $fn variable for chamfer and the sphere

// shape constants
C0 = 3 * sqrt(2) / 4;
C1 = 9 * sqrt(2) / 8;
original_diameter = sqrt(3) * C0 + minko;
scaling_factor = diameter / 2 / original_diameter;

// vertices and opposed faces are balanced,
// halves deviate 12, 10, 6 [two times] 4 and 2 points [from 150]
labels = ["3","19","11","17","6.","22","8","14","9.","10","13","18","15","16","7","12","4","20","2","24","5","21","1","23"]; //

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
    [10,  6,  0], [12, 10,  0], [ 8, 12,  0], [ 6,  8,  0],
    [ 9,  7,  1], [13,  9,  1], [11, 13,  1], [ 7, 11,  1],
    [ 8,  6,  2], [ 9,  8,  2], [ 7,  9,  2], [ 6,  7,  2],
    [11, 10,  3], [13, 11,  3], [12, 13,  3], [10, 12,  3],
    [ 7,  6,  4], [11,  7,  4], [10, 11,  4], [ 6, 10,  4],
    [12,  8,  5], [13, 12,  5], [ 9, 13,  5], [ 8,  9,  5]
];

// polyhedron rendered with labels and chamfering
render(labels, scaling_factor, vertices, faces, minko,
       original_diameter, roll, minkfn,
       txt_font, txt_size, txt_depth);
