// fractal growth
//
// github.com/pchuck/generative-3d-models
//
use <ultrametrics_primitives.scad>;

width = 0.2; // initial stalk width
height = 10; // initial stalk height
levels = 7; // recursion depth
rotate = 30; // rotation range
sf = 0.7; // x/y-size factor
f1 = 0.5; f2 = 0.8; // z-size factor range
g = 4; // number of growths per stalk
$fn=20;

module growth(t, s, r, n) {
    if(n > 0) 
        translate(t) 
            rotate(r) {
                // cube([s.x, s.y, s.z]);
                cylinder(r=s.x, h=s.z);
                for(i=[1:1:g]) 
                    growth([t.x, t.y, s.z / i], // translate
                           [s.x * sf, s.y * sf, s.z * rand(f1, f2)], // size
                           [rand(-r.x, r.x) + rand(-rotate, rotate), // rotate
                            rand(-r.y, r.y) + rand(-rotate, rotate),
                            rand(-r.z, r.z) + rand(-rotate, rotate)],
                           n - 1);
            }

}

growth([0, 0, 0], [width, width, height], [0, 0, 0], levels);
