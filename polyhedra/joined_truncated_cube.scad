// Joined Truncated Cube
//   coords via: http://dmccooey.com/polyhedra/JoinedTruncatedCube.html
//
C0 = (1 + sqrt(2)) / 2;
C1 =  1 + sqrt(2);

scaling_factor = 20;

// rhombus - 0 8 2 6
f1 = [ [0, 8, 38], [2, 6, 38], [0, 6, 38], [2, 8, 38], [2, 6, 0, 8] ];
// kite -  37 21 3 13
f2 = [ [3, 13, 38], [3, 21, 38], [21, 37, 38], [3, 37, 21], [21, 3, 13, 37]];

vertices = [
 [ 0.0,  0.0,   C1], [ 0.0,  0.0,  -C1],
 [  C1,  0.0,  0.0], [ -C1,  0.0,  0.0],
 [ 0.0,   C1,  0.0], [ 0.0,  -C1,  0.0],
 [  C0,  0.5,   C0], [  C0,  0.5,  -C0], [  C0, -0.5,   C0], [  C0, -0.5,  -C0],
 [ -C0,  0.5,   C0], [ -C0,  0.5,  -C0], [ -C0, -0.5,   C0], [ -C0, -0.5,  -C0],
 [  C0,   C0,  0.5], [  C0,   C0, -0.5], [  C0,  -C0,  0.5], [  C0,  -C0, -0.5],
 [ -C0,   C0,  0.5], [ -C0,   C0, -0.5], [ -C0,  -C0,  0.5], [ -C0,  -C0, -0.5],
 [ 0.5,   C0,   C0], [ 0.5,   C0,  -C0], [ 0.5,  -C0,   C0], [ 0.5,  -C0,  -C0],
 [-0.5,   C0,   C0], [-0.5,   C0,  -C0], [-0.5,  -C0,   C0], [-0.5,  -C0,  -C0],
 [ 1.0,  1.0,  1.0], [ 1.0,  1.0, -1.0], [ 1.0, -1.0,  1.0], [ 1.0, -1.0, -1.0],
 [-1.0,  1.0,  1.0], [-1.0,  1.0, -1.0], [-1.0, -1.0,  1.0], [-1.0, -1.0, -1.0],
 [   0,    0,    0]
];

faces = [
  [ 30,  6,  2, 14], [ 30, 14,  4, 22], [ 30, 22,  0,  6],
  [ 31,  7,  1, 23], [ 31, 23,  4, 15], [ 31, 15,  2,  7],
  [ 32,  8,  0, 24], [ 32, 24,  5, 16], [ 32, 16,  2,  8],
  [ 33,  9,  2, 17], [ 33, 17,  5, 25], [ 33, 25,  1,  9],
  [ 34, 10,  0, 26], [ 34, 26,  4, 18], [ 34, 18,  3, 10],
  [ 35, 11,  3, 19], [ 35, 19,  4, 27], [ 35, 27,  1, 11],
  [ 36, 12,  3, 20], [ 36, 20,  5, 28], [ 36, 28,  0, 12],
  [ 37, 13,  1, 29], [ 37, 29,  5, 21], [ 37, 21,  3, 13],
  [  0,  8,  2,  6], [  0, 10,  3, 12],
  [  1,  7,  2,  9], [  1, 13,  3, 11],
  [  2, 15,  4, 14], [  2, 16,  5, 17],
  [  3, 18,  4, 19], [  3, 21,  5, 20],
  [  4, 26,  0, 22], [  4, 23,  1, 27],
  [  5, 24,  0, 28], [  5, 29,  1, 25]
];

scale(scaling_factor) {
  polyhedron(points=vertices, faces=faces, convexity=20);
/*
    polyhedron(points=vertices, faces=f1, convexity=20);
    polyhedron(points=vertices, faces=f2, convexity=20);
*/
}
