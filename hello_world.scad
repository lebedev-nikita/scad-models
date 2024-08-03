// Cheat Sheet

// Variables
num_cylinders = 15;

// Facet Numbers
$fn = 100;

// Cube

translate([0, -5, 0])
cube([10, 10, 10]);

// Sphere

translate([20, 0, 5])
sphere(5);

// Cylynder

translate([35, 0, 0])
cylinder(r1 = 5, r2 = 5, h=10);

// Rotate

translate([50, 0, 0])
rotate(a=90, v=[1,0,0])
cylinder(r1 = 5, r2 = 5, h=10);

// Loop

for (i = [1:1:num_cylinders]) {
  translate([i * (i / 5) * 15, 10, 0])
  cylinder(r1=i * 2, r2=1, h= i * 3);
}