// recursive cube constellation 
//
// github.com/pchuck/generative-3d-models
//
// generated complex fractal objects defined algorithmically for 3d printing
//
//   another recursive cube structure that converges on sierpinski pyramids
//
use <ultrametrics_primitives.scad>;

module cubes(s, l) {
    if(l < levels) {
        sp = s / f;
        sn = s / f * f;
        translate([ sn,  sn,  sn]) cubes(sp, l + 1);
        translate([-sp,  sn,  sn]) cubes(sp, l + 1);
        translate([-sp, -sp,  sn]) cubes(sp, l + 1);
        translate([ sn,  sn, -sp]) cubes(sp, l + 1);
        translate([-sp,  sn, -sp]) cubes(sp, l + 1);
        translate([-sp, -sp, -sp]) cubes(sp, l + 1);
    }
    cube([s, s, s]);

}

levels = 5; // recursion depth
f = 2; // distance and size scaling factor
size = 5; // cube size
cubes(size, 0);


