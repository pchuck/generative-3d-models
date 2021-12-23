// recursive sphere constellation 
//
// github.com/pchuck/generative-3d-models
//
// first attempt at using openscad + prusa mini+ to generate
// complex fractal objects defined algorithmically for 3d printing
//
levels = 2;

module spheres(x, y, z, s, l) {
    translate([x, y, z]) sphere(s);
    if(l < levels) {
        spheres( x,      y + s, z,     s / 2, l + 1);
        spheres( x,     -y - s, z,     s / 2, l + 1);
        spheres(-x - s,  y,     z,     s / 2, l + 1);
        spheres( x + s,  y,     z,     s / 2, l + 1);
        spheres( x,      y,     z + s, s / 2, l + 1);
//      spheres( x,      y,     z - s, s / 2, l + 1);
    }
}

bounds = 100;
radius = 10;
//translate([50, 50, 0])
intersection() {
  spheres(0, 0, 0, radius, 0);
  translate([-bounds/2, -bounds/2, 0]) cube(bounds);
}
