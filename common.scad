
/*
difference() {
    // tux_front();
    // tux_back();
    tux_full();
    translate([12, 0, 10]) pizero_box();
    //translate([10, -20, 10]) pizero_box();
    //translate([10, 20, 10]) pizero_box();
    //translate([20, 0, 10]) pizero_box();
    //translate([-20, 0, 10]) pizero_box();
}
*/

module tux_front() {
    difference() {
        tux_front_fill();
        translate([-0.1,0,2])
        scale([0.8, 0.9, 0.96]) tux_front_fill();
    }
}

module tux_back() {
    difference() {
        tux_back_fill();
        translate([0.1,0,2])
        scale([0.9, 0.9, 0.96]) tux_back_fill();
    }
}

module pizero_box() {
    l = 48 + 2;
    w = 45 + 4;
    h = 15 + 3;
    color("Blue")
    translate([-l/2, -w/2, 0]) cube([l, w, h]);
}

module tux_front_fill() {
    intersection() {
        tux_full();
        scale([2, 2, 2])
        translate([0, -25, 0]) cube([30, 50, 65]);
    }
}

module tux_back_fill() {
    intersection() {
        tux_full();
        scale([2, 2, 2])
        translate([-30, -25, 0]) cube([30, 50, 65]);
    }
}

module tux_full() {
    // Scaled height >110mm
    scale([1.9, 1.9, 1.9])
    rotate([0,0,90])
    translate([0,-4,-44.6]) import("Tux.stl");
}
