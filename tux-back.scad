include <config.scad>
use <common.scad>
use <opi0-holder.scad>

tux_back_screwed();

module tux_back_screwed() {
    hole_mount_deep = 20;
    // Screw mount
    difference() {
        union() {
            // Empty tux front
            tux_back();
            intersection() {
                union() {
                    if (enable_connector_panel) connector_panel();
                    if (enable_opi0_holder) {
                        translate([-connector_panel_x_offset, 0, connector_panel_z_offset]) {
                            opi0_holder();
                            translate([-thickness-10, -(pcb_w+thickness*2)/2, -(thickness+pcb_bottom_space)])
                                cube([10, pcb_w+thickness*2, pcb_h+thickness*2]);
                        }
                    }
                    // Place screw mounts
                    translate([-hole_mount_deep, 0, 0]) {
                        union() {
                            for (coord = screw_place) {
                                translate(coord) screw_mount(hole_mount_deep);
                            }
                        }
                    }
                }
                tux_back_fill();
            }
        }
        // Cut screw holes
        for (coord = screw_place) {
            translate(coord) screw_hole();
        }
        if (enable_connector_panel) connector_panel_cutter();
        if (enable_opi0_holder)
            translate([-connector_panel_x_offset, 0, connector_panel_z_offset])
                opi0_pcb();
    }
}

module tux_back_fill_screwed() {
    hole_mount_deep = 20;
    // Screw mount
    difference() {
        tux_back_fill();
        // Cut screw holes
        for (coord = screw_place) {
            translate(coord) screw_hole();
        }
    }
}

module connector_panel() {
    outer_l = connector_panel_l+thickness*2;
    outer_w = connector_panel_w+thickness*2;
    outer_h = connector_panel_h+thickness*2;
    // translate([-connector_panel_l-thickness*2-connector_panel_x_offset, -connector_panel_w/2, connector_panel_z_offset])
    translate([-outer_l-connector_panel_x_offset, -outer_w/2, connector_panel_z_offset-thickness])
    difference() {
        cube([outer_l, outer_w, outer_h]);
        translate([-thickness, thickness, thickness])
            cube([connector_panel_l, connector_panel_w, connector_panel_h]);
    }

}

module connector_panel_cutter() {
    outer_l = connector_panel_l+thickness*2;
    outer_w = connector_panel_w+thickness*2;
    outer_h = connector_panel_h+thickness*2;
    translate([-outer_l-connector_panel_x_offset, -outer_w/2, connector_panel_z_offset-thickness])
        cube([outer_l, outer_w, outer_h]);
}