// cube experiments
//
// github.com/pchuck/generative-3d-models
//
function rand(min, max) = rands(min, max, 1)[0];
function randz(max) = rands(1, max, 1)[0];

// random cubes
module random_cubes() {
    for(i=[0: 1: 10]) {
        translate([i, 0, 0]) cube([randz(i), randz(i), randz(i)]);
    }
}

// random cube pyramid - overhangs, not printable
module random_cube_pyramid() {
    t = 20;
    s = 3;
    translate([0, 0, -1])
    for(z=[0: 1: 10]) {
        for(i=[0: 1: 100]) {
            tz = randz(t);
            translate([rand(-z, z), rand(-z, z), z]) 
            cube([randz(s), randz(s), randz(s)]);
        }
    }
}

// sparse random cube cloud - not printable!
module sparse_random_cube_cloud() {
    t = 20;
    s = 3;
    translate([0, 0, -1])
    for(i=[0: 1: 100]) {
        tz = randz(t);
        translate([randz(t), randz(t), randz(t)]) 
          cube([randz(s), randz(s), randz(s)]);
    }
}

// dense random cube cloud - maybe printable?
module dense_random_cube_cloud() {
    t = 20;
    s = 3;
    translate([0, 0, -1])
    for(i=[0: 1: 5000]) {
        tz = randz(t);
        translate([randz(t), randz(t), randz(t)]) 
          cube([randz(s), randz(s), randz(s)]);
    }
}

// skyscrapers - random tall cubes
module skyscrapers() {
    t = 20;
    s = 3;
    translate([0, 0, -1])
    for(i=[0: 1: 100]) {
        tz = randz(t);
        translate([randz(t), randz(t), 0]) 
        cube([randz(s), randz(s), randz(tz)]);
    }
}

//random_cubes();
//random_cube_pyramid();
//sparse_random_cube_cloud();
//dense_random_cube_cloud();
skyscrapers();

