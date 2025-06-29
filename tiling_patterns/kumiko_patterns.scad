// hexagon-based kumiko-style patterns
//
include <BOSL2/std.scad>

w = 1; // default stroke width
size = 60; // size of the hexagon
xoffset = 3 * size / 2; // offset for the x translation
yoffset = size / 2 * sqrt(3); // offset for the y translation
xtiles = 2; // number of tiles in the x direction
ytiles = 4; // number of tiles in the y direction

module hex() {
    stroke(closed=true, hexagon(or=size/2), width=w, color="blue");
}

module hex_radial00() {
    // hexagon
    stroke(closed=true, hexagon(or=size/2), width=w, color="blue");
    // lines radiating from the center of the hexagon to each vertex
    color("blue") {
        for (angle = [0:60:300]) {
            rotate(angle) {
                translate([0, -w/2, -w/2]) {
                    cube([size/2, w, w]);
                }
            }
        }
    }
}

module hex_radial01() {
    stroke(closed=true, hexagon(or=size/2), width=w, color="blue");
    // lines radiating from the center of the hexagon to each vertex
    color("blue") {
        for (angle = [0:30:360]) {
            rotate(angle) {
                translate([0, -w/2, -w/2]) {
                    cube([size/2, w, w]);
                }
            }
        }
    }
}

module hex_radial02() {
    stroke(closed=true, hexagon(or=size/2), width=w, color="black");
    // lines radiating from the center of the hexagon to each vertex
    color("blue") {
        for (angle = [0:30:360]) {
            rotate(angle) {
                translate([0, -w/2, -w/2]) {
                    cube([size/2, w, w]);
                }
            }
        }
    }
    // embedded triangles
    rotate(00) stroke(closed=true, circle(d=size, $fn=3), width=w, color="red");
    rotate(60) stroke(closed=true, circle(d=size, $fn=3), width=w, color="red");
}

module hex00() {
    // hexagon
    stroke(closed=true, hexagon(or=size/2), width=w, color="blue");
    // lines radiating from the center of the hexagon to each vertex
    color("blue") {
        for (angle = [0:60:300]) {
            rotate(angle) {
                cube([size/2, w, w]);
            }
        }
    }
    // semicircle at each vertex
    for (angle = [0:60:300]) {
        rotate(angle) {
            translate([size/2, 0, 0]) {
                stroke(closed=true, circle(d=size/3, $fn=6), width=w, color="darkblue");
            }
        }
    }
}

module hex01() {
    // hexagon
    stroke(closed=true, hexagon(or=size/2), width=w, color="blue");
    // lines radiating from the center of the hexagon to each vertex
    color("blue") {
        for (angle = [0:60:300]) {
            rotate(angle) {
                cube([size/2, w, w]);
            }
        }
    }
    // semicircle at each vertex
    for (angle = [0:60:300]) {
        rotate(angle) {
            translate([size/2, 0, 0]) {
                stroke(closed=true, circle(d=size/2, $fn=6), width=w, color="darkblue");
            }
        }
    }
}

module hex02() {
    // hexagon
    stroke(closed=true, hexagon(or=size/2), width=w, color="blue");
    // lines radiating from the center of the hexagon to each vertex
    color("blue") {
        for (angle = [0:60:300]) {
            rotate(angle) {
                cube([size/2, w, w]);
            }
        }
    }
    // semicircle at each vertex
    for (angle = [0:60:300]) {
        rotate(angle) {
            translate([size/2, 0, 0]) {
                stroke(closed=true, circle(d=size/2, $fn=6), width=w, color="darkblue");
            }
        }
    }
    // triangle at center
    rotate(00) stroke(closed=true, circle(d=size/2, $fn=3), width=w, color="red");
}

module hex03() {
    // hexagon
    stroke(closed=true, hexagon(or=size/2), width=w, color="blue");
    // lines radiating from the center of the hexagon to each vertex
    color("blue") {
        for (angle = [0:60:300]) {
            rotate(angle) {
                cube([size/2, w, w]);
            }
        }
    }
    // semicircle at each vertex
    for (angle = [0:60:300]) {
        rotate(angle) {
            translate([size/2, 0, 0]) {
                stroke(closed=true, circle(d=size/2, $fn=6), width=w, color="darkblue");
            }
        }
    }
    // triangle at center
    rotate(00) stroke(closed=true, circle(d=size/2, $fn=3), width=w, color="red");
    rotate(60) stroke(closed=true, circle(d=size/2, $fn=3), width=w, color="red");
    
}

module hex1() {
    stroke(closed=true, hexagon(or=size/2), width=w, color="blue");
    // embedded triangles
    rotate(00) stroke(closed=true, circle(d=size, $fn=3), width=w, color="red");
    rotate(60) stroke(closed=true, circle(d=size, $fn=3), width=w, color="red");
}

