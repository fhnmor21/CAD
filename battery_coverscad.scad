$fn = 64;

// parameters
batt_length = 92.0;
batt_width  = 60.0;
batt_height = 10.5;
batt_round = batt_height/3;

box_length = 150.0;
box_width  = 79.5;
box_height = 17.0;
sholder_h = 4;
sholder_l = 24.5;
sholder_w = 11;


screw_depth = 5.0;
screw_rad = 1.7;
screws_pos = [  [5.5 + screw_rad, 26.5 + screw_rad], 
                                [6 + screw_rad, 6 + screw_rad]];


bot_offset = 10.5;
top_offset = 8.5;

inner_clearance = 2.5;
wall_thickness = 1.5;
border_rad = 2;


module romboide(w, l, h, r, c)
{
    minkowski()
    {
        sphere(r);
        cube([w - 2*r , l - 2*r , h - 2*r], center=c);
    }
}

/*
// battery
translate([0,0,batt_height/2])
{
    romboide(batt_width, batt_length, batt_height, batt_round, true);
}

// handheld
translate([-1,0,0])
{
    difference()
    {
        union()
        {
            translate([0, 0, -box_height/2])
                romboide(box_width, box_length, box_height, border_rad, true);
            translate([(box_width - sholder_w)/2, (box_length - sholder_l)/2, 0])
                romboide(sholder_w, sholder_l, 2*sholder_h, border_rad, true);
            translate([(box_width - sholder_w)/2, -(box_length - sholder_l)/2, 0])
                romboide(sholder_w, sholder_l, 2*sholder_h, border_rad, true);
        }
         for (i = [0:1])
        {
            x = pow(-1, i)*(box_width/2 - screws_pos[i][0]);
            y = (box_length/2 - screws_pos[i][1]);
            for (s = [-1:2:1])
                translate([x, s*y,0]) 
                    cylinder(h=2*screw_depth, r=screw_rad, center=true);
        }
    }
}
*/
//  battery cover
difference()
{
    color("red")
    {
        ext_delta = inner_clearance + wall_thickness;
        total_h = batt_height + ext_delta;
        excess = 2*batt_height - total_h - border_rad;
        translate([0,0,excess])
        {
            difference()
            {
                union()
                {
                    romboide(batt_width + 2*ext_delta
                                        ,batt_length + 2*ext_delta
                                        ,2*batt_height
                                        ,batt_round, true);
                    translate([0, -4-batt_length/2, -4])
                        cylinder(h=6,r=12,center=true);
                    translate([0, 4+batt_length/2, -4])
                        cylinder(h=6,r=12,center=true);
                }
                romboide(batt_width + 2*wall_thickness
                                    ,batt_length + 2*wall_thickness
                                    ,2*(batt_height - 2*wall_thickness)
                                    ,batt_round/2, true);
            }

        }
    } 
    translate([0,0,-30]) cube([200,200,60], center=true);
    
    // visualization cut
    //translate([-100,0,0]) cube(200, center=true);
}


                













