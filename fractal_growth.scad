// fractal growth, 2d version
//
// github.com/pchuck/generative-3d-models
//
use <ultrametrics_primitives.scad>;

width = 0.4; // initial stalk width
height = 20; // initial stalk height
levels = 5; // recursion depth
rotate = 30; // rotation range
sf = 0.7; // x/y-size factor
f1 = 0.5; f2 = 0.8; // z-size factor range
g = 4; // number of growths per stalk
2d_only = true; // whether to grow in two or three dimensions
$fn = 20;

module growth(t, s, r, n) {
    if(n > 0) {
        translate(t) {
            rotate(r) {
                // cube([s.x, s.y, s.z]);
                cylinder(r=s.x, h=s.z);
                rf = rotate;
                for(i=[1:1:g]) { // branching factor
                    tn = [t.x, t.y, s.z / i]; // translation
                    sn = [s.x * sf, s.y * sf, s.z * rand(f1, f2)]; // scale
                    rn = 2d_only ? // rotation
                        [rand(-r.x, r.x) + rand(-rf, rf), 0, 0] : 
                        [rand(-r.x, r.x) + rand(-rf, rf), 
                         rand(-r.y, r.y) + rand(-rf, rf),
                         rand(-r.z, r.z) + rand(-rf, rf)];
                    growth(tn, // translate
                           sn, // size
                           rn, // rotation
                           n - 1); 
                 }
            }
        }
    }
}

growth([0, 0, 0], [width, width, height], [0, 0, 0], levels);
