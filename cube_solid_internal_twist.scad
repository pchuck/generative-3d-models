// 'infinite' 3d nested cubes
//
// github.com/pchuck/generative-3d-models
//
use <ultrametrics_primitives.scad>;

size = 100; // size of parent cube in mm
steps = 20; // number of nestings
angle = 90; // rotation per iteration
t = 3.0; // fixed frame width

intersection() {
    // clip objects below the positive z-plane
    translate([-size, -size, 0]) cube(size * 2);

    // offset the cube so that it sits on the z-plane
    translate([0, 0, size / 2])
    rotate([45, 45, 0])

    // iteratively twist and nest a series of internal cubes
    for(i=[1 / steps : 1 / steps : 1]) {
        rotate([i*angle, i * angle, i * angle])
        cube_frame(size * i^1, t);
    }
}
