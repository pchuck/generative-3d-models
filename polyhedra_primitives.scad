// rendering methods adapted from thingiverse script by unknown author

// center
function add3(v, i = 0, r) = 
    i < len(v) ? 
        i == 0 ?
            add3(v, 1, v[0]) :
            add3(v, i + 1, r + v[i]) :
        r;

// returns list of the coordinates of the vertices on this face
function facecoord(vertices, faces, n) = [
    for(i = [0 : len(faces[n]) - 1])
        vertices[faces[n][i]]
]; 

// position text
module facetext(vert, txt, minko, font, size, depth) {
    bar = add3(vert) / len(vert); // barycentre
    length = norm(bar);           // radial distance
    b = acos(bar.z / length);     // inclination angle
    c = atan2(bar.y, bar.x);      // azimuthal angle
    
    rotate([0, b, c])
        translate([0, 0, length + minko])
            linear_extrude(depth, center=true)
                text(text=txt, size=size, font=font,
                     halign="center", valign="center");
}

// render scaled polyhedra with chamfering and text-labeled faces
module render(labels, scaling_factor, vertices, faces, minko,
              original_diameter, roll, minkfn,
              txt_font, txt_size, txt_depth) {

    scale(scaling_factor) {
        difference() {
            intersection() {
                minkowski($fn=minkfn) {
                    polyhedron(points=vertices, faces=faces, convexity=20);
                    sphere(minko);
                }
                sphere(original_diameter - roll, $fn=minkfn);
            }
        for(i=[0:len(faces)-1])
            facetext(facecoord(vertices, faces, i), labels[i], minko, 
                txt_font, txt_size, txt_depth);
        }
    }
}

