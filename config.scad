thickness = 1.6;

enable_opi0_holder = 1;
enable_connector_panel = 0;

// Screw coordinates
screw_place = [
    [0, -22, 5],
    [0, 22, 5],
    [0, -20, 64],
    [0, 20, 64],
    [0, 0, 110]
];

// Connetor back panel
connector_panel_x_offset = 7;
connector_panel_z_offset = 12;
connector_panel_l = 20;
connector_panel_w = 36;
connector_panel_h = 16;

// Orange pi zero holder
pcb_l = 48 + 1;
pcb_w = 45 + 2;
pcb_h = 19; // 70; // 15 + 3.5;
pcb_thickness = 2;
pcb_screw_place = 5;
pcb_bottom_space = 2;

usb_width = 7;
usb_height = 14;
usb_offset = 6.5;
usb_floor_offset = pcb_thickness+0.0;

eth_width = 17;
eth_height = 14.5;
eth_offset = 15.5;
eth_floor_offset = pcb_thickness-1;

musb_width = 8.5;
musb_height = 3.5;
musb_offset = 5.5;
musb_floor_offset = pcb_thickness-0.5;

msd_width = 12;
msd_height = 2.5;
msd_offset = 22;
msd_floor_offset = -msd_height;

holder_size = 6.1;

