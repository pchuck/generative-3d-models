// recursive random touching rings
//
// github.com/pchuck/generative-3d-models
//
use <ultrametrics_primitives.scad>;

levels = 50;
width = 1;
range = 10;
size = 10;

// seed ring
rings = [[rand(-range, range), rand(-range, range), 0, size / 2]];
translate([rings[0].x, rings[0].y, 0]) ring(size / 2, width);
echo(rings);

module recurse_rings(rings, l) {
    if(l < levels) {
        x = rand(-range, range);
        y = rand(-range, range);
        z = 0;
        s = distance(rings[l].x, rings[l].y, rings[l].z, x, y, z) - rings[l][3] + 1;
        rings = concat(rings, [[x, y, z, s]]);
        translate([x, y, z]) ring(s, width);
            recurse_rings(rings, l + 1);
    }
}

recurse_rings(rings, 0);
