include <./components/plug_hole.scad>

base_thickness_mm = 4;

router_width_mm = 210;
base_height_mm = 8;

hook_thickness_mm = 2;
hook_depth_mm = 20;
hook_min_height_mm = 5;
hook_height_mm = 20;

hole_border_thickness_mm = 2;
hole_outer_width = fn_hole_outer_width(hole_border_thickness_mm);

neck_length_mm = 120;
neck_width_mm = base_height_mm;

spine_length_mm = 50;
spine_width_mm = base_height_mm;

module hook() {
  cube([hook_thickness_mm, hook_min_height_mm, hook_depth_mm]);

  translate([0, 0, hook_depth_mm]) 
  cube([hook_thickness_mm, hook_height_mm, hook_thickness_mm]); 
}

module handle() {
  translate([hole_outer_width / 2 - neck_width_mm / 2, 0, 0])
  cube([neck_width_mm, neck_length_mm, base_thickness_mm]);

  translate([0, neck_length_mm, 0])
  plug_hole(border_thickness = 2, depth = 2);
}

union() {
  // BASE
  base_width = router_width_mm + hook_thickness_mm * 2;
  
  cube([base_width, base_height_mm, base_thickness_mm]);

  // HOOKS
  translate([0, 0, 0])
  hook();

  translate([base_width - hook_thickness_mm, 0, 0])
  hook();

  // HANDLE
  handle_offset_x = (base_width - hole_outer_width) / 2; 

  translate([handle_offset_x, base_height_mm, 0])
  handle();

  // SPINE

  spine_offset_x = (router_width_mm + 2 * hook_thickness_mm - spine_width_mm) / 2;

  translate([spine_offset_x, 0, 0])
  mirror([0, 1, 0])
  cube([spine_width_mm, spine_length_mm, base_thickness_mm]);
}