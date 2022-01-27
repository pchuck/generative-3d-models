// 3-piece interference pattern vase or light shade
//   w/ base, insert and frame
//
// github.com/pchuck/generative-3d-models
//
radius = 30;
sides = 5;
height = 100;
center = true;
convexity = 10;
twist = 720;
scale = [2, 2];
fn=10;
unity = [1.0, 1.0];
margin = 0.01;
k = 0.88;
round = 5;
base_size = 1.2;
cable_diameter = 1.5;

steps = twist * fn / 360;
step_inc = height / steps;
twist_inc = twist / steps;
echo(steps);

module simple_extruded_vase(sides, twist, radius, offset, height, scale, r) {
    translate([0, 0, offset + height / 2])
        rotate(r)
        linear_extrude(height=height, 
                       center=center, 
                       convexity=convexity, 
                       twist=twist, 
                       scale=scale, 
                       $fn=fn)
            circle(r=radius, $fn=sides);
}

// opposing twisted extrusion, with constant radius
module frame() {
    difference() {
        union() {
            simple_extruded_vase(sides, twist, radius, 0, height, unity, [0, 0, 0]);
            simple_extruded_vase(sides, -twist, radius, 0, height, unity, [0, 0, 0]);
        }
    cylinder(r=radius * k * (1 - margin), h=height);
    }
}

// base - square
module base_square() {
    difference() {
        minkowski() {
            rotate([90, 0, 0]) cylinder(r=1, h=1);
            minkowski() {
                cylinder(r=round, h=1);
                translate([-radius * base_size, -radius * base_size, 0])
                    cube([radius * base_size * 2, radius * base_size * 2, 3]);
            }
        }
        cylinder(r=radius, h=height);
        translate([0, 0, 0])
            cube([radius * base_size * 2, cable_diameter, height]);
    }
}

// base - round
module base_round() {
    difference() {
        minkowski() {
            rotate([90, 0, 0]) cylinder(r=1, h=1);
            cylinder(r=radius*1.2, h=2);
        }
        translate([0, 0, 1]) cylinder(r=radius, h=height);
        translate([0, 0, 0]) cube([100, 1.5, 10]);
    }
}

// insert sleeve:
module sleeve() {
    cylinder(r=radius * 0.88 * 0.99, h=height);
}


// square or round base
//base_square();
//base_round();

// soft light insert filter
//sleeve();

// light frame
frame();
