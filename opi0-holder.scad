
thickness = 2;

pcb_l = 48 + 1;
pcb_w = 45 + 2;
pcb_h = 15 + 3.5;
pcb_thickness = 2;

usb_width = 6.5;
usb_height = 14;
usb_offset = 7;
usb_floor_offset = pcb_thickness;

eth_width = 16.5;
eth_height = 14.5;
eth_offset = pcb_w-eth_width-15;
eth_floor_offset = pcb_thickness;

musb_width = 8.5;
musb_height = 3.5;
musb_offset = pcb_w-musb_width-32;
musb_floor_offset = pcb_thickness;

msd_width = 12;
msd_height = 2;
msd_offset = 12;
msd_floor_offset = -msd_height;

holder_size = 6.1;

// opi0_holder();

module opi0_holder() {
    outer_l = pcb_l + thickness*2;
    outer_w = pcb_w + thickness*2;
    outer_h = pcb_thickness + thickness*2;
    difference() {
        union() {
            pcb_holder();
            translate([-pcb_l/2, -outer_w/2, thickness])
                rotate([0,-90,0]) cube([pcb_h, outer_w, pcb_thickness]);
        }
        pcb_holder();
        translate([0,0,thickness]) opi0_pcb();
    }
}

// Simple model of Orange Pi Zero for cut holes
module opi0_pcb() {
    translate([-pcb_l/2, -pcb_w/2, 0]) {
        cube([pcb_l, pcb_w, pcb_thickness]);
        translate([-10, usb_offset, usb_floor_offset])
            cube([20, usb_width, usb_height]);
        translate([-10, eth_offset, eth_floor_offset])
            cube([20, eth_width, eth_height]);
        translate([pcb_l-10, musb_offset, musb_floor_offset])
            cube([30, musb_width, musb_height]);
        translate([pcb_l-10, msd_offset, msd_floor_offset])
            cube([30, msd_width, msd_height]);
    }
}

module pcb_holder() {
    outer_l = pcb_l + thickness*2;
    outer_w = pcb_w + thickness*2;
    outer_h = pcb_thickness + thickness*2;
    // Holder
    translate([0,0,outer_h/2])
    difference() {
        cube([outer_l, outer_w, outer_h], center=true);
        // Cut hole
        difference() {
            cube([pcb_l, pcb_w, outer_h+0.1], center=true);
            square_side = sqrt(2)*holder_size;
            translate([pcb_l/2, pcb_w/2]) rotate([0,0,45]) cube([square_side, square_side, outer_h+0.2], center=true);
            translate([-pcb_l/2, pcb_w/2]) rotate([0,0,45]) cube([square_side, square_side, outer_h+0.2], center=true);
            translate([pcb_l/2, -pcb_w/2]) rotate([0,0,45]) cube([square_side, square_side, outer_h+0.2], center=true);
            translate([-pcb_l/2, -pcb_w/2]) rotate([0,0,45]) cube([square_side, square_side, outer_h+0.2], center=true);
        }
    }

}
