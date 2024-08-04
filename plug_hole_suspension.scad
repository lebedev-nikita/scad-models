include <./components/plug_hole.scad>
include <./components/cylinder_hole.scad>

$fn = 100;

thickness = 2;
hole_inner_radius = 5;
hole_outer_radius = hole_inner_radius + thickness;

neck_length = 5;

difference() {
  union() {

    cylinder_hole(inner_r = hole_inner_radius, outer_r = hole_outer_radius, h = thickness);
  
    // Neck
    translate([0, hole_outer_radius, 0])
    translate([0, neck_length / 2, 0])
    cube([thickness, neck_length + 1, thickness], center = true);


    // Plug Hole
    translate([0, neck_length, 0])
    translate([0, hole_outer_radius +  (plug_hole_inner_height + thickness * 2) / 2, 0])
    plug_hole(border_thickness = thickness);
  }

  // Trim
  rotate(a = 60)
  translate([0, hole_outer_radius / 2, 0])
  #cube([thickness * 2, hole_outer_radius, thickness], center = true);
}