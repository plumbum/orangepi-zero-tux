include <config.scad>

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

// Import and scale original model.
// New model has height near to 120mm.
module tux_full() {
    sc = 1.9;
    scale([sc, sc, sc])
    rotate([0,0,90])
    translate([0,-4,-44.6]) import("Tux.stl");
}

module orangepizero_box() {
    l = 48 + 2;
    w = 45 + 2;
    h = 15 + 2;
    color("Blue")
    translate([-l/2, -w/2, 0]) cube([l, w, h]);
}

module screw_hole() {
    d = 2.5;
    dk = 4.7+0.3;
    thread = 22;
    deep = 30;

    rotate([0,90,0]) translate([0, 0, -2]) {
        cylinder(d=2.5+0.5, h=2, $fn=20);
        translate([0,0,-deep]) {
            cylinder(d=d, h=thread+deep, $fn = 20);
            cylinder(d=dk, h=deep, $fn=20);
        }
    }
}

module screw_mount(h=20) {
    d = 7;
    rotate([0, 90, 0])
    cylinder(h=h, d=d, $fn=40);
}
