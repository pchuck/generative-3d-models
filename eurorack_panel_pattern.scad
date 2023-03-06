// eurorack panel
// adapted from https://www.thingiverse.com/thing:2055716
//
// github.com/pchuck/generative-3d-models
//

// customizable parameters
hp = 4; // width in hp of the panel
thick = 2; // panel thickness
holes = 1; // desired number of holes along top and bottom of panel
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

pattern_depth = 0.1;
y_border = 8;
x_border = 2;
fudge = 0.01; // fudge factor ensures pattern fully intersects panel
module pattern(width, height, depth, spacing, pattern_depth) {
  for(y=[y_border:spacing:height - y_border]) {
      translate([x_border, y, thick - depth - pattern_depth])
          cube([width - x_border * 2, 1, pattern_depth + fudge]);
  }
  for(x=[x_border:spacing:width - x_border]) {
      translate([x, y_border, thick - depth - pattern_depth])
          cube([1, height - y_border * 2, pattern_depth + fudge]);
  }
}

module panel(hp, holes=2, hw=hole_width) {
    hole_skip = hp / (holes - 1); // number of hp to skip per hole
    difference() {
        cube([hp_mm * hp, height_o, thick]);
        mount_holes(hp, holes, hole_skip, hole_width); 
    }
}

module mount_hole(hw=hole_width) {
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

module mount_holes(hp, holes, hole_skip, hw) {
    top = offset_y;
    bottom = height_o - offset_y;
    left = hp * hp_mm - offset;
    right = offset;

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

difference() {
    panel(hp, holes, hole_width);
    pattern(hp_mm * hp, height_o, 0, 16, 0.7);
    pattern(hp_mm * hp, height_o, 0,  8, 0.5);
    pattern(hp_mm * hp, height_o, 0,  4, 0.3);
    pattern(hp_mm * hp, height_o, 0,  2, 0.1);
//    pattern(hp_mm * hp, height_o,   0,  1, 1);
}

// text("OpenSCAD");

