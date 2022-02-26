// Rhombic Hexecontahedron
//   coords via: http://dmccooey.com/polyhedra/RhombicHexecontahedron.html
//
scaling_factor = 10;

C0 = sqrt(10 * (5 - sqrt(5))) / 10;
C1 = sqrt(10 * (5 + sqrt(5))) / 10;
C2 = sqrt(5 * (5 + 2 * sqrt(5))) / 5;
C3 = sqrt(10 * (5 + sqrt(5))) / 5;
C4 = sqrt(10 * (25 + 11 * sqrt(5))) / 10;

vertices = [
  [0.0, 0.0,  C3], [0.0, 0.0, -C3],
  [ C3, 0.0, 0.0], [-C3, 0.0, 0.0],
  [0.0,  C3, 0.0], [0.0, -C3, 0.0],
  [0.0,  C1,  C4], [0.0,  C1, -C4],
  [0.0, -C1,  C4], [0.0, -C1, -C4],
  [ C4, 0.0,  C1], [ C4, 0.0, -C1], [-C4, 0.0,  C1], [-C4, 0.0, -C1],
  [ C1,  C4, 0.0], [ C1, -C4, 0.0], [-C1,  C4, 0.0], [-C1, -C4, 0.0],
  [ C0, 0.0,  C1], [ C0, 0.0, -C1], [-C0, 0.0,  C1], [-C0, 0.0, -C1],
  [ C1,  C0, 0.0], [ C1, -C0, 0.0], [-C1,  C0, 0.0], [-C1, -C0, 0.0],
  [0.0,  C1,  C0], [0.0,  C1, -C0], [0.0, -C1,  C0], [0.0, -C1, -C0],
  [ C0,  C1,  C2], [ C0,  C1, -C2], [ C0, -C1,  C2], [ C0, -C1, -C2],
  [-C0,  C1,  C2], [-C0,  C1, -C2], [-C0, -C1,  C2], [-C0, -C1, -C2],
  [ C2,  C0,  C1], [ C2,  C0, -C1], [ C2, -C0,  C1], [ C2, -C0, -C1],
  [-C2,  C0,  C1], [-C2,  C0, -C1], [-C2, -C0,  C1], [-C2, -C0, -C1],
  [ C1,  C2,  C0], [ C1,  C2, -C0], [ C1, -C2,  C0], [ C1, -C2, -C0],
  [-C1,  C2,  C0], [-C1,  C2, -C0], [-C1, -C2,  C0], [-C1, -C2, -C0],
  [ C2,  C2,  C2], [ C2,  C2, -C2], [ C2, -C2,  C2], [ C2, -C2, -C2],
  [-C2,  C2,  C2], [-C2,  C2, -C2], [-C2, -C2,  C2], [-C2, -C2, -C2]
];

faces = [
  [18,  0,  8, 32], [18, 32, 56, 40], [18, 40, 10, 38], [18, 38, 54, 30], [18, 30,  6,  0],
  [19,  1,  7, 31], [19, 31, 55, 39], [19, 39, 11, 41], [19, 41, 57, 33], [19, 33,  9,  1],
  [20,  0,  6, 34], [20, 34, 58, 42], [20, 42, 12, 44], [20, 44, 60, 36], [20, 36,  8,  0],
  [21,  1,  9, 37], [21, 37, 61, 45], [21, 45, 13, 43], [21, 43, 59, 35], [21, 35,  7,  1],
  [22,  2, 11, 39], [22, 39, 55, 47], [22, 47, 14, 46], [22, 46, 54, 38], [22, 38, 10,  2],
  [23,  2, 10, 40], [23, 40, 56, 48], [23, 48, 15, 49], [23, 49, 57, 41], [23, 41, 11,  2],
  [24,  3, 12, 42], [24, 42, 58, 50], [24, 50, 16, 51], [24, 51, 59, 43], [24, 43, 13,  3],
  [25,  3, 13, 45], [25, 45, 61, 53], [25, 53, 17, 52], [25, 52, 60, 44], [25, 44, 12,  3],
  [26,  4, 16, 50], [26, 50, 58, 34], [26, 34,  6, 30], [26, 30, 54, 46], [26, 46, 14,  4],
  [27,  4, 14, 47], [27, 47, 55, 31], [27, 31,  7, 35], [27, 35, 59, 51], [27, 51, 16,  4],
  [28,  5, 15, 48], [28, 48, 56, 32], [28, 32,  8, 36], [28, 36, 60, 52], [28, 52, 17,  5],
  [29,  5, 17, 53], [29, 53, 61, 37], [29, 37,  9, 33], [29, 33, 57, 49], [29, 49, 15,  5]
];

$fn=20;
minkowski() {

  scale(scaling_factor) {
    polyhedron(points=vertices, faces=faces, convexity=20);
  }
  
  sphere(2);
}
