// recursively stacked cubes
//
// github.com/pchuck/generative-3d-models
//
// generated complex fractal objects defined algorithmically for 3d printing
//
levels = 4;
size = 100;
r = 0.01;

function r(s, l) = s;
// or, for some randomness...
//function r(s, l) = rands(0.5, 1.5, 1)[0] * s;

// a cube recursively surrounded by smaller cubes, and with corner cutouts
module cubes(s, x, y, z, l) {
    s2 = s / 2; s4 = s / 4;

    translate([x, y, z]) {
        difference() {
            // the cube
            cube(s);
            // corner cutouts
            translate([  - s4,   - s4, s - s4 - r]) cube(s2);
            translate([s - s4, s - s4, s - s4 - r]) cube(s2);
            translate([s - s4,   - s4, s - s4 - r]) cube(s2);
            translate([  - s4, s - s4, s - s4 - r]) cube(s2);
        }
        if(l < levels) {
            // recursion
            cubes(r(s2, l), -r(s4, l),      r(s4, l),      r(s4, l), l + 1); // +x
            cubes(r(s2, l),  r(s4, l),     -r(s4, l),      r(s4, l), l + 1); // -y
            cubes(r(s2, l),  r(s4, l),      r(s2, l) + s4, r(s4, l), l + 1); // +y
            cubes(r(s2, l),  r(s2, l) + s4, r(s4, l),      r(s4, l), l + 1); // -x
            cubes(r(s2, l),  r(s4, l),      r(s4, l),  s - r(s4, l), l + 1); // +z
        }
    }
}

// render the cubes and cull everything below z=0
difference() {
    cubes(size, -size/2, -size/2, -size/2, 0); // recursive cubes
    translate([-size, -size, -size * 2]) // culling plane
        cube(size * 2); 
}

