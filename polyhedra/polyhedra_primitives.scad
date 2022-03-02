// rendering methods adapted and refactored from thingiverse script by
// unknown author and https://www.thingiverse.com/agournay

// center
function add3(v, i=0, r) = 
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
module facetext(vert, txt, minko, font, size, depth, xrot=0) {
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

module facetext_10_12(vert, txt, tv, zint, size, font, depth, minko) {
    barpo = add3(vert) / len(vert); // barycentre
    bar = add3([barpo, [0, 0, (tv == 0 ? 1 : -1) * zint]]);
    length = norm(bar);       // radial distance
    b = acos(bar.z / length); // inclination angle
    c = atan2(bar.y, bar.x);  // azimuthal angle
    lenfac = (norm(barpo) + minko) / norm(barpo);
    // stretch coordinate to compensate for chamfering
    barpof = [for(j=[0:2]) barpo[j] * lenfac];
    
    translate(barpof)
        rotate([0, b, c])
            linear_extrude(depth, center=true)
                text(text=txt, size=size, font=font,
                     halign="center", valign="center");
}

// render just the surface text, no shape
module render_text(labels, scaling_factor, vertices, faces, minko,
                   original_diameter, roll, minkfn,
                   txt_font, txt_size, txt_depth,
                   xrot=0) {
    scale(scaling_factor) {
        for(i=[0:len(faces)-1])
            facetext(facecoord(vertices, faces, i), labels[i], minko, 
                     txt_font, txt_size, txt_depth, xrot);
    }
}

// render just the scaled polyhedra, no chamfering or text
module render_shape(labels, scaling_factor, vertices, faces, minko,
                    original_diameter, roll, minkfn,
                    txt_font, txt_size, txt_depth,
                    xrot=0) {
    scale(scaling_factor) {
        polyhedron(points=vertices, faces=faces, convexity=20);
    }
}

// render just the scaled polyhedra with text, no chamfering
module render_simple(labels, scaling_factor, vertices, faces, minko,
                     original_diameter, roll, minkfn,
                     txt_font, txt_size, txt_depth,
                     xrot=0) {
    scale(scaling_factor) {
        difference() {
            polyhedron(points=vertices, faces=faces, convexity=20);
            for(i=[0:len(faces)-1])
                facetext(facecoord(vertices, faces, i), labels[i], minko, 
                    txt_font, txt_size, txt_depth, xrot);
        }
    }
}

// render scaled polyhedra with chamfering and text-labeled faces
module render(labels, scaling_factor, vertices, faces, minko,
              original_diameter, roll, minkfn,
              txt_font, txt_size, txt_depth,
              xrot=0) {
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
                    txt_font, txt_size, txt_depth, xrot);
        }
    }
}

// render scaled polyhedra with chamfering and text-labeled faces
// same as above, with additional complexity for text placement
module render_10_12(labels, scaling_factor, vertices, faces, minko,
                    original_diameter, roll, minkfn,
                    txt_font, txt_size, txt_depth,
                    index, zint) {
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
                facetext_10_12(facecoord(vertices, faces, i),
                               labels[i], faces[i][index], zint,
                               txt_size, txt_font, txt_depth, minko);
        }
    }
}

