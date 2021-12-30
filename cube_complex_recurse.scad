// recursive cube constellation 
//
// github.com/pchuck/generative-3d-models
//
// generated complex fractal objects defined algorithmically for 3d printing
//
//
levels = 2;
f = 1; // size scaling factor
t = 1 / 2; // xy translation

module c_cube(s, l) {
    tf = 2/3;
    if(l == levels) {
        translate([-s / 2, -s / 2, -s / 2]) 
        difference() {
            cube(s);
            translate([ s * tf,           s * tf,  s * tf]) cube(s); 
            translate([ s * tf,          -s * tf,  s * tf]) cube(s); 
            translate([-s * tf,           s * tf,  s * tf]) cube(s); 
            translate([-s * tf,          -s * tf,  s * tf]) cube(s); 
          
            translate([s / 3,             s / 3,   s * tf + 0.01]) cube(s / 3); 
            translate([s / 3,             -0.01,   s * tf / 2])    cube(s / 3);
            translate([-0.01,             s / 3,   s * tf / 2])    cube(s / 3); 

            translate([s / 3,             s / 3,            -0.01])      cube(s / 3); 
            translate([s / 3,             2 * s / 3 + 0.01, s * tf / 2]) cube(s / 3); 
            translate([2 * s / 3 + 0.01,  s / 3,            s * tf / 2]) cube(s / 3); 
            translate([s / 3 - 0.02,      s / 3 - 0.02,     s * tf / 2 - 0.02]) cube(s / 2.9);

            translate([ s * tf,  s * tf, -s * tf]) cube(s); 
            translate([ s * tf, -s * tf, -s * tf]) cube(s); 
            translate([-s * tf,  s * tf, -s * tf]) cube(s); 
            translate([-s * tf, -s * tf, -s * tf]) cube(s); 
        }
    }
}

module cubes(x, y, z, s, l) {
    translate([x, y, z]) c_cube(s * f, l);

    if(l < levels) {
        cubes( x + s / 3,          y - s / 3, z,         s / 3, l + 1);
        cubes( x - s / 3,          y + s / 3, z,         s / 3, l + 1);
        cubes( x - s / 3,          y - s / 3, z,         s / 3, l + 1);
        cubes( x + s / 3,          y + s / 3, z,         s / 3, l + 1);
        
        cubes( x,                  y + s / 3, z - s / 3, s / 3, l + 1);
        cubes( x + s / 3,          y,         z - s / 3, s / 3, l + 1);
        cubes( x,                  y - s / 3, z - s / 3, s / 3, l + 1);
        cubes( x - s / 3,          y,         z - s / 3, s / 3, l + 1);     
 
        cubes( x,                  y + s / 3, z + s / 3, s / 3, l + 1);
        cubes( x + s / 3,          y,         z + s / 3, s / 3, l + 1);
        cubes( x,                  y - s / 3, z + s / 3, s / 3, l + 1);
        cubes( x - s / 3,          y,         z + s / 3, s / 3, l + 1);   
    }
}

bounds = 100;
size = 15;
trans = 0;
translate([trans, trans, 0])
intersection() {
  cubes(0, 0, 0, size, 0);
  translate([-bounds/2, -bounds/2, 0]) cube(bounds);
}

