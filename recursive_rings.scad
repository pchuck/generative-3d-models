// nested recursive rings
//
// github.com/pchuck/generative-3d-models
//
use <ultrametrics_primitives.scad>;

limit = 4;
width = 0.5;
size = 25;
mult = 1;
angle = 90 / size * mult;
t = 0.25;
pi = 3.14159;

module rings1(s, x, y, z, n) {
    s2 = s / 2; 
    translate([x, y, z])
        ring(s, width);
    if(n < limit) {
        rings1(s2, x - s2 , y, z, n + 1);
        rings1(s2, x + s2 , y, z, n + 1);
        rings1(s2, x , y - s2, z, n + 1);
        rings1(s2, x , y + s2, z, n + 1);
    }
}

module rings2(s, x, y, z, n) {
    s2 = s / 2; s3 = s / 3; sp = s / pi / 2;
    translate([x, y, z])
        ring(s, width);
    if(n < limit) {
        rings2(s2, x - s2 , y, z, n + 1);
        rings2(s2, x + s2 , y, z, n + 1);
        rings2(s3, x , y - s2 - sp, z, n + 1);
        rings2(s3, x , y + s2 + sp, z, n + 1);

    }
}


//rings1(size, 0, 0, 0, 0);
rings2(size, 0, 0, 0, 0);



//cube_frame(size, width);
