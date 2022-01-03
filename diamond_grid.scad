// 'infinite' 3d nested sparse frames
//
//   based on cube_recurse_3d; constructed of frames rather than solid cubes
//
// github.com/pchuck/generative-3d-models
//
use <ultrametrics_primitives.scad>;

levels = 4;
size = 100; // size of parent cube in mm
steps = 20; // number of nestings
angle = 90; // rotation per iteration
t = 1.0;

function dice(a, b) = rands(-1, 1, 1)[0] > 0 ? a : b;

function rand(l) = rands(0, l, 1)[0];

module cube_nest(s, x, y, z, ml, l) {
    s2 = s / 2; s4 = s / 4;
    translate([x, y, z]) {
        cube_frame(s, t);
    if(l < ml) {

/*        
        // randomly nest
        cube_nest(s2, dice(-s4, s4), dice(-s4, s4), dice(-s4, s4), ml, l + 1);
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

difference() {
//    translate([0, 0, 6 * size / 17])
        rotate([45, 35.5, 0])
            cube_nest(size, 0, 0, 0, levels, 0);

    translate([-size, -size, -size * 2]) // culling plane
        cube(size * 2); 
}

