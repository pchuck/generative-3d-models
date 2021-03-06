// Small Hexagonal Hexecontahedron
//   coords via: http://dmccooey.com/polyhedra/SmallHexagonalHexecontahedron.txt
//
scaling_factor = 50;

C0  = (1 - sqrt(5) + sqrt(2 * (3 * sqrt(5) - 1))) / 8;
C1  = (sqrt(5) - 1) / 4;
C2  = (sqrt(3 + 2 * sqrt(5)) - 1) / 4;
C3  = (sqrt(5) - 1 + sqrt(2 * (3 * sqrt(5) - 1))) / 8;
C4  = (1 + sqrt(5) + 2 * sqrt(3 + 2 * sqrt(5))) / 12;
C5  = (1 + sqrt(5)) / 4;
C6  = (1 + sqrt(3 + 2 * sqrt(5))) / 4;
C7  = (sqrt(5) - 3 + sqrt(2 * (19 + 9 * sqrt(5)))) / 8;
C8  = (3 + sqrt(5) + sqrt(2 * (19 + 9 * sqrt(5)))) / 12;
C9  = (3 - sqrt(5) + sqrt(2 * (19 + 9 * sqrt(5)))) / 8;
C10 = (3 + sqrt(5)) / 4;
C11 = sqrt(3 + 2 * sqrt(5)) / 2;

vertices = [
 [  C1,  0.0,  C11], [  C1,  0.0, -C11], [ -C1,  0.0,  C11], [ -C1,  0.0, -C11],
 [ C11,   C1,  0.0], [ C11,  -C1,  0.0], [-C11,   C1,  0.0], [-C11,  -C1,  0.0],
 [ 0.0,  C11,   C1], [ 0.0,  C11,  -C1], [ 0.0, -C11,   C1], [ 0.0, -C11,  -C1],
 [ 0.0,  0.5,  C10], [ 0.0,  0.5,  C10], [ 0.0,  0.5, -C10], [ 0.0,  0.5, -C10],
 [ 0.0, -0.5,  C10], [ 0.0, -0.5,  C10], [ 0.0, -0.5, -C10], [ 0.0, -0.5, -C10],
 [ C10,  0.0,  0.5], [ C10,  0.0,  0.5], [ C10,  0.0, -0.5], [ C10,  0.0, -0.5],
 [-C10,  0.0,  0.5], [-C10,  0.0,  0.5], [-C10,  0.0, -0.5], [-C10,  0.0, -0.5],
 [ 0.5,  C10,  0.0], [ 0.5,  C10,  0.0], [ 0.5, -C10,  0.0], [ 0.5, -C10,  0.0],
 [-0.5,  C10,  0.0], [-0.5,  C10,  0.0], [-0.5, -C10,  0.0], [-0.5, -C10,  0.0],
 [  C3,   C2,   C9], [  C3,   C2,  -C9], [  C3,  -C2,   C9], [  C3,  -C2,  -C9],
 [ -C3,   C2,   C9], [ -C3,   C2,  -C9], [ -C3,  -C2,   C9], [ -C3,  -C2,  -C9],
 [  C9,   C3,   C2], [  C9,   C3,  -C2], [  C9,  -C3,   C2], [  C9,  -C3,  -C2],
 [ -C9,   C3,   C2], [ -C9,   C3,  -C2], [ -C9,  -C3,   C2], [ -C9,  -C3,  -C2],
 [  C2,   C9,   C3], [  C2,   C9,  -C3], [  C2,  -C9,   C3], [  C2,  -C9,  -C3],
 [ -C2,   C9,   C3], [ -C2,   C9,  -C3], [ -C2,  -C9,   C3], [ -C2,  -C9,  -C3],
 [  C4,  0.0,   C8], [  C4,  0.0,  -C8], [ -C4,  0.0,   C8], [ -C4,  0.0,  -C8],
 [  C8,   C4,  0.0], [  C8,  -C4,  0.0], [ -C8,   C4,  0.0], [ -C8,  -C4,  0.0],
 [ 0.0,   C8,   C4], [ 0.0,   C8,  -C4], [ 0.0,  -C8,   C4], [ 0.0,  -C8,  -C4],
 [  C0,   C6,   C7], [  C0,   C6,  -C7], [  C0,  -C6,   C7], [  C0,  -C6,  -C7],
 [ -C0,   C6,   C7], [ -C0,   C6,  -C7], [ -C0,  -C6,   C7], [ -C0,  -C6,  -C7],
 [  C7,   C0,   C6], [  C7,   C0,  -C6], [  C7,  -C0,   C6], [  C7,  -C0,  -C6],
 [ -C7,   C0,   C6], [ -C7,   C0,  -C6], [ -C7,  -C0,   C6], [ -C7,  -C0,  -C6],
 [  C6,   C7,   C0], [  C6,   C7,  -C0], [  C6,  -C7,   C0], [  C6,  -C7,  -C0],
 [ -C6,   C7,   C0], [ -C6,   C7,  -C0], [ -C6,  -C7,   C0], [ -C6,  -C7,  -C0],
 [  C5,   C5,   C5], [  C5,   C5,   C5], [  C5,   C5,  -C5], [  C5,   C5,  -C5],
 [  C5,  -C5,   C5], [  C5,  -C5,   C5], [  C5,  -C5,  -C5], [  C5,  -C5,  -C5],
 [ -C5,   C5,   C5], [ -C5,   C5,   C5], [ -C5,   C5,  -C5], [ -C5,   C5,  -C5],
 [ -C5,  -C5,   C5], [ -C5,  -C5,   C5], [ -C5,  -C5,  -C5], [ -C5,  -C5,  -C5]
];

