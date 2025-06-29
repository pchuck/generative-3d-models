// terrain generator
//
// github.com/pchuck/generative-3d-models
//
use <ultrametrics_primitives.scad>

levels = 7; // recursion depth
x = 256; // terrain size
y = 256;
smooth = 1;

// terrain generator
// implements a variant of midpoint displacement
//
module terrain(ul, ur, ll, lr, l) {
  xdist = lr.x - ll.x;
  ydist = ll.y - ul.y;
  
  // subdivide, generating t2, l2, r2, b2:
  //
  //     corners       quadrants
  //  ul _ t2 _ ur
  //   |   |    |       1    2
  //  l2 _ m2 _ r2
  //   |   |    |       3    4
  //  ll _ b2 _ lr
  //

  // only render connective polygons on the last iteration
  if(l == levels) {
    polyhedron(points = [ul, ur, lr, ll], faces = [[0, 1, 2, 3, 0]]);
  }

  if(l <= levels) {
    // potential improvement by randomzing and aligning adjacent midpoints
    // random z displacement for x, based on y distance
    //rxz = rand1(lr.y - ur.y) / 2 - (lr.y - ur.y) / 4;
    rxz = 0;
    // random z displacement for y, based on x distance
    //ryz = rand1(lr.x - ll.x) / 2 - (lr.x - ll.x) / 4;
    ryz = 0;

    // calculate midpoint x/y/z components
    t2x = ul.x + (ur.x - ul.x) / 2; t2y = ul.y;
    t2z = (ul.z + ur.z) / 2 + rxz;
    l2x = ul.x;                     l2y = ul.y + (ll.y - ul.y) / 2;
    l2z = (ul.z + ll.z) / 2 + ryz;
    r2x = ur.x;                     r2y = ur.y + (lr.y - ur.y) / 2;
    r2z = (ur.z + lr.z) / 2 + ryz;
    b2x = ll.x + (lr.x - ll.x) / 2; b2y = ll.y;
    b2z = (ll.z + lr.z) / 2 + rxz;
    m2x = b2x;                      m2y = r2y;
    m2z = (ul.z + ur.z + ll.z + lr.z) / 4 +
        rand1(xdist) / smooth -
        xdist / smooth / 2;

    // assemble midpoints
    t2 = [t2x, t2y, t2z];
    l2 = [l2x, l2y, l2z];
    r2 = [r2x, r2y, r2z];
    b2 = [b2x, b2y, b2z];
    m2 = [m2x, m2y, m2z];

    // recurse quadrants 1..4
    terrain(ul, t2, l2, m2, l + 1);
    terrain(t2, ur, m2, r2, l + 1);
    terrain(l2, m2, ll, b2, l + 1);
    terrain(m2, r2, b2, lr, l + 1);
  }
}

// bounding corner points
ul = [0, 0, 0];
ur = [x, 0, 0];
ll = [0, y, 0];
lr = [x, y, 0];

// landscape generation
translate([-x/2, -y/2, 0]) 
  terrain(ul, ur, ll, lr, 0);

// water elevation
translate([-x/2, -y/2, -32])
  color([0, 0, 0.5, 0.9])
    cube([x, y, 32]);
