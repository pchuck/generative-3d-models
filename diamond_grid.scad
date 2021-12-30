// 'infinite' 3d nested sparse frames
//
//   based on cube_recurse_3d; constructed of frames rather than solid cubes
//
// github.com/pchuck/generative-3d-models
//
levels = 4;
size = 100; // size of parent cube in mm
steps = 20; // number of nestings
angle = 90; // rotation per iteration
t = 1.0;

// cube - translated to center for easy nesting/recursion calcs
module i_cube(s) {
    translate([-s / 2, -s / 2, -s / 2])
    cube(s);
}

// a single side/wall of a cube
module side(s, r, w) {
//    ns = s - s * w * 2; // w is proportional to size
    ns = s - w * 2; // w is absolute size

    rotate(r)
        translate([-ns / 2, -ns / 2, -s / 2])
            cube([ns, ns, s]);
} 

// all sides (for subtractively exposing the inside of the cube)
module sides(s, w) {
//    side(s, [  0,   0,  0], w); // top
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


function dice(a, b) = rands(-1, 1, 1)[0] > 0 ? a : b;

function rand(l) = rands(0, l, 1)[0];

module cube_nest(s, x, y, z, ml, l) {
    s2 = s / 2; s4 = s / 4;
    translate([x, y, z]) {
        cube_frame(s, t);
    if(l < ml) {
        
        // random nest
//        cube_nest(s2, dice(-s4, s4), dice(-s4, s4), dice(-s4, s4), ml, l + 1);

/*        
        // randomly recurse quandrants, alt
            if(rand(l)) cube_nest(s2,  s4,  s4,  s4, ml, l + 1);
            if(rand(l)) cube_nest(s2, -s4, -s4, -s4, ml, l + 1);
            if(rand(l)) cube_nest(s2, -s4,  s4, -s4, ml, l + 1);
            if(rand(l)) cube_nest(s2,  s4, -s4, -s4, ml, l + 1);
            if(rand(l)) cube_nest(s2, -s4, -s4,  s4, ml, l + 1);
            if(rand(l)) cube_nest(s2,  s4, -s4,  s4, ml, l + 1);
            if(rand(l)) cube_nest(s2,  s4,  s4,  s4, ml, l + 1);
            if(rand(l)) cube_nest(s2,  s4,  s4, -s4, ml, l + 1);
*/
        
        // randomly recurse quandrants
        cube_nest(s2,  s4,  s4,  s4, rand(6), l + 1);
        cube_nest(s2, -s4,  s4,  s4, rand(5), l + 1);
        cube_nest(s2,  s4, -s4,  s4, rand(4), l + 1);
        cube_nest(s2, -s4, -s4,  s4, rand(3), l + 1);        
        cube_nest(s2,  s4,  s4, -s4, rand(5), l + 1);
        cube_nest(s2, -s4,  s4, -s4, rand(4), l + 1);
        cube_nest(s2,  s4, -s4, -s4, rand(3), l + 1);
        cube_nest(s2, -s4, -s4, -s4, rand(2), l + 1);

/*
        // populate all quadrants
        cube_nest(s2,  s4,  s4,  s4, ml, l + 1);
        cube_nest(s2, -s4, -s4, -s4, ml, l + 1);
        cube_nest(s2, -s4,  s4, -s4, ml, l + 1);
        cube_nest(s2,  s4, -s4, -s4, ml, l + 1);
        cube_nest(s2, -s4, -s4,  s4, ml, l + 1);
        cube_nest(s2,  s4, -s4,  s4, ml, l + 1);
        cube_nest(s2,  s4,  s4,  s4, ml, l + 1);
        cube_nest(s2,  s4,  s4, -s4, ml, l + 1);
*/
    }
}
}
    
// debug building blocks
//  i_cube(size);
//  sides(size, thick);
//  cube_frame(size, t);

difference() {
//    translate([0, 0, 6 * size / 17])
        rotate([45, 35.5, 0])
            cube_nest(size, 0, 0, 0, levels, 0);

    translate([-size, -size, -size * 2]) // culling plane
        cube(size * 2); 
}

