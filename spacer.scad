radius = 17.5;
width = 17;
bolt_dia = 6;

arc_thickness = 7;

$fn = 50;

translate([0,0, -(radius - arc_thickness)])
rotate(a = 90, v = [0,1,0])
difference() {
    {
        // base cylinder
        cylinder (r = radius, h = width, center = true);
    }

    {
        // cube to make the cylinder a 3D chord
        translate([arc_thickness,0,0])
        cube([radius * 2, radius * 2,  width], center = true);
        
        // bolt hole
        rotate(a = 90, v=[0,1,0])
        cylinder(r = bolt_dia/2, h = radius * 2, center = true); 
        
        // entry slot
        translate([0,0,-width/4])
        # cube([radius * 2, bolt_dia, width/2], center = true);
    }
}