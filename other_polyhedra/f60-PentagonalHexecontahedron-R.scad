//pentagonal Hexecontahedron
// 5 sided faces = 60
// degree 5 vertices = 12
// degree 3 vertices = 80
// halves = 12 (dodecahedron)

txt_depth = .15;
txt_size = .5;
txt_font = "Arial:style=Bold";
// Warning: a scale factor is applied later (see below)
diam = 32; // scale factor which sets the diameter (distance from one [deg 4]-vertex to the vertex opposite) 
minko = 0.2; //chamfer the edges [0 = disabled]
roll = -0.2; // another effet to round the dice (intersects with a smaller sphere) [0 = disabled]
minkfn = 80; //sets the $fn variable for chamfer and the sphere

C11 = 1.22237170490362309266282747264;


ordi = sqrt(3)*C11+minko; //original diameter
scafa = diam*.5/ordi; //scale factor

//labels = ["1","2","3","4","5","6.","7","8","9.","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60"]; //default labeling

//the upcoming labellings all have balanced halves and vertices of degree 5 with minimal imbalance (.5 points); for the vertices of degree 3, I list the average deviation, the square root of the average of the squared deviations and the maximal deviation.

//10.5 | 12.53... | 25.5
labels = ["12","26","44","32","39","38","1","56","48","9.","33","24","7","54","34","51","10","29","59","4","15","46","28","58","6.","60","3","52","36","2","43","49","16","37","8","35","53","17","30","18","55","25","40","13","19","23","31","57","20","21","11","41","50","5","45","47","22","42","27","14"];

// 9.9875 | 12.83... | 31.5
//labels = ["42","40","54","12","5","17","56","46","2","31","30","15","52","10","45","53","41","11","29","19","25","21","32","48","27","24","6.","26","60","36","8","33","50","14","47","44","23","13","38","35","20","18","58","49","7","57","9.","28","43","16","34","55","3","39","22","59","37","4","51","1"];

//10.05 | 12.38... | 33.5
//labels = ["42","29","47","34","1","2","48","27","44","32","56","13","60","6.","18","38","16","23","17","59","37","33","39","40","3","52","4","35","46","15","26","20","22","30","54","10","57","8","49","28","12","58","31","43","9.","53","11","24","19","45","7","55","14","51","25","50","21","41","5","36"];



// coordinate source:  http://dmccooey.com/polyhedra/RpentagonalHexecontahedron.txt

C0  = 0.192893711352359022108262546061;
C1  = 0.218483370127321224365534157111;
C2  = 0.374821658114562295266609516608;
C3  = 0.567715369466921317374872062669;
C4  = 0.728335176957191477360671629838;
C5  = 0.755467260516595579705585253517;
C6  = 0.824957552676275846265811111988;
C7  = 0.921228888309550499468934175898;
C8  = 0.959987701391583803994339068107;
C9  = 1.13706613386050418840961998424;
C10 = 1.16712343647533397917215468549;
C12 = 1.27209628257581214613814794036;
C13 = 1.52770307085850512136921113078;
C14 = 1.64691794069037444140475745697;
C15 = 1.74618644098582634573474528789;
C16 = 1.86540131081769566577029161408;
C17 = 1.88844538928366915418351670356;
C18 = 1.97783896542021867236841272616;
C19 = 2.097053835252087992403959052348;

