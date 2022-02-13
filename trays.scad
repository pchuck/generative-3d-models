// stackable/nestable trays
//
// github.com/pchuck/generative-3d-models
//
size = 100; // size of the tray in mm
wall = 1; // wall thickness in mm
height = 0.25; // height as a fraction of size
cutd = 1; // cutout depth
cutf = (size - 2) / size; // cutout factor
convexity = 10;
center = true;
sides = 4;
fudge = 1.01;
c = 1.415;
fn=10;

// rectangular frame
module frame(s, h, w) {
    translate([-s / 2, -s / 2, 0]) {
        difference() {
            cube([s, s, s * h]);
            translate([w, w, - fudge / 2])
                cube([s - w * 2, s - w * 2, s * h + fudge]);
        }
    }
}

// base (additive) or top cutout (subtractive)
module cutout() {
    rotate([180, 0, 0])
    rotate([0, 0, 45])
    linear_extrude(height=cutd, 
                   center=center, 
                   convexity=convexity, 
                   twist=0, 
                   scale=[cutf, cutf], 
                   $fn=fn)
        circle(d=size * c, $fn=sides);
}

// render

// tray with no cutouts or base
// tray(size, height, wall);

// tray with base and top cutout for stacking...
difference() {
    frame(size, height, wall);
    // top cutout
    translate([0, 0, size * height - cutd - cutd / 2 + fudge])
        cutout();
}
// bottom base
translate([0, 0, -cutd / 2])
    cutout();
