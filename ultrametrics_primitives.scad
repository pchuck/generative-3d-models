// extended primitives
//
// github.com/pchuck/generative-3d-models
//


// random shortcuts/helpers
//

function rand(min, max) = rands(min, max, 1)[0];
function rand0(max) = rands(0, max, 1)[0];
function rand1(max) = rands(1, max, 1)[0];
function dice(a, b) = rands(-1, 1, 1)[0] > 0 ? a : b;
function flip() = rands(0, 1, 1)[0] > 0.5;
function flipt(t) = rands(0, 1, 1)[0] > t;

// input : list of numbers
// output : sorted list of numbers
function quicksort(arr) = !(len(arr)>0) ? [] : let(
    pivot   = arr[floor(len(arr)/2)],
    lesser  = [ for (y = arr) if (y  < pivot) y ],
    equal   = [ for (y = arr) if (y == pivot) y ],
    greater = [ for (y = arr) if (y  > pivot) y ]
) concat(
    quicksort(lesser), equal, quicksort(greater)
);

function distance(x1, y1, z1, x2, y2, z2) =
     sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2 + (z2 - z1) ^ 2);


// sphere-based primitives
//

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


// cube-based primitives
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


// more complex fractal shapes
//

// fractal growth
module growth(dim, bf, sf, rf, t, s, r, n) {
    f1 = 0.5; f2 = 0.7; // z-size factor range
    zfact = 0.95; // z-translation factor, to ensure connected branches
    
    if(n > 0) {
        translate(t) {
            rotate(r) {
                if(dim == 2) cube([s.x, s.y, s.z]);
                else cylinder(r=s.x, h=s.z);
                for(i=[1:1:bf]) { // branching factor
                    tn = [t.x, t.y, s.z / i * zfact]; // translation
                    sn = [s.x * sf, s.y * sf, s.z * rand(f1, f2)]; // scale
                    rn = dim == 2 ? // rotation
                        [rand(-r.x, r.x) + rand(-rf, rf), 0, 0] : 
                        [rand(-r.x, r.x) + rand(-rf, rf), 
                         rand(-r.y, r.y) + rand(-rf, rf),
                         rand(-r.z, r.z) + rand(-rf, rf)];
                    growth(dim, bf, sf, rf, // d, branch, scale, rotation factor
                           tn, // translate
                           sn, // size
                           rn, // rotation
                           n - 1); 
                 }
            }
        }
    }
}


// unit tests / samples
//
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