vertices = [
[  C0,   C1,  C19],
[  C0,  -C1, -C19],
[ -C0,  -C1,  C19],
[ -C0,   C1, -C19],
[ C19,   C0,   C1],
[ C19,  -C0,  -C1],
[-C19,  -C0,   C1],
[-C19,   C0,  -C1],
[  C1,  C19,   C0],
[  C1, -C19,  -C0],
[ -C1, -C19,   C0],
[ -C1,  C19,  -C0],
[ 0.0,   C5,  C18],
[ 0.0,   C5, -C18],
[ 0.0,  -C5,  C18],
[ 0.0,  -C5, -C18],
[ C18,  0.0,   C5],
[ C18,  0.0,  -C5],
[-C18,  0.0,   C5],
[-C18,  0.0,  -C5],
[  C5,  C18,  0.0],
[  C5, -C18,  0.0],
[ -C5,  C18,  0.0],
[ -C5, -C18,  0.0],
[ C10,  0.0,  C17],
[ C10,  0.0, -C17],
[-C10,  0.0,  C17],
[-C10,  0.0, -C17],
[ C17,  C10,  0.0],
[ C17, -C10,  0.0],
[-C17,  C10,  0.0],
[-C17, -C10,  0.0],
[ 0.0,  C17,  C10],
[ 0.0,  C17, -C10],
[ 0.0, -C17,  C10],
[ 0.0, -C17, -C10],
[  C3,  -C6,  C16],
[  C3,   C6, -C16],
[ -C3,   C6,  C16],
[ -C3,  -C6, -C16],
[ C16,  -C3,   C6],
[ C16,   C3,  -C6],
[-C16,   C3,   C6],
[-C16,  -C3,  -C6],
[  C6, -C16,   C3],
[  C6,  C16,  -C3],
[ -C6,  C16,   C3],
[ -C6, -C16,  -C3],
[  C2,   C9,  C15],
[  C2,  -C9, -C15],
[ -C2,  -C9,  C15],
[ -C2,   C9, -C15],
[ C15,   C2,   C9],
[ C15,  -C2,  -C9],
[-C15,  -C2,   C9],
[-C15,   C2,  -C9],
[  C9,  C15,   C2],
[  C9, -C15,  -C2],
[ -C9, -C15,   C2],
[ -C9,  C15,  -C2],
[  C7,   C8,  C14],
[  C7,  -C8, -C14],
[ -C7,  -C8,  C14],
[ -C7,   C8, -C14],
[ C14,   C7,   C8],
[ C14,  -C7,  -C8],
[-C14,  -C7,   C8],
[-C14,   C7,  -C8],
[  C8,  C14,   C7],
[  C8, -C14,  -C7],
[ -C8, -C14,   C7],
[ -C8,  C14,  -C7],
[  C4, -C12,  C13],
[  C4,  C12, -C13],
[ -C4,  C12,  C13],
[ -C4, -C12, -C13],
[ C13,  -C4,  C12],
[ C13,   C4, -C12],
[-C13,   C4,  C12],
[-C13,  -C4, -C12],
[ C12, -C13,   C4],
[ C12,  C13,  -C4],
[-C12,  C13,   C4],
[-C12, -C13,  -C4],
[ C11,  C11,  C11],
[ C11,  C11, -C11],
[ C11, -C11,  C11],
[ C11, -C11, -C11],
[-C11,  C11,  C11],
[-C11,  C11, -C11],
[-C11, -C11,  C11],
[-C11, -C11, -C11]];
faces = [
[ 36 , 14,  2,  0, 24],
[ 76 , 86, 72, 36, 24],
[ 52 , 16, 40, 76, 24],
[ 60 , 84, 64, 52, 24],
[  0 , 12, 48, 60, 24],
[ 37 , 13,  3,  1, 25],
[ 77 , 85, 73, 37, 25],
[ 53 , 17, 41, 77, 25],
[ 61 , 87, 65, 53, 25],
[  1 , 15, 49, 61, 25],
[ 38 , 12,  0,  2, 26],
[ 78 , 88, 74, 38, 26],
[ 54 , 18, 42, 78, 26],
[ 62 , 90, 66, 54, 26],
[  2 , 14, 50, 62, 26],
[ 39 , 15,  1,  3, 27],
[ 79 , 91, 75, 39, 27],
[ 55 , 19, 43, 79, 27],
[ 63 , 89, 67, 55, 27],
[  3 , 13, 51, 63, 27],
[ 41 , 17,  5,  4, 28],
[ 81 , 85, 77, 41, 28],
[ 56 , 20, 45, 81, 28],
[ 64 , 84, 68, 56, 28],
[  4 , 16, 52, 64, 28],
[ 40 , 16,  4,  5, 29],
[ 80 , 86, 76, 40, 29],
[ 57 , 21, 44, 80, 29],
[ 65 , 87, 69, 57, 29],
[  5 , 17, 53, 65, 29],
[ 42 , 18,  6,  7, 30],
[ 82 , 88, 78, 42, 30],
[ 59 , 22, 46, 82, 30],
[ 67 , 89, 71, 59, 30],
[  7 , 19, 55, 67, 30],
[ 43 , 19,  7,  6, 31],
[ 83 , 91, 79, 43, 31],
[ 58 , 23, 47, 83, 31],
[ 66 , 90, 70, 58, 31],
[  6 , 18, 54, 66, 31],
[ 46 , 22, 11,  8, 32],
[ 74 , 88, 82, 46, 32],
[ 48 , 12, 38, 74, 32],
[ 68 , 84, 60, 48, 32],
[  8 , 20, 56, 68, 32],
[ 45 , 20,  8, 11, 33],
[ 73 , 85, 81, 45, 33],
[ 51 , 13, 37, 73, 33],
[ 71 , 89, 63, 51, 33],
[ 11 , 22, 59, 71, 33],
[ 44 , 21,  9, 10, 34],
[ 72 , 86, 80, 44, 34],
[ 50 , 14, 36, 72, 34],
[ 70 , 90, 62, 50, 34],
[ 10 , 23, 58, 70, 34],
[ 47 , 23, 10,  9, 35],
[ 75 , 91, 83, 47, 35],
[ 49 , 15, 39, 75, 35],
[ 69 , 87, 61, 49, 35],
[  9 , 21, 57, 69, 35]];


function add3(v, i = 0, r) = 
    i < len(v) ? 
        i == 0 ?
            add3(v, 1, v[0]) :
            add3(v, i + 1, r + v[i]) :
        r;

function facecoord(n) = [for(i = [0 : len(faces[n]) - 1]) vertices[faces[n][i]] ]; // returns list of the coordinates of the vertices on this face

module facetext(vert,txt) {
    bar = add3(vert)/len(vert); // barycentre
    length = norm(bar);     // radial distance
    b = acos(bar.z/length); // inclination angle
    c = atan2(bar.y,bar.x); // azimuthal angle
    rotate([180,b,c]) translate([0,0,ordi])linear_extrude(txt_depth,center=true) text(text=txt,size = txt_size, font=txt_font, halign = "center", valign = "center");
}

scale(scafa)
difference() {
    intersection() {
        minkowski($fn=minkfn){
            polyhedron(points = vertices, faces=faces,  convexity = 20);
            sphere(minko);
        };
        sphere(ordi-roll,$fn=minkfn);
    }
    for(i=[0:len(faces)-1]) facetext(facecoord(i),labels[i]);
}
