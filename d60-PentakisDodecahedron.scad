// Pentakis Dodecahedron
//   3 sided faces = 60
//   degree 6 vertices = 20
//   degree 5 vertices = 12
//   halves >= 12 (dodecahedron)
//   coords via: http://dmccooey.com/polyhedra/PentakisDodecahedron.html
//
use <polyhedra_primitives.scad>;

txt_depth = .12;
txt_size = .54;
txt_font = "Arial:style=Bold";
diameter = 32; // distance from one vertex to the vertex opposite
minko = 0.2;   // chamfer the edges [0 = disabled]
roll = -0.1;   // round by intersection with a smaller sphere [0 = disabled]
minkfn = 80;   // $fn variable for chamfer and the sphere

// shape constants
C0 = 3 * (sqrt(5) - 1) / 4;
C1 = 9 * (9 + sqrt(5)) / 76;
C2 = 9 * (7 + 5 * sqrt(5)) / 76;
C3 = 3 * (1 + sqrt(5)) / 4;
original_diameter = sqrt(3) * 1.5 + minko;
scaling_factor = diameter / 2 / original_diameter;

// opposed faces are balanced and the best balance of the vertices I found:
// degree 5 vertices have minimal unbalance (.5 points off) while
// degree 6 vertices are balanced except for four;
// halves are balanced except for two halves which deviate by 2 points
labels = ["13","32","15","33","60","2","44","30","43","34","59","27","18","31","17","48","1","28","46","29","36","38","19","6.","53","20","26","51","40","16","41","45","21","10","35","25","8","55","42","23","50","58","14","9.","22","37","49","4","56","7","24","54","5","57","12","11","39","52","47","3"]; 

vertices = [
  [ 0.0,  C0,   C3], [ 0.0,  C0,  -C3], [ 0.0,  -C0,   C3], [ 0.0,  -C0,  -C3],
  [  C3, 0.0,   C0], [  C3, 0.0,  -C0], [ -C3,  0.0,   C0], [ -C3,  0.0,  -C0],
  [  C0,  C3,  0.0], [  C0, -C3,  0.0], [ -C0,   C3,  0.0], [ -C0,  -C3,  0.0],
  [  C1, 0.0,   C2], [  C1, 0.0,  -C2], [ -C1,  0.0,   C2], [ -C1,  0.0,  -C2],
  [  C2,  C1,  0.0], [  C2, -C1,  0.0], [ -C2,   C1,  0.0], [ -C2,  -C1,  0.0],
  [ 0.0,  C2,   C1], [ 0.0,  C2,  -C1], [ 0.0,  -C2,   C1], [ 0.0,  -C2,  -C1],
  [ 1.5, 1.5,  1.5], [ 1.5, 1.5, -1.5], [ 1.5, -1.5,  1.5], [ 1.5, -1.5, -1.5],
  [-1.5, 1.5,  1.5], [-1.5, 1.5, -1.5], [-1.5, -1.5,  1.5], [-1.5, -1.5, -1.5]
];

faces = [
  [ 2,  0, 12], [26,  2, 12], [ 4, 26, 12], [24,  4, 12], [ 0, 24, 12],
  [ 1,  3, 13], [25,  1, 13], [ 5, 25, 13], [27,  5, 13], [ 3, 27, 13],
  [ 0,  2, 14], [28,  0, 14], [ 6, 28, 14], [30,  6, 14], [ 2, 30, 14],
  [ 3,  1, 15], [31,  3, 15], [ 7, 31, 15], [29,  7, 15], [ 1, 29, 15],
  [ 5,  4, 16], [25,  5, 16], [ 8, 25, 16], [24,  8, 16], [ 4, 24, 16],
  [ 4,  5, 17], [26,  4, 17], [ 9, 26, 17], [27,  9, 17], [ 5, 27, 17],
  [ 6,  7, 18], [28,  6, 18], [10, 28, 18], [29, 10, 18], [ 7, 29, 18],
  [ 7,  6, 19], [31,  7, 19], [11, 31, 19], [30, 11, 19], [ 6, 30, 19],
  [10,  8, 20], [28, 10, 20], [ 0, 28, 20], [24,  0, 20], [ 8, 24, 20],
  [ 8, 10, 21], [25,  8, 21], [ 1, 25, 21], [29,  1, 21], [10, 29, 21],
  [ 9, 11, 22], [26,  9, 22], [ 2, 26, 22], [30,  2, 22], [11, 30, 22],
  [11,  9, 23], [31, 11, 23], [ 3, 31, 23], [27,  3, 23], [ 9, 27, 23]
];

// polyhedron rendered with labels and chamfering
render(labels, scaling_factor, vertices, faces, minko,
       original_diameter, roll, minkfn,
       txt_font, txt_size, txt_depth);
