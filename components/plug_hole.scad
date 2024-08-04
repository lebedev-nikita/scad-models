module figure(dims) {
  union() {
    square_diagonal = dims.y;
    square_side = square_diagonal / sqrt(2);
    square_z = dims.z;

    translate([-(dims.x - square_diagonal) / 2, 0, 0])
    rotate(a = 45, v = [0, 0, 1]) 
    cube([square_side, square_side, dims.z], center = true);

    translate([(dims.x - square_diagonal) / 2, 0,0])
    rotate(a = 45, v = [0, 0, 1]) 
    cube([square_side, square_side, dims.z], center = true);
    
    // Base
    cube([dims.x - dims.y, dims.y, dims.z], center = true);
  }
}

plug_hole_inner_width = 38;
plug_hole_inner_height = 14;

function fn_hole_outer_width(border_thickness) = plug_hole_inner_width + border_thickness * 2 * sqrt(2);

module plug_hole(border_thickness = 2, h = 2, thin = true) {
  border_x = border_thickness * sqrt(2);
  border_y = border_thickness;  

  difference() {
    if (thin) {
      figure([plug_hole_inner_width + 2 * border_x, plug_hole_inner_height + 2 * border_y, h]);
    } else {
      cube([plug_hole_inner_width + 2 * border_x, plug_hole_inner_height + 2 * border_y, h], center = true);
    }

    figure([plug_hole_inner_width, plug_hole_inner_height, h]);
  }
}

