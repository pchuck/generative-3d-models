// Deltoidal Icositetrahedron - catalan solid
//   4 sided faces = 24
//   degree 4 vertices = 18
//   degree 3 vertices = 8
//   halves = 6
//   coords via: http://dmccooey.com/polyhedra/DeltoidalIcositetrahedron.html
//
use <polyhedra_primitives.scad>;

txt_depth = .09;
txt_size = .35;
txt_font = "Arial:style=Bold";
diameter = 24;   // distance from one vertex to the vertex opposite
minko = 0.03;    // chamfer the edges [0 = disabled]
roll = 0;        // round by intersection with a smaller sphere [0 = disabled]
minkfn = 80;     // $fn variable for chamfer and the sphere

// shape constants
C1 = sqrt(2);
C0 = (4 + C1) / 7;
original_diameter = C1 + minko;
scaling_factor = diameter / 2 / original_diameter;

// halves are balanced, vertices of degree 4 are balanced,
// vertices of degree deviate by .5 except for two which deviate by 1.5.
labels = ["20","5","12","13","19","6.","11","14","10","1","16","23","24","15","2","9.","22","3","8","17","7","18","21","4"];

vertices = [
  [ 0.0,  0.0,   C1], [ 0.0,  0.0,  -C1],
  [  C1,  0.0,  0.0], [-C1,   0.0,  0.0],
  [ 0.0,   C1,  0.0], [ 0.0,  -C1,  0.0],
  [ 1.0,  0.0,  1.0], [ 1.0,  0.0, -1.0],
  [-1.0,  0.0,  1.0], [-1.0,  0.0, -1.0],
  [ 1.0,  1.0,  0.0], [ 1.0, -1.0,  0.0],
  [-1.0,  1.0,  0.0], [-1.0, -1.0,  0.0],
  [ 0.0,  1.0,  1.0], [ 0.0,  1.0, -1.0],
  [ 0.0, -1.0,  1.0], [ 0.0, -1.0, -1.0],
  [  C0,   C0,   C0], [  C0,   C0,  -C0], [  C0, -C0, C0], [ C0, -C0, -C0],
  [ -C0,   C0,   C0], [ -C0,   C0,  -C0], [ -C0, -C0, C0], [-C0, -C0, -C0]
];

faces = [
    [14, 18,  6, 0], [ 8, 22, 14, 0], [16, 24,  8, 0], [ 6, 20, 16, 0],
    [15, 23,  9, 1], [ 7, 19, 15, 1], [17, 21,  7, 1], [ 9, 25, 17, 1],
    [10, 19,  7, 2], [ 6, 18, 10, 2], [11, 20,  6, 2], [ 7, 21, 11, 2],
    [12, 22,  8, 3], [ 9, 23, 12, 3], [13, 25,  9, 3], [ 8, 24, 13, 3],
    [15, 19, 10, 4], [12, 23, 15, 4], [14, 22, 12, 4], [10, 18, 14, 4],
    [16, 20, 11, 5], [13, 24, 16, 5], [17, 25, 13, 5], [11, 21, 17, 5]
];

// polyhedron rendered with labels and chamfering
render(labels, scaling_factor, vertices, faces, minko,
       original_diameter, roll, minkfn,
       txt_font, txt_size, txt_depth);
