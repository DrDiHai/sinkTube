steps = 108.0;
lines = 8;
outerRadius = 9;
trueOuterRadius = 45/2;
scalar = (trueOuterRadius)/outerRadius;
translate([0,0,200]) rotate([0,180,0]) difference() {
    difference() {
        union() {
            scale([scalar+0.05,scalar+0.05,1]) {
                translate([0,0,11])
                {
                    difference() {
                    union() scale([0.75,0.75,1])
                         for(j = [0 : 1 : lines]) {
                            offset = 360 * j/lines;
                            render() {
                                rotate([0,0,offset]) translate([0,0,200]) {
                                    for(i = [0 : 360/steps : 720]) {
                                        sine = sin(i * 2);
                                        translate([0,2+outerRadius-sqrt((outerRadius*outerRadius)+(sine * sine*100)),0]) scale([1,1,1/3.6]) translate([0,10,0]) rotate([0,90,0]) translate([i,0,sine*10]) rotate([0,45,0])sphere(1);
                                    }
                                    for(i = [0 : 360/steps : 720]) {
                                        sine = cos(i * 3);
                                        color("lime") translate([0,2+outerRadius-sqrt((outerRadius*outerRadius)+(sine * sine*100)),0]) scale([1,1,1/3.6]) translate([0,10,0]) rotate([0,90,0]) translate([i,0,sine*10]) rotate([0,45,0])sphere(0.75, $fn = 10);
                                    }
                                }
                            }
                        }
                        translate([-10,-10,200]) cube(20,200);
                    }
                    color("red") difference()
                    {
                        cylinder(200,outerRadius,outerRadius,false);
                         for(k=[0 : 10 : 200]) translate([0,0,k]) rotate([0,0,k/2]) for(l=[0 : 10 : 360]) rotate([0,0,l]) translate([9,0,0]) color("limegreen") scale([0.4,0.4,3]) sphere(2, $fn = 20);
                    }
                }
            }

            translate([0,0,0]) {
                difference() {
                    cylinder(r1 = 41/2, r2 = trueOuterRadius, h = 11, $fn=360);
                    
                }
            }
        }
        translate([0,0,-5]) cylinder (r1 = 39.75/2, r2 = 39.75/2, h = 220);
    }
    difference() {
     translate([0,0,5]) cylinder(r1= 30, r2 = 30, h = 25);
    cylinder(r1 = 41/2, r2 = trueOuterRadius+(2*(trueOuterRadius-(41/2))), h = 33, $fn = 360);
    }
}