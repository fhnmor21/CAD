$fn=64;
translate ([-216.85,-905.6,0])
    linear_extrude(height = 10, center=true, convexity = 10)
        import (file = "gear.dxf");
rotate([0,0,-3*360/32])
    translate([209,0,0])
        cube(15, center=true);