// extended primitives
//
// github.com/pchuck/generative-3d-models
//

// random shortcuts
function rand(min, max) = rands(min, max, 1)[0];
function rand0(max) = rands(0, max, 1)[0];
function rand1(max) = rands(1, max, 1)[0];
function dice(a, b) = rands(-1, 1, 1)[0] > 0 ? a : b;

// a sphere of diameter 's' centered in 3-space (the scad default)
module sphere_centered(s) {
    sphere(s);
}

// a hollow sphere of diameter 's' and thickness 'w'
module sphere_shell(s, w) {
    difference() {
      sphere_centered(s);
      sphere_centered(s - w);
    }
}

// ring of diameter 's' and thickness 'w'
module ring(s, w) {
    difference() {
      sphere_shell(s, w);
      translate([0, 0,  s + w]) cube_centered(s * 2);
      translate([0, 0, -s - w]) cube_centered(s * 2);
    }
}

// a cube centered in 3-space
module cube_centered(s) {
    translate([-s / 2, -s / 2, -s / 2])
    cube(s);
}

// a single side/wall of a cube, with a fixed frame width
// with the specified size, rotation vector and wall width
module cube_wall(s, r, w) {
    ns = s - w * 2;
    rotate(r)
    translate([-ns / 2, -ns / 2, -s / 2])
    cube([ns, ns, w]);
}

// all sides (for subtractively exposing the inside of the cube)
module cube_shell(s, w) {
    cube_wall(s, [  0,   0,  0], w); // top
    cube_wall(s, [  0, 180,  0], w); // bottom
    cube_wall(s, [  0,  90, 90], w); // left
    cube_wall(s, [ 90,  90, 90], w); // back
    cube_wall(s, [180,  90, 90], w); // right
    cube_wall(s, [270,  90, 90], w); // front
}

// a cubic frame (difference between the cube and its walls)
module cube_frame(s, w) {
   fudge = 0.01;
   difference() {
        cube_centered(s - fudge); // cube
        cube_shell(s, w); // minus sides
        cube_centered(s - w * 2 * (1 - fudge));
   }
}

angle = 90;
size = 20;
width = 1;
offset = 30;

// cube centered
translate([offset * 0, 0, 0]) cube_centered(size);

// a few cube walls
translate([offset * 1, 0, 0]) cube_wall(size, [0,         0,     0], width);
translate([offset * 1, 0, 0]) cube_wall(size, [0, angle * 2,     0], width);
translate([offset * 1, 0, 0]) cube_wall(size, [0, angle * 3, angle], width);

// cube shell
translate([offset * 2, 0, 0]) cube_shell(size, width);

// cube frame
translate([offset * 3, 0, 0]) cube_frame(size, width);

// sphere
translate([offset * -1, 0, 0]) sphere_centered(size / 2);

// sphere shell
translate([offset * -2, 0, 0]) {
    difference() {
        sphere_shell(size / 2, width);
        translate([0, -size / 2, 0]) cube_centered(size);
    }
}

// ring
translate([offset * -3, 0, 0]) ring(size / 2, width);
