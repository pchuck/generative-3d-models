// 'infinite' 3d nested cubes
//
// github.com/pchuck/generative-3d-models
//
size = 100; // size of parent cube in mm
steps = 20; // number of nestings
angle = 90; // rotation per iteration
t = 3.0; // fixed frame width

// cube - translated to center for easy nesting/recursion calcs
module i_cube(s) {
    translate([-s / 2, -s / 2, -s / 2])
    cube(s);
}

// a single side/wall of a cube
module side(s, r, w) {
    ns = s - w * 2;
    rotate(r)
    translate([-ns / 2, -ns / 2, -s / 2])
    cube([ns, ns, s]);
} 

// all sides (for subtractively exposing the inside of the cube)
module sides(s, w) {
    side(s, [  0,   0,  0], w); // top
    side(s, [  0, 180,  0], w); // bottom
    side(s, [  0,  90, 90], w); // left
    side(s, [ 90,  90, 90], w); // back
    side(s, [180,  90, 90], w); // right
    side(s, [270,  90, 90], w); // front
}

// a cubic frame (difference between the cube and its walls)
module cube_frame(s, w) {
   difference() {
        i_cube(s - 0.01); // cube
        sides(s, w); // minus sides
        i_cube(s - w * 2 * 0.99); 
   }
} 

// debug building blocks
//  i_cube(size);
//  sides(size);
//  cube_frame(size, t);

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


