

for(i=[0:s-2])
f(1);

s= 3;

r= 1.31;

b=7;

  u=1.3; 
 t = .01;
module f(w){


    
 for(i=[0:3000])
 {
        translate([0,0,(i/11)%100])
        rotate([0,100,i*t*11+s(i )*41+i/3+s(i*t*10)*10])
        translate([-55+s(i*1)*11,0,s(i*1.0)])
        #cylinder(10,10,0,$fn=3);
        
         translate([0,0,(i/11)%100])
        rotate([0,100,i*t*55+s(i )*41+i/3+s(i*t*10)*10])
        translate([-55+s(i*1)*11,0,s(i*1.0)])
        #cylinder(10,10,0,$fn=3);       
     
              translate([0,0,(i/11)%100])
        rotate([0,100,i*t*55+s(i )*10+i/3+s(i*t*10)*10])
        translate([-55+s(i*1)*11,0,s(i*1.0)])
        #cylinder(10,10,0,$fn=3);       

 }      
    
}


function s(n)= sin(n*1.543);