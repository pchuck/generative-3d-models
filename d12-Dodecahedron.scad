// Dodecahedron - platonic solid
//   5 sided faces = 12
//   degree 3 vertices = 20
//   "halves" = 12
//   coords via: http://dmccooey.com/polyhedra/Octahedron.html
//
use <polyhedra_primitives.scad>;

txt_depth = .09;
txt_size = .50;
txt_font = "Arial"; // txt_font = "Arial:style=Bold";
diameter = 22; // distance from one vertex to the vertex opposite (was 24)
//minko = 0.4;   // chamfer the edges [0 = disabled]
roll = 0;      // round by intersection with a smaller sphere [0 = disabled]
minkfn = 80;   // $fn variable for chamfer and the sphere

// sharp edges
minko = 0.1; // 0.03;

// shape constants
C0 = (1 + sqrt(5)) / 4;
C1 = (3 + sqrt(5)) / 4;
original_diameter = sqrt(C1^2 + .25) + minko;
scaling_factor = diameter / 2 / original_diameter;

// opposed faces are balanced and vertex imbalance minimised:
// two are 3.5 points off, six are off by 2.5, six are off by 1.5
// and six by .5; two halves are off by 7 points,
// four by 5, two by 3 and four by 1 point.
labels = ["1", "7", "11", "4", "12", "3", "6.", "9.", "8", "5", "10", "2"]; 

vertices = [
    [0.0, 0.5,  C1], [0.0, 0.5,  -C1], [ 0.0, -0.5,  C1], [ 0.0, -0.5,  -C1],
    [ C1, 0.0, 0.5], [ C1, 0.0, -0.5], [ -C1,  0.0, 0.5], [ -C1,  0.0, -0.5],
    [0.5,  C1, 0.0], [0.5, -C1,  0.0], [-0.5,   C1, 0.0], [-0.5,  -C1,  0.0],
    [ C0,  C0,  C0], [ C0,  C0,  -C0], [  C0,  -C0,  C0], [  C0,  -C0,  -C0],
    [-C0,  C0,  C0], [-C0,  C0,  -C0], [ -C0,  -C0,  C0], [ -C0,  -C0,  -C0]
];

faces = [
    [12,  4, 14,  2,  0], [16 , 10,  8, 12,  0],
    [ 2, 18,  6, 16,  0], [17 , 10, 16,  6,  7],
    [19,  3,  1, 17,  7], [ 6 , 18, 11, 19,  7],
    [15,  3, 19, 11,  9], [14 ,  4,  5, 15,  9],
    [11, 18,  2, 14,  9], [ 8 , 10, 17,  1, 13],
    [ 5,  4, 12,  8, 13], [ 1 ,  3, 15,  5, 13]
];

// polyhedron rendered with labels and chamfering
render(labels, scaling_factor, vertices, faces, minko,
       original_diameter, roll, minkfn,
       txt_font, txt_size, txt_depth);
