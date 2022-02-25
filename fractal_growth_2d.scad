// fractal growth, 2d version
//
// github.com/pchuck/generative-3d-models
//
use <ultrametrics_primitives.scad>;
$fn = 20;

dim = 2; // whether to grow in two or three dimensions
bf = 4; // number of growths per stalk
sf = 0.7; // x/y-size factor
width = 2.0; // initial stalk width
height = 50; // initial stalk height
levels = 5; // recursion depth
rr = 50; // rotation range
growth(dim, bf, sf, rr, [0, 0, 0], [width, width, height], [0, 0, 0], levels);
