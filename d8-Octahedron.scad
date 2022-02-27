// Octahedron
//   3 sided faces = 8
//   degree 4 vertices = 6
//   coords via: http://dmccooey.com/polyhedra/Octahedron.html
//
use <polyhedra_primitives.scad>;

txt_depth = 0.09;
txt_size = 0.40; // 0.3;
txt_font = "Arial"; // "Arial:style=Bold";
diameter = 26; // distance from one vertex to the vertex opposite. was 24
minkfn = 80;   // $fn variable for chamfer and the sphere

// heavily rounded
/*
roll = 0.2075; // round by intersection with a smaller sphere [0 = disabled]
minko = 0;     // chamfer the edges [0 = disabled]
*/
// traditional/sharp edges
minko = 0.1; // 0.03;
roll = 0;

// shape constants
C0 = sqrt(2) / 2; 
original_diameter = C0 + minko;
scaling_factor = diameter * 0.5 / original_diameter;

//labels = ["1","2","3","4","5","6.","7","8"]; //default labeling
// opposed faces balanced, vertex imbalance minimised
// labels = ["1", "7", "4", "6", "2", "8", "3", "5"];
// vertices balanced, opposed faces imbalance minimised
labels = ["1", "6", "3", "8", "2", "5", "4", "7"]; 

vertices = [
    [0.0, 0.0,  C0], [0.0, 0.0, -C0],
    [ C0, 0.0, 0.0], [-C0, 0.0, 0.0],
    [0.0,  C0, 0.0], [0.0, -C0, 0.0]
];

faces = [
    [4, 2, 0], [3, 4, 0], [5, 3, 0], [2, 5, 0],
    [5, 2, 1], [3, 5, 1], [4, 3, 1], [2, 4, 1]
];

// polyhedron rendered with labels and chamfering
render(labels, scaling_factor, vertices, faces, minko,
       original_diameter, roll, minkfn,
       txt_font, txt_size, txt_depth);
