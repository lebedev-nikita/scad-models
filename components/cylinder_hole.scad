module cylinder_hole( outer_r = 2, inner_r = 1, h = 1) {
  difference() {
    cylinder(r1 = outer_r, r2 = outer_r, h = h);
    cylinder(r1 = inner_r, r2 = inner_r, h = h);
  }
}
