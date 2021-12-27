// recursively stacked cubes (alternate implementation, w/ size & translation)
//
// github.com/pchuck/generative-3d-models
//
// generated complex fractal objects defined algorithmically for 3d printing
//
//
levels = 5;
size = 10;
f = 0.5; // size scaling factor
t = 1 / 2; // xy translation

module c_cube(s) {
    tf = 0.75; stf = s * tf;
    translate([-s / 2, -s / 2, -s / 2]) 
    difference() {
        cube(s);
        translate([ stf,  stf, stf]) cube(s); 
        translate([ stf, -stf, stf]) cube(s); 
        translate([-stf,  stf, stf]) cube(s); 
        translate([-stf, -stf, stf]) cube(s); 
//        translate([ stf,  stf, -stf]) cube(s); 
//        translate([ stf, -stf, -stf]) cube(s); 
//        translate([-stf,  stf, -stf]) cube(s); 
//        translate([-stf, -stf, -stf]) cube(s); 
    }
}

module cubes(s, x, y, z, l) {
    translate([x, y, z]) c_cube(s);
    sf = s * f; st = s * t;
    if(l < levels) {
        cubes(sf, x,       y + st, z,      l + 1);
        cubes(sf, x,       y - st, z,      l + 1);    
        cubes(sf, x + st,  y,      z,      l + 1);
        cubes(sf, x - st,  y,      z,      l + 1);
        cubes(sf, x,       y,      z + st, l + 1);
//        cubes(sf, x,       y,      z - st, l + 1);
    }
}

// render the cubes and cull everything below z=0
difference() {
    cubes(size, 0, 0, 0, 0); // recursive cubes
    translate([-size, -size, -size * 2]) // culling plane
        cube(size * 2); 
}

