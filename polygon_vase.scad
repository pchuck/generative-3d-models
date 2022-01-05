// polygon extrusion vases, with twists and interference patterns
//
// github.com/pchuck/generative-3d-models
//
radius = 50;
sides = 6;
height = 100;
center = true;
convexity = 10;
//twist = 120;
twist = 120;
scale = [2, 2];
fn=30;

steps = twist * fn / 360;
step_inc = height / steps;
twist_inc = twist / steps;
echo(steps);


module simple_extruded_vase(sides, twist, radius, offset, height, scale, r) {
    translate([0, 0, offset + height / 2])
        rotate(r)

        linear_extrude(height=height, 
                       center = center, 
                       convexity=convexity, 
                       twist=twist, 
                       scale=scale, 
                       $fn=fn)
            circle(r=radius, $fn=sides);
}

module complex_extruded_vase() {
union() {
    translate([0, 0, height / 2])
        linear_extrude(height=height, 
                    center = center, 
                    convexity=convexity, 
                    twist=twist, 
                    scale=scale, 
                    $fn=fn)
            circle(r=radius, $fn=sides);
    
    for(j=[0:1:steps - 1]) {
        for(i=[0:1:15]) {
            translate([0, 0, j * step_inc + step_inc / 2.5]) {
                for(r=[0:60:180]) {
                    rotate([twist_inc * (j + 1.35) + r, 90, 0])
                        cylinder(h=height * 2, r=10, center=true);
                }
            }
            
            translate([0, 0, j * step_inc + step_inc / 1.7]) {
                for(r=[35:60:180]) {
                    rotate([twist_inc * (j + 1.7) + r, 90, 0])
                        cylinder(h=height * 2, r=10, center=true);
                }
            }
            
        }
    }
}
}


// simple twisted extrusion, with constant radius
//simple_extruded_vase(5, 120, radius, 0, height, [0.5, 0.5], [0, 0, 0]);

// simple twisted extrusion, with changing radius
//simple_extruded_vase(5, 120, radius, 0, height, [1.0, 1.0], [0, 0, 0]);

// with interference patterns/holes
difference() {
    simple_extruded_vase(5, twist, radius, 0, height, [1.0, 1.0], [0, 0, 0]);

    translate([0, 0, height / 2]) 
      cylinder(h=height * (steps - 1) / steps, r=radius * 0.84, center=true);
    
    translate([0, 0, 2 + height / 2])
        cylinder(h=height + 2, r=radius * 0.80, center=true);
}

/* 
// with varying radius
simple_extruded_vase(5, 45, radius, 0, height / 2, [0.5, 0.5], [0, 0, 0]);
simple_extruded_vase(5, 30, radius * 0.5, height / 2, height / 4, [1.25, 1.25], [0, 0, 27]);
simple_extruded_vase(5, 45, radius * 0.63, height / 2 + height / 4, height / 4, [1.25, 1.25], [0, 0, -3]);
*/

/* 
// with varying, increasing radius
simple_extruded_vase(8, 60, radius, 0, height / 3, [1.25, 1.75], [0, 180, 180]);
simple_extruded_vase(8, 60, radius, height / 3, height / 3, [1.25, 1.25], [0, 0, 0]);
simple_extruded_vase(8, 60, radius * 1.25, height / 3 * 2, height / 3, [2, 1.5], [0, 0, 30]);
*/

// complex_extruded_vase();

