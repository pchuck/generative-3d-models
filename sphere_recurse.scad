// recursive sphere constellation 
//
// github.com/pchuck/generative-3d-models
//
// first attempt at using openscad + prusa mini+ to generate
// complex fractal objects defined algorithmically for 3d printing
//
levels = 4;
size = 100;

function r(s, l) = s;
//function r(s, l) = rands(0.98, 1.02, 1)[0] * s;
//function r(s, l) = rands(1 - (50 - l * 5) / 100, 1 + (50 - l * 5) / 100, 1)[0] * s;

module spheres(s, x, y, z, l) {
    s2 = s / 2;
    translate([x, y, z]) sphere(s);
    if(l < levels) {
        spheres(r(s2, l),  r(x, l),      r(y, l) + s, r(z, l),     l + 1);
        spheres(r(s2, l),  r(x, l),     -r(y, l) - s, r(z, l),     l + 1);
        spheres(r(s2, l), -r(x, l) - s,  r(y, l),     r(z, l),     l + 1);
        spheres(r(s2, l),  r(x, l) + s,  r(y, l),     r(z, l),     l + 1);
        spheres(r(s2, l),  r(x, l),      r(y, l),     r(z, l) + s, l + 1);
//      spheres(r(s2, l),  r(x, l),      r(y, l),     r(z, l) - s, l + 1);
    }
}

bounds = 1000;
//intersection() {
  spheres(size, 0, 0, 0, 0);
//  translate([-bounds/2, -bounds/2, 0]) cube(bounds);
//}

