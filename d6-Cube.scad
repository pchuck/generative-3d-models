// Cube (Hexahedron)
//   4 sided faces = 6
//   degree 3 vertices = 8
//   coords via: http://dmccooey.com/polyhedra/Cube.html
//
use <polyhedra_primitives.scad>;

txt_depth = 0.09;
txt_size = 0.35;
txt_font = "Arial:style=Bold";

diameter = 26; // distance from one [deg 4]-vertex to the vertex opposite
minko = 0; // chamfer the edges [0 = disabled]
roll = 0.16; // round by intersection with a smaller sphere [0 = disabled]
minkfn = 80; // $fn variable for chamfer and the sphere

original_diameter = sqrt(3) * 0.5 + minko;
scaling_factor = diameter * 0.5 / original_diameter;

// This is the usual labeling: opposed faces are balanced; vertices deviate by 4.5, 3.5, 2.5 and 1.5 points (two each).
labels = ["1", "2", "4", "6", "3", "5"];

//This labeling has one pair of opposed faces which are balanced while the other two pairs deviate by 4 points; six vertices are .5 points off and two are 1.5 points off
//labels = ["1","4","6","2","5","3"];

//This labeling has one pair of opposed faces which are balanced while the other two pairs deviate by 3 points; vertices are .5, 1.5, 2.5 and 3.5 points off (two each).
//labels = ["1","2","6","3","4","5"];

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
