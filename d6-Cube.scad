// Cube (Hexahedron) - platonic solid
//   coords via: http://dmccooey.com/polyhedra/Cube.html
//
use <polyhedra_primitives.scad>;

// heavily rounded
/*
minko = 0;     // chamfer the edges [0 = disabled]
roll = 0.16;   // round by intersection with a smaller sphere [0 = disabled]
*/
// traditional/sharp edges
minko = 0.1; // 0.03;
roll = 0;

txt_depth = 0.12;
txt_size = 0.45; // 0.35;
diameter = 26; // distance from one [deg 4]-vertex to the vertex opposite
minkfn = 80;   // $fn variable for chamfer and the sphere
original_diameter = sqrt(3) / 2 + minko;
scaling_factor = diameter / 2 / original_diameter;

// This is the usual labeling: opposed faces are balanced;
// vertices deviate by 4.5, 3.5, 2.5 and 1.5 points (two each).
txt_font = "Arial"; // "Arial:style=Bold";
labels = ["1", "2", "4", "6", "3", "5"];

// japanese
//txt_font = "Hiragino Sans:style=Bold";
//labels = ["一", "二", "三", "四", "五", "六"];

vertices = [
    [ 0.5, 0.5, 0.5], [ 0.5, 0.5, -0.5], [ 0.5, -0.5, 0.5], [0.5, -0.5, -0.5],
    [-0.5, 0.5, 0.5], [-0.5, 0.5, -0.5], [-0.5, -0.5, 0.5], [-0.5, -0.5, -0.5]
];

faces = [
    [4, 5, 1, 0], [2, 6, 4, 0], [1, 3, 2, 0],
    [6, 2, 3, 7], [5, 4, 6, 7], [3, 1, 5, 7]
];

// polyhedron rendered with labels and chamfering
render(labels, scaling_factor, vertices, faces, minko,
       original_diameter, roll, minkfn,
       txt_font, txt_size, txt_depth);
