include <./components/plug_hole.scad>

base_thickness = 4;

router_width = 205;
base_height = 8;

hook_thickness = 2;
hook_depth = 20;
hook_min_height = 5;
hook_height = 20;

hole_border_thickness = 2;

neck_length_thick = 60;
neck_length_thin = 30;
neck_length_total = neck_length_thick + neck_length_thin;

neck_thickness_thick = base_thickness;
neck_thickness_thin = 2;

neck_width = base_height;

spine_length = 80;
spine_width = base_height;

module hook() {
  translate([-hook_thickness / 2, 0, 0]) {
    cube([hook_thickness, hook_min_height, hook_depth]);

    translate([0, 0, hook_depth]) 
    cube([hook_thickness, hook_height, hook_thickness]); 
  }
}

module handle() {
  // Thick Neck
  neck_length_thick = neck_length_total - neck_length_thin;
  translate([0, neck_length_thick / 2, 0])
  cube([neck_width, neck_length_thick, neck_thickness_thick], center = true);

  // Thin Neck
  translate([0, 0, (neck_thickness_thick - neck_thickness_thin) / 2])
  translate([0, neck_length_thick, 0])
  translate([0, neck_length_thin / 2, 0])
  cube([neck_width, neck_length_thin, neck_thickness_thin], center = true);

  // Plug Hole
  hole_outer_height = plug_hole_inner_height + hole_border_thickness * 2;
  translate([0,0, (neck_thickness_thick - neck_thickness_thin) / 2])
  translate([0, neck_length_total + (hole_outer_height) / 2, 0])
  plug_hole(border_thickness = hole_border_thickness, h = 2);
}

union() {
  // BASE
  base_width = router_width + hook_thickness * 2;
  
  translate([0, base_height / 2, 0])
  cube([base_width, base_height, base_thickness], center = true);

  // HANDLE
  translate([0, base_height, 0])
  handle();

  // SPINE
  translate([0, - spine_length / 2, 0])
  cube([spine_width, spine_length, base_thickness], center = true);

  // HOOKS
  translate([-(base_width - hook_thickness) / 2, 0, 0])
  hook();

  translate([(base_width - hook_thickness) / 2, 0, 0])
  hook();
}