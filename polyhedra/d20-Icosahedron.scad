// 20-sided icosahedron - platonic solid
//   coords via: http://dmccooey.com/polyhedra/Icosahedron.txt
//
use <polyhedra_primitives.scad>;

txt_depth = 0.09;
diameter = 24; // distance from one vertex to the vertex opposite. (30=large)
minko = 0.1;   // chamfer the edges [0 = disabled]
roll = -0.1; // round by intersection with a smaller sphere [0 = disabled]
minkfn = 80; // $fn variable for chamfer and the sphere

// shape constants
C0 = 0.809016994374947424102293417183;

original_diameter = sqrt(C0 * C0 + 0.25) + minko;
scaling_factor = diameter * 0.5 / original_diameter;

// western
txt_size = 0.35;
txt_font = "Arial"; // "Arial:style=Bold";
labels = ["14","20","13","3","2","19","18","8","1","7","12","10","4","5","6.","9.","11","17","16","15"];

/*
// japanese
txt_size = 0.22;
txt_font = "Hiragino Sans:style=Bold";
labels = ["十四","廿","十三","三","二","十九","十八","八","一","七","十二","十","四","五","六","九","十一","十七","十六","十五"];
*/

// arabic
/*
txt_size = 0.4;
txt_font = "Arial:style=Bold";
labels = ["١٤","٢٠","١٣","٣","٢","١٩","١٨","٨","١","٧","١٢","١٠","٤","٥","٦.","٩","١١","١٧","١٦","١٥"];
*/

// devanagari
/*
txt_size = 0.4;
txt_font = "Kohinoor Devanagari:style=Bold";
labels = ["१४","२०","१३","३","२","१९","१८","८","१","७","१२","१०","४","५","६","९","११","१७","१६","१५"];
*/

// tibetan
/*
txt_size = 0.45;
txt_font = "Kokonor:style=Bold";
labels = ["༡༤","༢༠","༡༣","༣","༢","༡༩","༡༨","༨","༡","༧","༡༢","༡༠","༤","༥","༦","༩","༡༡","༡༧","༡༦","༡༥"];
*/

vertices = [
    [0.5, 0.0,  C0], [0.5,  0.0,  -C0], [-0.5, 0.0,  C0], [-0.5,  0.0, -C0],
    [ C0, 0.5, 0.0], [ C0, -0.5,  0.0], [ -C0, 0.5, 0.0], [ -C0, -0.5, 0.0],
    [0.0,  C0, 0.5], [0.0,   C0, -0.5], [ 0.0, -C0, 0.5], [0.0,  -C0, -0.5]
];
faces = [
    [10, 2,  0], [ 5, 10,  0], [4,  5, 0], [ 8, 4, 0],
    [ 2, 8,  0], [11,  1,  3], [7, 11, 3], [ 6, 7, 3],
    [ 9, 6,  3], [ 1,  9,  3], [7,  6, 2], [10, 7, 2],
    [11, 7, 10], [ 5, 11, 10], [1, 11, 5], [ 4, 1, 5],
    [ 9, 1,  4], [ 8,  9,  4], [6,  9, 8], [ 2, 6, 8]
];

// polyhedron rendered with labels and chamfering
render(labels, scaling_factor, vertices, faces, minko,
       original_diameter, roll, minkfn,
       txt_font, txt_size, txt_depth);
