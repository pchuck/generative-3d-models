// twisted vase from polygon experiment
//
// github.com/pchuck/generative-3d-models
//

translate([ 0,  0]) circle(10,$fn=5);

levels = 40;
n = 0;
max_v = 10;

module stack(r, v, z, n) {
//    nv = v + rands(-5, 5, 1)[0];
    nv = v + 0.5;
    echo(nv);
    rotate([0, 0, r])
    translate([0, 0, z])
    circle(10, $fn=5);
    if(n < levels) 
        stack(r + nv, nv > max_v ? max_v : nv, z + 1, n + 1);

}

stack(0, 0, 0, 0);