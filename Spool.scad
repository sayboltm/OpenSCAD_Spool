//cube([2,3,4]); //comment

//difference() {
//	cube(30, center=true);
//	sphere(20                             );
//	}
//
//translate([0, 0, 30]){
//	cylinder(h=40, r=10);
//	}

cylMainDia = 80;
cylHeight = 60;
cylExtnHeight = 20;
cylMaxDia = 120;
cylWallThickness = 20;

//SpoolBody( cylHeight, cylExtnHeight, cylMainDia, cylMaxDia );
//SpoolInner( cylHeight, cylExtnHeight, cylMainDia, cylMaxDia, cylWallThickness);
difference(){
    SpoolBody( cylHeight, cylExtnHeight, cylMainDia, cylMaxDia );
    //cylinder(h=200, d=5);
    SpoolInner( cylHeight, cylExtnHeight, cylMainDia, cylMaxDia, cylWallThickness );
}

module SpoolBody( cylHeight, cylExtnHeight, cylMainDia, cylMaxDia ){
    union(){
        cylinder(h=cylHeight, d=cylMainDia);
        translate([0,0,cylHeight]){
            cylinder(h=cylExtnHeight, d1=cylMainDia, d2=cylMaxDia);
        }
        translate([0,0,-cylExtnHeight]){
            cylinder(h=cylExtnHeight, d1=cylMaxDia, d2=cylMainDia);
        }
    }
}

module SpoolInner( cylHeight, cylExtnHeight, cylMainDia, cylMaxDia, cylWallThickness){
    union(){
        
//        translate([0,0,cylHeight+cylExtnHeight]){
//            cylinder(h=1,d=cylMaxDia-2*cylWallThickness);
//        }
        
        cylinder(h=cylHeight, d=cylMainDia-2*cylWallThickness);
        translate([0,0,cylHeight]){
            cylinder(h=cylExtnHeight, d1=cylMainDia-2*cylWallThickness, d2=cylMaxDia-2*cylWallThickness);
        }
        translate([0,0,-cylExtnHeight]){
            cylinder(h=cylExtnHeight, d1=cylMaxDia-2*cylWallThickness, d2=cylMainDia-2*cylWallThickness);
        }
        
//     translate([0,0,-cylExtnHeight-1]){
//            cylinder(h=1,d=cylMaxDia-2*cylWallThickness);
//        }   
    }
}


