// nested, rotated rings
//
// github.com/pchuck/generative-3d-models
//
use <ultrametrics_primitives.scad>;

width = 1;
size = 30;
mult = 3;
angle = 90 / size * mult;


translate([0, 0, size]) {
    rotate([95, 90, 0]) {
        for(i=[size:-1:1]) {
//            translate([i, 0, 0])
            rotate([angle * i, 0, 0]) ring(i, width);
        }
    }
}
