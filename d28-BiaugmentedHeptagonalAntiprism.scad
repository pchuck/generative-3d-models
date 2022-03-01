// Biaugmented Hexagonal Antiprism
//   3 sided faces = 28
//   degree 5 vertices = 14
//   degree 7 vertices = 2
//
use <polyhedra_primitives.scad>;

txt_depth = .15;
txt_size = .35;
txt_font = "Arial";
diameter = 34; // distance from one vertex to the vertex opposite
minko = 0.1;   // chamfer the edges [0 = disabled]
roll = -0.15;  // round by intersection with a smaller sphere [0 = disabled]
minkfn = 80;   // sets the $fn variable for the "rounding"s

// shape constants
C0 = 1.6738989622449851595081480523182430165961;
C1 = 1.0764913393506924523633436092566531364826;
original_diameter = C0 + minko;
scaling_factor = diameter / 2 / original_diameter;
zint = 0; //-(C1 - (1+2*cos(36))/C1)/4; // z intersect perpendicular to face

// balanced opposed faces; vertices are as balanced as possible (0.5 deviation)
// except for two which deviate by 1.5
labels = ["10", "16", "8", "28", "9.", "27", "4", "20", "2", "25", "19", "13", "21", "1", "23", "17", "7", "26", "15", "5", "18", "6.", "12", "22", "3", "14", "24", "11"];

vertices = [
  [0, 0, C0-C1/2], [0, 0, C1/2-C0],
  [sin(180/7* 1), cos(180/7* 1), C1/2], [sin(180/7* 2), cos(180/7* 2), -C1/2],
  [sin(180/7* 3), cos(180/7* 3), C1/2], [sin(180/7* 4), cos(180/7* 4), -C1/2],
  [sin(180/7* 5), cos(180/7* 5), C1/2], [sin(180/7* 6), cos(180/7* 6), -C1/2],
  [sin(180/7* 7), cos(180/7* 7), C1/2], [sin(180/7* 8), cos(180/7* 8), -C1/2],
  [sin(180/7* 9), cos(180/7* 9), C1/2], [sin(180/7*10), cos(180/7*10), -C1/2],
  [sin(180/7*11), cos(180/7*11), C1/2], [sin(180/7*12), cos(180/7*12), -C1/2],
  [sin(180/7*13), cos(180/7*13), C1/2], [sin(180/7*14), cos(180/7*14), -C1/2],
];

faces = [
  [ 0,  2,   4], [ 0,  4,  6], [ 0,  6,  8], [ 0,  8, 10],
  [ 0, 10,  12], [ 0, 12, 14], [ 0, 14,  2],
  [ 1,  5,   3], [ 1,  7,  5], [ 1,  9,  7], [ 1, 11,  9],
  [ 1, 13,  11], [ 1, 15, 13], [ 1,  3, 15],
  [ 2,  3,   4],
  [ 5,  4,   3],
  [ 4,  5,   6],
  [ 7,  6,   5],
  [ 6,  7,   8],
  [ 9,  8,   7],
  [ 8,  9,  10],
  [11, 10,   9],
  [10, 11,  12],
  [13, 12,  11],
  [12, 13,  14],
  [15, 14,  13],
  [14, 15,   2],
  [ 3,  2,  15]
];

// polyhedron rendered with labels and chamfering
render_10_12(labels, scaling_factor, vertices, faces, minko,
             original_diameter, roll, minkfn,
             txt_font, txt_size, txt_depth,
             0, zint);
