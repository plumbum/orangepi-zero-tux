include <common.scad>

tux_back_screwed();

module tux_back_screwed() {
    hole_mount_deep = 20;
    // Screw mount
    difference() {
        union() {
            // Empty tux front
            tux_back();
            // Place screw mounts
            intersection() {
                translate([-hole_mount_deep, 0, 0]) {
                    union() {
                        for (coord = screw_place) {
                            translate(coord) screw_mount(hole_mount_deep);
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
    }
}