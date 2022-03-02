// Tetrahedron - platonic solid
//   3 sided faces = 4
//   degree 3 vertices = 4
//   coords via: http://dmccooey.com/polyhedra/Tetrahedron.html
//
use <polyhedra_primitives.scad>;

txt_depth = .12;
txt_size = .3;
txt_font = "Arial";
diameter = 27; // distance from one vertex to the vertex opposite
minko = 0.1;   // chamfer the edges [0 = disabled]
roll = 0;      // round by intersection with a smaller sphere [0 = disabled]
minkfn = 80;   // sets the $fn variable for the "rounding"s

// shape constants
C0 = sqrt(2) / 4;
original_diameter = sqrt(3) * C0 + minko;
scaling_factor = diameter / 2 / original_diameter;
labels = ["1","2","3","4"]; 

vertices = [
    [ C0, -C0,  C0], [ C0,  C0, -C0], [-C0,  C0,  C0], [-C0, -C0, -C0]
];

faces = [
    [ 2 , 1, 0], [ 3 , 0, 1], [ 0 , 3, 2], [ 1 , 2, 3]
];

// polyhedron rendered with labels and chamfering
render(labels, scaling_factor, vertices, faces, minko,
       original_diameter, roll, minkfn,
       txt_font, txt_size, txt_depth,
       xrot=180);
