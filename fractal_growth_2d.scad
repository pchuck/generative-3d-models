// fractal growth, 2d version
//
// github.com/pchuck/generative-3d-models
//
use <ultrametrics_primitives.scad>;
$fn = 20;

dim = 2; // whether to grow in two or three dimensions
bf = 5; // number of growths per stalk
sf = 0.6; // x/y-size factor
rr = 45; // rotation range
it = [0, 0, 0]; // initial translation
sw = 3.0; // initial stalk width
sh = 40; // initial stalk height
is = [sw, sw, sh]; // initial scale
ir = [0, 0, 0]; // initial rotation
levels = 6; // recursion depth




