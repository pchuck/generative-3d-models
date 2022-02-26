// Pentagonal Trapezohedron
//   coords via: http://dmccooey.com/polyhedra/Icosahedron.txt
//
use <polyhedra_primitives.scad>;

txt_depth = .12;
txt_size = .4;
txt_font = "Helvetica:style=Bold";
diameter = 24; // distance from one vertex to the vertex opposite
//minko = 0.1;   // chamfer the edges [0 = disabled]
//roll = 0.15;   // round by intersection with a smaller sphere [0 = disabled]
minkfn = 80;   // sets the $fn variable for the "rounding"s

// sharp edges
minko = 0.03;
roll = 0.0;

// shape constants
C0 = 0.1067764671821527129104854331344823715423;
original_diameter = 1 + C0^2 + minko;
scaling_factor = diameter * 0.5 / original_diameter;
C1 = 1 + C0 + C0^2;
// z intersect of the ray perpendicular to the faces
zint = -(C1 - (1 + 2 * cos(36)) / C1) / 4; 

// balanced opposed faces and the smallest imbalance of the vertices
// (.5 for the degree 5 vertices; two degree 3 vertices deviate by 2.5,
//  two by 1.5 and the remaining six by .5)
//
// labels = ["1","8","5","4","9.","7","2","10","3","6."]; // 1-10
// labels = ["10","80","50","40","90"," 70"," 20"," 00"," 30"," 60"]; // 00-90
labels = ["1","8","5","4","9.","7","2","0","3","6."]; // 0-9

C021 = 1 + C0^2;
vertices = [
    [       0,        0,  C021],
    [       0,        0, -C021],
    [ sin(36),  cos(36),    C0],
    [ sin(72),  cos(72),   -C0],
    [sin(108), cos(108),    C0],
    [sin(144), cos(144),   -C0],
    [sin(180), cos(180),    C0],
    [sin(216), cos(216),   -C0],
    [sin(252), cos(252),    C0],
    [sin(288), cos(288),   -C0],
    [sin(324), cos(324),    C0],
    [sin(360), cos(360),   -C0],
];

faces = [
    [ 0,  2,  3,  4], [ 0,  4,  5,  6], [ 0,  6,  7,  8],
    [ 0,  8,  9, 10], [ 0, 10, 11,  2],
    [ 1,  5,  4,  3], [ 1,  7,  6,  5], [ 1,  9,  8,  7],
    [ 1, 11, 10,  9], [ 1,  3,  2, 11]
];

// polyhedron rendered with labels and chamfering
render_10_12(labels, scaling_factor, vertices, faces, minko,
             original_diameter, roll, minkfn,
             txt_font, txt_size, txt_depth,
             0, zint);
