include <./components/plug_hole.scad>

thickness_mm = 2;

router_width_mm = 210;
base_height_mm = 8;

module hook() {
  depth_mm = 20;
  min_height_mm = 5;
  hook_height_mm = 20;

  angle = 8;

  cube([thickness_mm, min_height_mm, depth_mm]);

  translate([0, 0, depth_mm]) 
  cube([thickness_mm, hook_height_mm, thickness_mm]); 
}

module handle() {
  hole_width = hole_outer_width(thickness_mm);
  neck_length_mm = 120;
  neck_width_mm = base_height_mm;

  
  translate([hole_width / 2 - neck_width_mm / 2, 0, 0])
  cube([neck_width_mm, neck_length_mm, thickness_mm]);

  translate([0, neck_length_mm, 0])
  plug_hole(border_thickness = thickness_mm, depth = thickness_mm);
}

union() {

  // BASE
  base_width = router_width_mm + thickness_mm * 2;

  cube([base_width, base_height_mm, thickness_mm]);

  // HOOKS
  translate([0, 0, 0])
  hook();

  translate([base_width - thickness_mm, 0, 0])
  hook();

  // HANDLE
  handle_offset_x = (router_width_mm + 2 * thickness_mm - hole_outer_width(thickness_mm)) / 2; 

  translate([handle_offset_x, base_height_mm, 0])
  handle();

  // SPINE
  spine_length_mm = 50;
  spine_width_mm = base_height_mm;

  spine_offset_x = (router_width_mm + 2 * thickness_mm - spine_width_mm) / 2;

  translate([spine_offset_x, 0, 0])
  mirror([0, 1, 0])
  cube([spine_width_mm, spine_length_mm, thickness_mm]);
}