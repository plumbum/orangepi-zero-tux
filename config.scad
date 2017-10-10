thickness = 1.6;

enable_opi0_panel = 0;
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
connector_panel_x_offset = 8;
connector_panel_z_offset = 12;
connector_panel_l = 20;
connector_panel_w = 36;
connector_panel_h = 16;

// Orange pi zero holder
pcb_l = 48 + 1;
pcb_w = 45 + 2;
pcb_h = 15 + 3.5;
pcb_thickness = 2;
pcb_screw_place = 5;
pcb_bottom_space = 2;

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

