// cube experiments
//
// github.com/pchuck/generative-3d-models
//
use <ultrametrics_primitives.scad>;

// random cubes
module random_cubes() {
    for(i=[0: 1: 10]) {
        translate([i, 0, 0]) cube([rand1(i), rand1(i), rand1(i)]);
    }
}

// random cube pyramid - overhangs, not printable
module random_cube_pyramid() {
    t = 20;
    s = 3;
    translate([0, 0, -1])
    for(z=[0: 1: 10]) {
        for(i=[0: 1: 100]) {
            tz = rand1(t);
            translate([rand(-z, z), rand(-z, z), z]) 
            cube([rand1(s), rand1(s), rand1(s)]);
        }
    }
}

// sparse random cube cloud - not printable!
module sparse_random_cube_cloud() {
    t = 20;
    s = 3;
    translate([0, 0, -1])
    for(i=[0: 1: 100]) {
        tz = rand1(t);
        translate([rand1(t), rand1(t), rand1(t)]) 
          cube([rand1(s), rand1(s), rand1(s)]);
    }
}

// dense random cube cloud - maybe printable?
module dense_random_cube_cloud() {
    t = 20;
    s = 3;
    translate([0, 0, -1])
    for(i=[0: 1: 5000]) {
        tz = rand1(t);
        translate([rand1(t), rand1(t), rand1(t)]) 
          cube([rand1(s), rand1(s), rand1(s)]);
    }
}

// skyscrapers - random tall cubes
module skyscrapers() {
    t = 20;
    s = 3;
    translate([0, 0, -1])
    for(i=[0: 1: 100]) {
        tz = rand1(t);
        translate([rand1(t), rand1(t), 0]) 
        cube([rand1(s), rand1(s), rand1(tz)]);
    }
}

//random_cubes();
//random_cube_pyramid();
//sparse_random_cube_cloud();
//dense_random_cube_cloud();
skyscrapers();

