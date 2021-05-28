//rad -> radius of circumscribing circle for polygon generating geometric pattern
//n -> Number of sides of polygon
//w -> width of pattern
//theta_0 -> angle for start point in polygon
//m -> Number of pattern repition desired
//gamma -> angle for start point of polygon circumscribing inner pattern


module elegant_pattern(rad,n,w,theta_0,m,gamma){
    linear_extrude(height = 2.5)
        rotate([0,0,gamma]){
            angle = 360/n;
            for(j=[0:m-1]){    
                rotate([0,0,j*(360/m)])  {
                  for (i=[0:n-1]) {
                            
                            translate([-rad,0,0]){
                            
                                hull(){
                                    theta = theta_0 + i*angle;                                 
                                    translate([rad*cos(theta),rad*sin(theta)]) circle(r=w,$fn=20);
                                    translate([rad*cos(theta+angle),rad*sin(theta+angle)]) circle(r=w,$fn=20);
                                }
                                
                        }
                        }
                    }     
                } 
             

            radp = rad/cos(36)+2*w;

            radps = rad/cos(36)-0.5*w;

            difference(){
                polygon([[2*radp*cos(36),2*radp*sin(36)+w],[2*radp*cos(108),2*radp*sin(108)],[2*radp*cos(180),2*radp*sin(180)],[2*radp*cos(252),2*radp*sin(252)],[2*radp*cos(324),2*radp*sin(324)]]);

                polygon([[2*radps*cos(36),2*radps*sin(36)+w],[2*radps*cos(108),2*radps*sin(108)],[2*radps*cos(180),2*radps*sin(180)],[2*radps*cos(252),2*radps*sin(252)],[2*radps*cos(324),2*radps*sin(324)]]);
    
}
}
}


//elegant_pattern(5,8,0.5,0,10,0);



to =1;

//rotation of pattern element in upper half
    
function rho(P,T) = 40;

for( j = [1:1:5]) {
    
    phi1 = 63.43;
    //phi2 = 180*(i+step1);
    
    theta = 72*j;
    //theta2 = 360*(j+step2);
    
    s=0.5;
    
    rotate([0,0,theta])
    rotate([0,phi1,0])
    translate([0,0,33])
    //cube(size = s, center = true);
    elegant_pattern(10,8,0.5,0,10,36);
}

//rotation of pattern element in lower half  

for( j = [1:1:5]) {
    
    phi1 = 116.57;
    //phi2 = 180*(i+step1);
    
    theta = 72*j+36;
    //theta2 = 360*(j+step2);
    
    s=0.5;
    
    rotate([0,0,theta])
    rotate([0,phi1,0])
    translate([0,0,33])
    //cube(size = s, center = true);
    elegant_pattern(10,8,0.5,0,10,0);
}


p = 39*sin(63.43);

//translate([0,0,p])elegant_pattern(10,8,0.5,0,10,0);


translate([0,0,-p])elegant_pattern(10,8,0.5,0,10,36);


