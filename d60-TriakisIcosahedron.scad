// Triakis Icosahedron - catalan solid
//   3 sided faces = 60
//   degree 10 vertives = 12
//   degree 3 vertices = 20
//   halves >= 20 (icosahedron)
//   coords via: http://dmccooey.com/polyhedra/TriakisIcosahedron.html
//
use <polyhedra_primitives.scad>;

txt_depth = .09;
txt_size = .425;
txt_font = "Arial:style=Bold";
diameter = 34; // distance from one vertex to the vertex opposite
//minko = 0.2;   // chamfer the edges [0 = disabled]
roll = 0; //.3 // round by intersection with a smaller sphere [0 = disabled]
minkfn = 80;   // $fn variable for chamfer and the sphere

// sharp edges
minko = 0.03;

// shape constants
C0 = 5 * ( 7 +     sqrt(5)) / 44;
C1 = 5 * ( 3 + 2 * sqrt(5)) / 22;
C2 =     ( 5 +     sqrt(5)) /  4;
C3 = 5 * (13 + 5 * sqrt(5)) / 44;
C4 =     ( 5 + 3 * sqrt(5)) /  4;
original_diameter = sqrt(C2^2 + C4^2) + minko;
scaling_factor = diameter / 2 / original_diameter;

// balanced opposed faces;
// vertices of degree 3 deviate by the minimal amount possible (.5 points);
// vertices of degree 10 deviate by 3, 2 or 1 point (four times each);
// halves deviate by 1 point, except for two which deviate by 3 points.  
labels = ["1","40","51","55","9.","28","6.","33","52","21","60","10","44","15","32","58","30","4","57","31","3","29","46","17","39","48","5","54","2","35","26","59","7","56","13","22","23","50","18","36","8","47","42","12","37","27","45","20","16","41","34","24","19","49","14","25","53","11","43","38"];

vertices = [
    [ C2, 0.0,  C4], [ C2, 0.0, -C4], [-C2, 0.0,  C4], [-C2, 0.0, -C4],
    [ C4,  C2, 0.0], [ C4, -C2, 0.0], [-C4,  C2, 0.0], [-C4, -C2, 0.0],
    [0.0,  C4,  C2], [0.0,  C4, -C2], [0.0, -C4,  C2], [0.0, -C4, -C2],
    [0.0,  C0,  C3], [0.0,  C0, -C3], [0.0, -C0,  C3], [0.0, -C0, -C3],
    [ C3, 0.0,  C0], [ C3, 0.0, -C0], [-C3, 0.0,  C0], [-C3, 0.0, -C0],
    [ C0,  C3, 0.0], [ C0, -C3, 0.0], [-C0,  C3, 0.0], [-C0, -C3, 0.0],
    [ C1,  C1,  C1], [ C1,  C1, -C1], [ C1, -C1,  C1], [ C1, -C1, -C1],
    [-C1,  C1,  C1], [-C1,  C1, -C1], [-C1, -C1,  C1], [-C1, -C1, -C1]
];

faces = [
    [  8 ,  0, 12], [  2 ,  8, 12], [  0 ,  2, 12],
    [  3 ,  1, 13], [  9 ,  3, 13], [  1 ,  9, 13],
    [  2 ,  0, 14], [ 10 ,  2, 14], [  0 , 10, 14],
    [ 11 ,  1, 15], [  3 , 11, 15], [  1 ,  3, 15],
    [  5 ,  0, 16], [  4 ,  5, 16], [  0 ,  4, 16],
    [  4 ,  1, 17], [  5 ,  4, 17], [  1 ,  5, 17],
    [  6 ,  2, 18], [  7 ,  6, 18], [  2 ,  7, 18],
    [  7 ,  3, 19], [  6 ,  7, 19], [  3 ,  6, 19],
    [  9 ,  4, 20], [  8 ,  9, 20], [  4 ,  8, 20],
    [ 10 ,  5, 21], [ 11 , 10, 21], [  5 , 11, 21],
    [  8 ,  6, 22], [  9 ,  8, 22], [  6 ,  9, 22],
    [ 11 ,  7, 23], [ 10 , 11, 23], [  7 , 10, 23],
    [  4 ,  0, 24], [  8 ,  4, 24], [  0 ,  8, 24],
    [  9 ,  1, 25], [  4 ,  9, 25], [  1 ,  4, 25],
    [ 10 ,  0, 26], [  5 , 10, 26], [  0 ,  5, 26],
    [  5 ,  1, 27], [ 11 ,  5, 27], [  1 , 11, 27],
    [  8 ,  2, 28], [  6 ,  8, 28], [  2 ,  6, 28],
    [  6 ,  3, 29], [  9 ,  6, 29], [  3 ,  9, 29],
    [  7 ,  2, 30], [ 10 ,  7, 30], [  2 , 10, 30],
    [ 11 ,  3, 31], [  7 , 11, 31], [  3 ,  7, 31]
];

// polyhedron rendered with labels and chamfering
render(labels, scaling_factor, vertices, faces, minko,
       original_diameter, roll, minkfn,
       txt_font, txt_size, txt_depth);
