// configurable case riser wedges
//   with internal cutout
//

// whether to render cutouts or solid (2d extrusion only)
2d = false;

// make noise 104hp case, 60deg riser wedge
f = 0.8; // cutout scaling factor
d = 26; // width of riser (mm)
x = 120; // case dimensions, 130.55mm actual
y =  60; // 69.85mm actual
z = 546.10; 
t = 60; // 'theta', angle of rotation (degrees)
r = 8; // rise in (mm)

// norns 45deg riser wedge
/*
f = 0.9;
d = 90;
x = 80;
y = 43;
z = 90; 
t = 45;
r = 1;
*/

// norns or nts-1 45deg riser wedge, short
/*
f = 0.95;
d = 110; // actual width is 13cm, feet at 11cm
x = 80;
y = 20;
z = 110; 
t = 45;
r = 1.5;
*/

module case() {
  p = [[0, 0], [x, 0], [x, y], [0, y]];
  rotate([0, 0, t])
    polygon(points=p, paths=[[0, 1, 2, 3]], convexity=10);
}

module wedge(x, y, depth) {
  p1_0 = [0, 0];
  p1_1 = [x, 0];
  p1_2 = [x, y];
  p1 = [p1_0, p1_1, p1_2];
  x_s =  abs(x / y) * abs(x) / x / f;
  y_s = -abs(y / x) * abs(y) / y / f;
  difference() {
    linear_extrude(depth)
      polygon(points=p1, paths=[[0, 1, 2]], convexity=10);
    if(2d == false) { // whether to subtract cutouts
//      minkowski() {
      linear_extrude(depth + 1) 
        translate([x * (1 - f) / 2 + x_s / 2, // /8 for short (nts1)
                   y * (1 - f) / 4 + y_s / 4, 0])
        scale([f, f, 0])
        polygon(points=p1, paths=[[0, 1, 2]], convexity=10);
//      cylinder(r=2,h=1); }
     }
  }
}

module rect(x1, x2, depth) {
  p0 = [ x1, -r];
  p1 = [ x1,  0];
  p2 = [ x2,  0];
  p3 = [ x2, -r];
  p = [p0, p1, p2, p3];
  linear_extrude(depth)
    polygon(points=p, paths=[[0, 1, 2, 3]], convexity=10);
}

module riser() {
  // calculate rotation of first and third corners to produce the riser
  x1 = -sin(t) * y; y1 =  cos(t) * y;
  wedge(x1, y1, d);
  x2 = cos(t) * x; y2 = sin(t) * x;
  wedge(x2, y2, d);
  // create the base
  rect(x1, x2, d);
}

// case();
// minkowski() {
riser();
// cylinder(r=2,h=1); }


