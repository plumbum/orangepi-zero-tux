use <tux-back.scad>
include <opi0-holder.scad>

difference() {
    tux_back_screwed();
    translate([18, 0, 10]) opi0_pcb();
}
intersection() {
    translate([18, 0, 10]) opi0_holder();
    tux_back_fill();
}
