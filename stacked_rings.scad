// stacked touching rings
//
// github.com/pchuck/generative-3d-models
//
use <ultrametrics_primitives.scad>;

levels = 10;
width = 3;
size = 50;
offset = size / 2;

module ring_cyl() {
    for(i=[0:1:levels]) {
        translate([0, 0, i * offset]) {
            if(i % 2 == 0) {
                rotate([15, 0, 10*i]) ring(size, width);
            }
            else {
                rotate([-15, 0, 10*i]) ring(size, width);
            }
        }
    }
}
ring(size, width);
translate([0, 0, offset * (levels + 1)]) ring(size, width);

translate([0, 0, offset / 2]) {
    ring_cyl();
    //rotate([0, 0, 90]) ring_cyl();
    rotate([0, 0, 180]) ring_cyl();
    //rotate([0, 0, 270]) ring_cyl();

}
