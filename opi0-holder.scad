include <config.scad>

opi0_holder();
// #opi0_pcb();

module opi0_holder() {
    translate([0,0,-pcb_bottom_space-thickness]) {
        translate([0, pcb_w/2-pcb_screw_place, 0]) pcb_bottom_rail();
        translate([0, -pcb_w/2, 0]) pcb_bottom_rail();
    }
    translate([0,0,pcb_thickness]) pcb_top_rail();

    // Outer box
    outer_l = pcb_l + thickness*2;
    outer_w = pcb_w + thickness*2; // + 20;
    outer_h = pcb_h + thickness*2;
    difference() {
        difference() {
            translate([-thickness, -outer_w/2, -(thickness+pcb_bottom_space)])
                cube([outer_l, outer_w, outer_h]);
            translate([0, -pcb_w/2, -thickness])
                cube([pcb_l, pcb_w, pcb_h*2]);
        }
        opi0_pcb();
    }
}

module pcb_top_rail() {
    holder_h = pcb_h-pcb_thickness-pcb_bottom_space+thickness;
    translate([0,-pcb_w/2,0])
    intersection() {
        cube([pcb_l, pcb_w, holder_h]);
        square_side = sqrt(2)*holder_size;
        union() {
            translate([0, 0]) rotate([0,0,45]) cube([square_side, square_side, holder_h*2], center=true);
            translate([pcb_l, 0]) rotate([0,0,45]) cube([square_side, square_side, holder_h*2], center=true);
            translate([0, pcb_w]) rotate([0,0,45]) cube([square_side, square_side, holder_h*2], center=true);
            translate([pcb_l, pcb_w]) rotate([0,0,45]) cube([square_side, square_side, holder_h*2], center=true);
        }
    }

}

module pcb_bottom_rail() {
    translate([0, pcb_screw_place, 0])
    rotate([90, 0, 0])
    linear_extrude(height=pcb_screw_place)
    polygon([
        [0, 0],
        [0, thickness+pcb_bottom_space],
        [pcb_screw_place, thickness+pcb_bottom_space],
        [pcb_screw_place+pcb_bottom_space, thickness],
        [pcb_l-(pcb_screw_place+pcb_bottom_space), thickness],
        [pcb_l-pcb_screw_place, thickness+pcb_bottom_space],
        [pcb_l, thickness+pcb_bottom_space],
        [pcb_l, 0],
    ]);
}


// Simple model of Orange Pi Zero for cut holes
module opi0_pcb() {
    translate([0, -pcb_w/2, 0]) {
        cube([pcb_l, pcb_w, pcb_thickness]);
        // Inner space
        translate([0, pcb_screw_place+1, -pcb_thickness-pcb_bottom_space])
            cube([pcb_l, pcb_w-(pcb_screw_place+1)*2, eth_height+pcb_thickness+pcb_bottom_space]);
        // Usb host
        translate([-10, usb_offset, usb_floor_offset])
            cube([20, usb_width, usb_height]);
        // Ethernet
        translate([-10, eth_offset, eth_floor_offset])
            cube([20, eth_width, eth_height]);
        // Connector spaces
        translate([-10, usb_offset-2, usb_floor_offset-2])
            cube([10-thickness, eth_width + usb_width + 6, eth_height + 4]);
        // MicroUSB
        translate([pcb_l-10, musb_offset, musb_floor_offset])
            cube([15, musb_width, musb_height]);
        // MicroSD
        translate([pcb_l-10, msd_offset, msd_floor_offset])
            cube([10+8, msd_width, msd_height]);
    }
}