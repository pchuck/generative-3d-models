// extended primitives
//
// github.com/pchuck/generative-3d-models
//

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
size = 10;
width = 1;
offset = 20;

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