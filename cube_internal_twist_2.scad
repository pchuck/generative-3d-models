// 'infinite' 3d nested cubes
//
// github.com/pchuck/generative-3d-models
//
// fixed-thickness cube frame
//
use <ultrametrics_primitives.scad>;

size = 200; // size of parent cube in mm
steps = 20; // number of nestings
angle = 90; // rotation per iteration
width = 3; // fixed frame width

// offset the cube so that it sits on the z-plane
translate([0, 0, size / 2])
//rotate([60, 45, 0])

// iteratively twist and nest a series of internal cubes
for(i=[1 / steps : 1 / steps : 1]) {
    rotate([i * angle, i * angle, i * angle])
    cube_frame(size * i^1, width);
}
