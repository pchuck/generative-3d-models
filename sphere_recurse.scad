// recursive sphere constellation 
//
// github.com/pchuck/generative-3d-models
//
// first attempt at using openscad + prusa mini+ to generate
// complex fractal objects defined algorithmically for 3d printing
//
levels = 5;
size = 100;

//function r(s) = s;
function r(s) = rands(0.98, 1.02, 1)[0] * s;

module spheres(s, x, y, z, l) {
    s2 = s / 2;
    translate([x, y, z]) sphere(s);
    if(l < levels) {
        spheres(r(s2),  r(x),      r(y) + s, r(z),     l + 1);
        spheres(r(s2),  r(x),     -r(y) - s, r(z),     l + 1);
        spheres(r(s2), -r(x) - s,  r(y),     r(z),     l + 1);
        spheres(r(s2),  r(x) + s,  r(y),     r(z),     l + 1);
        spheres(r(s2),  r(x),      r(y),     r(z) + s, l + 1);
//      spheres(r(s2),  r(x),      r(y),     r(z) - s, l + 1);
    }
}

bounds = 1000;
intersection() {
  spheres(size, 0, 0, 0, 0);
  translate([-bounds/2, -bounds/2, 0]) cube(bounds);
}

