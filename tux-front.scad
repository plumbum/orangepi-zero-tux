include <common.scad>

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
                }
                tux_front_fill();
            }
        }
        // Cut screw holes
        for (coord = screw_place) {
            translate(coord) screw_hole();
        }
    }
}