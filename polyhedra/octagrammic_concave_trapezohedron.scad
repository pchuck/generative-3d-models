// Octagrammic Concave Trapezohedron
//   coords via:
//     http://dmccooey.com/polyhedra/OctagrammicConcaveTrapezohedron.html
//
scaling_factor = 100;

C0 = (sqrt(2) - 1) / 2;
C1 = sqrt(2 - sqrt(2)) / 2;
C2 = sqrt(2 * (30 - 20 * sqrt(2) - sqrt(2 * (850 - 601 * sqrt(2))))) / 4;
C3 = sqrt(2 * (2 - sqrt(2))) / 2;
C4 = sqrt(2 * (4 * sqrt(2) + 3 * sqrt(2 * (2 - sqrt(2))) - 2)) / 4;

vertices = [
  [0.0,  0.0,  C2], [0.0,  0.0, -C2], 
  [C3,  0.0,  C4], [-C3,  0.0,  C4], 
  [0.0,   C3,  C4], [0.0,  -C3,  C4], 
  [-C1,  -C1,  C4], [-C1,   C1,  C4], 
  [C1,  -C1,  C4], [C1,   C1,  C4], 
  [-C0,  0.5, -C4], [-C0, -0.5, -C4], 
  [C0,  0.5, -C4], [C0, -0.5, -C4], 
  [0.5,  -C0, -C4], [0.5,   C0, -C4], 
  [-0.5,  -C0, -C4], [-0.5,   C0, -C4]
];

faces = [
  [ 0,  2, 10,  6], [ 0,  6, 14,  4], [ 0,  4, 16,  8], [ 0,  8, 12,  3], 
  [ 0,  3, 13,  9], [ 0,  9, 17,  5], [ 0,  5, 15,  7], [ 0,  7, 11,  2], 
  [ 1, 10,  2, 11], [ 1, 11,  7, 15], [ 1, 15,  5, 17], [ 1, 17,  9, 13], 
  [ 1, 13,  3, 12], [ 1, 12,  8, 16], [ 1, 16,  4, 14], [ 1, 14,  6, 10]
];

scale(scaling_factor) {
  polyhedron(points=vertices, faces=faces, convexity=20);
}
