include <common.scad>
use <opi0-holder.scad>

// translate([20, 0, 15]) orangepizero_box();

tux_front_screwed();

module tux_front_screwed() {
    hole_mount_deep = 50;
    // Screw mount
    difference() {
        union() {
            // Empty tux front
            tux_front();
            // Place screw mounts
            intersection() {
                union() {
                    for (coord = screw_place) {
                        translate(coord) screw_mount(hole_mount_deep);
                    }
                    if (enable_opi0_holder) {
                        translate([-connector_panel_x_offset, 0, connector_panel_z_offset]) {
                            opi0_holder();
                            translate([-thickness-10, -(pcb_w+thickness*2)/2, -(thickness+pcb_bottom_space)])
                                cube([10, pcb_w+thickness*2, pcb_h+thickness*2]);
                        }
                    }
                }
                tux_front_fill();
            }
        }
        // Cut screw holes
        for (coord = screw_place) {
            translate(coord) screw_hole();
        }
        if (enable_opi0_holder)
            translate([-connector_panel_x_offset, 0, connector_panel_z_offset])
                opi0_pcb();
    }
}