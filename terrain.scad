// terrain generator
//
// github.com/pchuck/generative-3d-models
//
use <ultrametrics_primitives.scad>

max = 16; // max elevation
w = 128; // terrain size
levels = 6; // recursion levels

// terrain generation using variation on midpoint displacement
//
module terrain(ul, ur, ll, lr, l) {
  // these should be equal
  xdist = lr.x - ll.x;
  ydist = ll.y - ul.y;
  
  // subdivide using midpoint displacement, generating t2, l2, r2, b2:
  //
  //  ul   t2   ur
  //
  //  l2   m2   r2
  //
  //  ll   b2   lr
  //

  // only render connective polygons on the last iteration
  if(l == levels) {
    polyhedron(points = [ul, ur, lr, ll], faces = [[0, 1, 2, 3, 0]]);
  }

  if(l <= levels) {
    // calculated midpoint x/y components
    //
    // random z displacement for x, based on y distance
//    rxz = rand1(lr.y - ur.y) / 2 - (lr.y - ur.y) / 4;
    rxz = 0;
    // random z displacement for y, based on x distance
//    ryz = rand1(lr.x - ll.x) / 2;
    ryz = 0;
    
    t2x = ul.x + (ur.x - ul.x) / 2;
    t2y = ul.y;
    t2z = (ul.z + ur.z) / 2 + rxz; // +           rand1(t2x - ul.x) / 2;
    l2x = ul.x;
    l2y = ul.y + (ll.y - ul.y) / 2;
    l2z = (ul.z + ll.z) / 2 + ryz; // +           rand1(ll.y - l2y) / 2;
    r2x = ur.x;
    r2y = ur.y + (lr.y - ur.y) / 2;
    r2z = (ur.z + lr.z) / 2 + ryz; // +           rand1(lr.y - r2y) / 2;
    b2x = ll.x + (lr.x - ll.x) / 2;
    b2y = ll.y;
    b2z = (ll.z + lr.z) / 2 + rxz; //  +           rand1(lr.x - b2x) / 2;
    m2x = b2x;
    m2y = r2y;
    m2z = (ul.z + ur.z + ll.z + lr.z) / 4 + rand1(xdist) - xdist / 2;

    // assemble midpoints
    //
    t2 = [t2x, t2y, t2z];
    l2 = [l2x, l2y, l2z];
    r2 = [r2x, r2y, r2z];
    b2 = [b2x, b2y, b2z];
    m2 = [m2x, m2y, m2z];

    // recurse
    terrain(ul, t2, l2, m2, l + 1); // (ul.z + t2.z + l2.z + m1.z) / 4);
    terrain(t2, ur, m2, r2, l + 1); // (t2.z + ur.z + m2.z + r2.z) / 4);
    terrain(l2, m2, ll, b2, l + 1); // (l2.z + m2.z + ll.z + b2.z) / 4);
    terrain(m2, r2, b2, lr, l + 1); // (m2.z + r2.z + b2.z + lr.z) / 4);
  }
}

// generate the initial corners
ul = [0, 0, rand1(max)];
ur = [w, 0, rand1(max)];
ll = [0, w, rand1(max)];
lr = [w, w, rand1(max)];

// generate
translate([-w/2, -w/2, 0]) 
  terrain(ul, ur, ll, lr, 0);
