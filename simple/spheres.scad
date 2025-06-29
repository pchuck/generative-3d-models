inc=10;
d=5;

module object(inc, d) {
    for (a=[-50:inc:50])
        translate([a, 0, 0]) sphere(d);
}

object(20, 5);
