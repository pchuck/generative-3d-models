// configurable case riser wedges
//   for vase mode printing
//

// make noise 104hp case, 80deg riser wedge
d = 26; // width of riser (mm)
x = 130.55; // case dimensions (mm)
y =  69.85;
z = 546.10; 
t = 70; // 'theta', angle of rotation (degrees)
r = 10; // rise in (mm)

// norns 45deg riser wedge
/*
d = 90;
x = 80;
y = 90;
z = 43; 
t = 45;
r = 10;
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
  linear_extrude(depth)
    polygon(points=p1, paths=[[0, 1, 2]], convexity=10);
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
riser();
