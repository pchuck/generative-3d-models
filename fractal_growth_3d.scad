// fractal growth, 3d version
//
// github.com/pchuck/generative-3d-models
//
use <ultrametrics_primitives.scad>;
$fn = 20;

dim = 3; // whether to grow in two or three dimensions
bf = 4; // number of growths per stalk
sf = 0.7; // x/y-size factor
rr = 30; // rotation range
it = [0, 0, 0]; // initial translation
sw = 0.4; // initial stalk width
sh = 50; // initial stalk height
is = [sw, sw, sh]; // initial scale
ir = [0, 0, 0]; // initial rotation
levels = 7; // recursion depth

growth(dim, bf, sf, rr, it, is, ir, levels);
