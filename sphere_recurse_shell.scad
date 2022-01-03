// sphere shell recursion
//
// github.com/pchuck/generative-3d-models
//
size = 100; // size (in mm)
levels = 3; // recurion limit
d = 2; // div factor

module s_r(s, x, y, z, l) {
  sd = s / d; s3 = s / 3; l1 = l + 1;
  translate([x, y, z]) {
    sphere(sd);
    if(l < levels) {
        s_r(sd,  s3,  s3,  s3, l1);
        s_r(sd,  s3, -s3,  s3, l1);
        s_r(sd, -s3,  s3,  s3, l1);
        s_r(sd, -s3, -s3,  s3, l1);
        s_r(sd,  s3,  s3, -s3, l1);
        s_r(sd,  s3, -s3, -s3, l1);
        s_r(sd, -s3,  s3, -s3, l1);
        s_r(sd, -s3, -s3, -s3, l1);
    }
  }
}

sd = size / d;
difference() {  // subtract everything below the z-plane
    difference() { // subtract the shell from the recursions
        difference() { // subtract inner and outer to produce shell
            sphere(sd * 1.05);
            sphere(sd);
        }
        s_r(size, 0, 0, 0, 0); // produce the recursive nested shape
    }

    translate([-size, -size, -size * 2]) // culling plane
        cube(size * 2); 
}


