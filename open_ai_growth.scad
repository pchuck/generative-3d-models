$fn = 20;

rotation = 0; // rotation of the base   
levels = 7; // recursion depth

// recursive module to create a sierpinski triangle
module sierpinski(levels, size) {
    if (levels == 0) {
        polygon(points = [[0,0],[size,0],[size/2,size*sqrt(3)/2]]);
    } else {
        sierpinski(levels-1, size/2);
        translate([size/2,0,0]) rotate([0,0,rotation]) sierpinski(levels-1, size/2);
        translate([size/4,size*sqrt(3)/4,0]) rotate([0,0,rotation]) sierpinski(levels-1, size/2);
    }
}

// render a tetrakaidecahedron
module tetrakaidecahedron() {
    for (i = [0:5]) {
        rotate([0,0,i*360/6]) sierpinski(levels, 100);
    }
}


sierpinski(levels, 100);

//tetrakaidecahedron();