module hex2() {
    stroke(closed=true, hexagon(or=size/2), width=w, color="blue");
       // embedded triangles
    rotate(00) stroke(closed=true, circle(d=size, $fn=3), width=w, color="red");
    rotate(60) stroke(closed=true, circle(d=size, $fn=3), width=w, color="red");
    // lines radiating from the center of the hexagon to each vertex
    color("blue") {
        for (angle = [0:60:300]) {
            rotate(angle) {
                translate([0, -w/2, -w/2]) {
                    cube([size/2, w, w]);
                }
            }
        }
    }
    // embedded triangles
    rotate(00) stroke(closed=true, circle(d=size, $fn=3), width=w, color="red");
    rotate(60) stroke(closed=true, circle(d=size, $fn=3), width=w, color="red");
}

module hex3() {
    stroke(closed=true, hexagon(or=size/2), width=w, color="blue");
       // embedded triangles
    rotate(00) stroke(closed=true, circle(d=size, $fn=3), width=w, color="red");
    rotate(60) stroke(closed=true, circle(d=size, $fn=3), width=w, color="red");
    // lines radiating from the center of the hexagon to each vertex
    color("blue") {
        for (angle = [0:60:300]) {
            rotate(angle) {
                translate([0, -w/2, -w/2]) {
                    cube([size/2, w, w]);
                }
            }
        }
    }
    // embedded triangles
    rotate(00) stroke(closed=true, circle(d=size, $fn=3), width=w, color="red");
    rotate(60) stroke(closed=true, circle(d=size, $fn=3), width=w, color="red");

    /*
    // embedded triangles
    rotate(00) stroke(closed=true, circle(d=size, $fn=3), width=w, color="red");
    rotate(60) stroke(closed=true, circle(d=size, $fn=3), width=w, color="red");
    rotate(90) stroke(closed=true, circle(d=size/1.8, $fn=6), width=w, color="green");
    */
}

module hex4() {
    stroke(closed=true, hexagon(or=size/2), width=w, color="blue");
       // embedded triangles
    rotate(00) stroke(closed=true, circle(d=size, $fn=3), width=w, color="red");
    rotate(60) stroke(closed=true, circle(d=size, $fn=3), width=w, color="red");
    // lines radiating from the center of the hexagon to each vertex
    color("blue") {
        for (angle = [0:60:300]) {
            rotate(angle) {
                translate([0, -w/2, -w/2]) {
                    cube([size/2, w, w]);
                }
            }
        }
    }
    
    // embedded triangles
    rotate(00) stroke(closed=true, circle(d=size, $fn=3), width=w, color="red");
    rotate(60) stroke(closed=true, circle(d=size, $fn=3), width=w, color="red");
    rotate(90) stroke(closed=true, circle(d=size/1.8, $fn=6), width=w, color="green");
}

module hex5() {
    stroke(closed=true, hexagon(or=size/2), width=w, color="blue");
       // embedded triangles
    rotate(00) stroke(closed=true, circle(d=size, $fn=3), width=w, color="red");
    rotate(60) stroke(closed=true, circle(d=size, $fn=3), width=w, color="red");
    // lines radiating from the center of the hexagon to each vertex
    color("blue") {
        for (angle = [0:60:300]) {
            rotate(angle) {
                translate([0, -w/2, -w/2]) {
                    cube([size/2, w, w]);
                }
            }
        }
    }
    
    // embedded triangles
    rotate(00) stroke(closed=true, circle(d=size, $fn=3), width=w, color="red");
    rotate(60) stroke(closed=true, circle(d=size, $fn=3), width=w, color="red");
    rotate(30) stroke(closed=true, circle(d=size/1.8, $fn=3), width=w, color="green");
    rotate(90) stroke(closed=true, circle(d=size/1.8, $fn=3), width=w, color="green");
}

module tiler(x_displacement){   
    for (x = [0+x_displacement:xtiles-1+x_displacement]) {
        for (y = [0:ytiles-1]) {
            translate([x * xoffset + xoffset / 2, y * yoffset + yoffset / 2, 0]) {
                children();
            }
            translate([x * xoffset, y * yoffset, 0]) {
                children();
            }
        }
    }
}


/*translate([-100, 0, 0]) { 
    hex_radial02();
}
*/

// radial+triangular patterns
translate([0, 0, 0]) {
    tiler(xtiles * 0) hex();
    tiler(xtiles * 1) hex_radial00();
    tiler(xtiles * 2) hex_radial01();
    tiler(xtiles * 3) hex_radial02();
}

// triangular patterns
translate([0, 300, 0]) {
    tiler(xtiles * 0) hex();
    tiler(xtiles * 1) hex1();
    tiler(xtiles * 2) hex2();
    tiler(xtiles * 3) hex3();
    tiler(xtiles * 4) hex4();
    tiler(xtiles * 5) hex5(); 
}

// corner symmetry patterns
translate([0, 600, 0]) {
    tiler(xtiles * 0) hex();
    tiler(xtiles * 1) hex00();
    tiler(xtiles * 2) hex01();
    tiler(xtiles * 3) hex02();
    tiler(xtiles * 4) hex03();
}

