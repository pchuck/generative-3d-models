// recursive cube constellation 
//
// github.com/pchuck/generative-3d-models
//
// generated complex fractal objects defined algorithmically for 3d printing
//
//
levels = 4;
f = 0.5; // size scaling factor
t = 1 / 2; // xy translation

module c_cube(s) {
    tf = 0.75;
    translate([-s / 2, -s / 2, -s / 2]) 
      difference() {
        cube(s);
        translate([ s * tf,  s * tf, s * tf]) cube(s); 
        translate([ s * tf, -s * tf, s * tf]) cube(s); 
        translate([-s * tf,  s * tf, s * tf]) cube(s); 
        translate([-s * tf, -s * tf, s * tf]) cube(s); 
//        translate([ s * tf,  s * tf, -s * tf]) cube(s); 
//        translate([ s * tf, -s * tf, -s * tf]) cube(s); 
//        translate([-s * tf,  s * tf, -s * tf]) cube(s); 
//        translate([-s * tf, -s * tf, -s * tf]) cube(s); 

      }
}

module cubes(x, y, z, s, l) {
    translate([x, y, z]) c_cube(s);

    if(l < levels) {
        cubes( x,          y + s * t, z,         s * f, l + 1);
        cubes( x,          y - s * t, z,         s * f, l + 1);
                
        cubes( x + s * t,  y,         z,         s * f, l + 1);
        cubes( x - s * t,  y,         z,         s * f, l + 1);

        cubes( x,          y,         z + s * t, s * f, l + 1);
//        cubes( x,          y,         z - s * t, s * f, l + 1);


    }
}

bounds = 100;
size = 10;
trans = 0;
translate([trans, trans, 0])
intersection() {
  cubes(0, 0, 0, size, 0);
//  translate([-bounds/2, -bounds/2, 0]) cube(bounds);
}

