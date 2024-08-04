module figure(len_x, len_y, len_z) {
  union() {
    square_x = len_y / sqrt(2);
    square_z = len_z;

    translate([len_y / 2, 0, 0])
    rotate(a = 45, v = [0, 0, 1])
    cube([square_x, square_x, len_z]);

    translate([len_x - len_y / 2, 0, 0])
    rotate(a = 45, v = [0, 0, 1])
    cube([square_x, square_x, len_z]);

    translate([len_y / 2, 0, 0])
    cube([len_x - len_y, len_y, len_z]);
  }
}

hole_inner_width_mm = 38;
hole_inner_height_mm = 14;

function fn_hole_outer_width(border_thickness) = hole_inner_width_mm + border_thickness * 2 * sqrt(2);

module plug_hole(border_thickness = 2, depth = 2, thin = true) {

  border_x_mm = border_thickness * sqrt(2);
  border_y_mm = border_thickness;

  difference() {
    if (thin) {
      figure(hole_inner_width_mm + 2 * border_x_mm, hole_inner_height_mm + 2 * border_y_mm, depth);
    } else {
      cube([hole_inner_width_mm + 2 * border_x_mm, hole_inner_height_mm + 2 * border_y_mm, depth]);
    }


    translate([border_x_mm, border_y_mm, 0])
    figure(hole_inner_width_mm, hole_inner_height_mm, depth);
  }
}

