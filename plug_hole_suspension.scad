include <./components/plug_hole.scad>
include <./components/cylinder_hole.scad>


hole_outer_radius = 7;
hole_diameter = hole_outer_radius * 2;


union() {
  // translate([0, hole_outer_radius, 0])
  plug_hole(center = true);

  cylinder_hole(inner_r = 5, outer_r = hole_outer_radius, h = 2);
}