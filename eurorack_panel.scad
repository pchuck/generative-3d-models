// eurorack panel
// adapted from https://www.thingiverse.com/thing:2055716
//
// github.com/pchuck/generative-3d-models
//

// customizable parameters
hp = 8; // width in hp of the panel
thick = 1.5; // panel thickness. doepfer standard is 2mm. use ~1-3mm.
holes = 2; // desired number of holes along top and bottom of panel
hole_width = 3.2; // s/b >= hole_d. for easier mounting use 5.08mm

// constants
hp_mm = 5.08; // mm per hp
hole_d = 3.2; // mount hole diameter in mm.
hole_r = hole_d / 2; // mount hole radius
offset = hp_mm / 2; // offset from edge of panel to center of hole
height = 133.35; // overall panel height. (3u std is 133.35mm or 5.25").
width_o = hp * hp_mm; // overall panel width. (# hp specified x mm per hp).
height_o = 129; // panel outer ht. (doepfer std is 128.5). 129 seems nicer.
height_i = 111; // panel inner ht w/ rail clearance of 11.2mm. ~11.675 is std.
height_r = (height - height_o) / 2; // rail height
height_s = (height_o - height_i - height_r * 2) / 2; // surface height
hw_diff = hole_width - hole_d;
offset_y = height_s / 2;

module panel(hp, holes=2, hw=hole_width) {
    hole_skip = hp / (holes - 1); // number of hp to skip per hole
    difference() {
        cube([width_o, height_o, thick]);
        mount_holes(hp, holes, hole_skip, hole_width); 
    }
}

module mount_hole(hw=hole_width) {
    hole_depth = thick + 2; // drill 'bit' for subtractive CSG
    translate([0, 0, -1]) {
        union() {
            cylinder(r=hole_r, h=hole_depth, $fn=20);
            translate([0, -hole_r, 0]) cube([hw_diff, hole_d, hole_depth]);
            translate([hw_diff, 0, 0]) cylinder(r=hole_r, h=hole_depth, $fn=20);
        }
    }
}

module mount_holes(hp, holes, hole_skip, hw) {
    top = offset_y;
    bottom = height_o - offset_y;
    // if hp > 3, use second-to-last mount holes on either edge
    left = hp > 3 ? (hp - 1) * hp_mm - offset : width_o - offset;
    right = hp > 3 ? offset + hp_mm : offset;

    translate([right, top]) mount_hole();
    translate([left, bottom]) mount_hole();
    if(holes > 1) {
        translate([left, top]) mount_hole();
        translate([right, bottom]) mount_hole();
        for(i=[hole_skip + 1: hole_skip: hp]) {
            translate([floor(i) * hp_mm - offset, top]) mount_hole(); // R
            translate([floor(i) * hp_mm - offset, bottom]) mount_hole(); // L
        }
    }
}


// tests / favorites
//panel(1, 1, hole_width);
//panel(2, 1, hole_width);
//panel(4, 1, hole_width);
//panel(6, 2, hole_width);
//panel(8, 2, hole_width);
//panel(10, 2, hole_width);
//panel(12, 2, hole_width);
//panel(16, 4, hole_width);
//panel(20, 4, hole_width);
//panel(24, 4, hole_width);
//panel(32, 4, hole_width);

// default
difference() {
    panel(hp, holes, hole_width);

// optional internal translucent engraving
// add text or patterns here to 'etch' the surface of the panel
/*
    shell = 0.2; // translucent shell thickness
    translate([width_o / 2, height_o - offset_y - 10, shell])
      linear_extrude(thick)
        text("ultrametrics", direction="ttb", size=7);
*/
}