faces = [
  [ 60,   0,  17,  74, 100,  82], [ 60,  82,  20,  44,  97,  36],
  [ 60,  36,  12,   2,  16,  38], [ 60,  38, 101,  46,  21,  80],
  [ 60,  80,  96,  72,  13,   0],
  [ 61,   1,  15,  73,  98,  81], [ 61,  81,  22,  47, 103,  39],
  [ 61,  39,  18,   3,  14,  37], [ 61,  37,  99,  45,  23,  83],
  [ 61,  83, 102,  75,  19,   1],
  [ 62,   2,  12,  76, 104,  84], [ 62,  84,  25,  50, 109,  42],
  [ 62,  42,  17,   0,  13,  40], [ 62,  40, 105,  48,  24,  86],
  [ 62,  86, 108,  78,  16,   2],
  [ 63,   3,  18,  79, 110,  87], [ 63,  87,  27,  49, 107,  41],
  [ 63,  41,  15,   1,  19,  43], [ 63,  43, 111,  51,  26,  85],
  [ 63,  85, 106,  77,  14,   3],
  [ 64,   4,  22,  81,  98,  89], [ 64,  89,  29,  52,  97,  44],
  [ 64,  44,  20,   5,  23,  45], [ 64,  45,  99,  53,  28,  88],
  [ 64,  88,  96,  80,  21,   4],
  [ 65,   5,  20,  82, 100,  90], [ 65,  90,  31,  55, 103,  47],
  [ 65,  47,  22,   4,  21,  46], [ 65,  46, 101,  54,  30,  91],
  [ 65,  91, 102,  83,  23,   5],
  [ 66,   6,  25,  84, 104,  92], [ 66,  92,  32,  57, 107,  49],
  [ 66,  49,  27,   7,  24,  48], [ 66,  48, 105,  56,  33,  93],
  [ 66,  93, 106,  85,  26,   6],
  [ 67,   7,  27,  87, 110,  95], [ 67,  95,  34,  58, 109,  50],
  [ 67,  50,  25,   6,  26,  51], [ 67,  51, 111,  59,  35,  94],
  [ 67,  94, 108,  86,  24,   7],
  [ 68,   8,  32,  92, 104,  76], [ 68,  76,  12,  36,  97,  52],
  [ 68,  52,  29,   9,  33,  56], [ 68,  56, 105,  40,  13,  72],
  [ 68,  72,  96,  88,  28,   8],
  [ 69,   9,  29,  89,  98,  73], [ 69,  73,  15,  41, 107,  57],
  [ 69,  57,  32,   8,  28,  53], [ 69,  53,  99,  37,  14,  77],
  [ 69,  77, 106,  93,  33,   9],
  [ 70,  10,  31,  90, 100,  74], [ 70,  74,  17,  42, 109,  58],
  [ 70,  58,  34,  11,  30,  54], [ 70,  54, 101,  38,  16,  78],
  [ 70,  78, 108,  94,  35,  10],
  [ 71,  11,  34,  95, 110,  79], [ 71,  79,  18,  39, 103,  55],
  [ 71,  55,  31,  10,  35,  59], [ 71,  59, 111,  43,  19,  75],
  [ 71,  75, 102,  91,  30,  11]
];

scale(scaling_factor) {
  polyhedron(points=vertices, faces=faces, convexity=20);
};
