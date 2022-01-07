// eurorack panel
// adapted from https://www.thingiverse.com/thing:2055716
//
// github.com/pchuck/generative-3d-models
//

// customizable parameters
hp = 2; // width in hp of the panel
thick = 2; // panel thickness
hole_count = 4; // minimum number of mounting holes
hole_width = 3.2; // 5.08mm; larger than hole_d, for easier mounting.

// constants
hp_mm = 5.08; // mm per hp
hole_d = 3.2; // mount hole diameter
hole_r = hole_d / 2; // mount hole radius
offset = hp_mm / 2; // offset from edge of panel to center of hole
height = 133.35; // overall panel height. 133.35mm = 3u.
height_o = 128.5; // panel outer height
height_i = 110; // panel inner height. rail clearance = ~11.675mm.
height_r = (height - height_o) / 2; // rail height
height_s = (height_o - height_i - height_r * 2) / 2; // surface height
hw_diff = hole_width - hole_d;
offset_y = height_s / 2;

module panel(hp, mount_holes=2, hw=hole_width, ignore_holes=false) {
    difference() {
        cube([hp_mm * hp, height_o, thick]);
        if(!ignore_holes) mount_holes(hp, mount_holes, hole_width);
    }
}

module mount_holes(hp, holes, hw) {
    holes = holes - holes % 2; // force even number of holes
    holes(offset_y,            hp, hw, holes / 2); // bottom holes
    holes(height_o - offset_y, hp, hw, holes / 2); // top holes
}

module make_hole(y, low, high, number, count) {
    if(count < number) {
        half = floor((high - low) / 2 + low);
        translate([half * hp_mm - offset, y, 0]) mount_hole(hole_width);
        make_hole(y,  low, half, number, count + 1);
        make_hole(y, half, high, number, count + 1);
    }
}

module holes(y, hp, hw, holes) {
    translate([hp * hp_mm - offset, y, 0])  mount_hole(hole_width); // left
    if(holes > 1) translate([offset, y, 0]) mount_hole(hole_width); // right
    make_hole(y, 1, hp, holes - 2, 0);
}

module mount_hole(hw) {
    // diffs m/b larger than object being diffed from for ideal BSP operations
    hole_depth = thick + 2; 
    if(hw_diff < 0) { hw_diff = 0; }
    translate([0, 0, -1]) {
        union() {
            cylinder(r=hole_r, h=hole_depth, $fn=20);
            translate([0, -hole_r, 0]) cube([hw_diff, hole_d, hole_depth]);
            translate([hw_diff, 0, 0]) cylinder(r=hole_r, h=hole_depth, $fn=20);
        }
    }
}

// tests
//panel(4, 2, hole_width);
//panel(60, 8,hole_width);

panel(hp, hole_count, hole_width);
