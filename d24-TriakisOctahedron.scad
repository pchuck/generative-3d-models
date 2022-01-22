// Triakis Octahedron
//   3 sided faces = 24
//   degree 8 vertices = 6
//   degree 3 vertices = 8
//   halves = 6
//   coords via: http://dmccooey.com/polyhedra/TriakisOctahedron.html
//
use <polyhedra_primitives.scad>;

txt_depth = .11;
txt_size = .48;
txt_font = "Arial:style=Bold";
diameter = 30; // distance from one vertex to the vertex opposite
minko = 0.2;   // chamfer the edges [0 = disabled]
roll = 0; //0.6// round by intersection with a smaller sphere [0 = disabled]
minkfn = 80;   // $fn variable for chamfer and the sphere

// shape constants
C0 = 1 + sqrt(2);
original_diameter = C0 + minko;
scaling_factor = diameter / 2 / original_diameter;

// arranged so that faces with a long edge in common add up to ~25
// (but still deviate by 13, 11, 7, 6, 5 and 2 points [twice each])
labels =["15","6.","16","5","21","12","18","17","3","24","2","11","14","23","1","22","8","7","13","4","20","9.","19","10"];

vertices = [
    [ 0.0,  0.0,  C0], [ 0.0,  0.0,  -C0],
    [  C0,  0.0, 0.0], [ -C0,  0.0,  0.0],
    [ 0.0,   C0, 0.0], [ 0.0,  -C0,  0.0],
    [ 1.0,  1.0, 1.0], [ 1.0,  1.0, -1.0],
    [ 1.0, -1.0, 1.0], [ 1.0, -1.0, -1.0],
    [-1.0,  1.0, 1.0], [-1.0,  1.0, -1.0],
    [-1.0, -1.0, 1.0], [-1.0, -1.0, -1.0]
];

faces = [
    [2,  0,  6], [4,  2,  6], [0,  4,  6],
    [4,  1,  7], [2,  4,  7], [1,  2,  7],
    [5,  0,  8], [2,  5,  8], [0,  2,  8],
    [2,  1,  9], [5,  2,  9], [1,  5,  9],
    [4,  0, 10], [3,  4, 10], [0,  3, 10],
    [3,  1, 11], [4,  3, 11], [1,  4, 11],
    [3,  0, 12], [5,  3, 12], [0,  5, 12],
    [5,  1, 13], [3,  5, 13], [1,  3, 13]
];

// polyhedron rendered with labels and chamfering
render(labels, scaling_factor, vertices, faces, minko,
       original_diameter, roll, minkfn,
       txt_font, txt_size, txt_depth);
