width = 22.23;
height = 19.85;
post = 10;
difference() {
  rotate([-45,0,0]) {
    translate([width/2-post/2,-9,4]) {
      cube([post,40,post]);
    }
  }
  translate([0,-4,0]) {
    cube([20,5,20]);
  }
  translate([0,14,-12]) {
    rotate([270,0,0]) {
      cube([20,10,20]);
    }
  }
  translate([width/2,25,-10]) {
    cylinder(r = post/2-1.5, h = 20);
  }
    translate([width/2,25,-15]) {
      cylinder(r = 1.5, h = 20);
    }
}
difference() {
  cube([width, 4, height]);
  translate([width - 2.28, 5, 2.28]) {
    rotate([90,90,0]) {
      cylinder(r = 1.125, h = 6);
    }
  }
  translate([2.28, 5, height - 4.3]) {
    rotate([90,90,0]) {
      cylinder(r = 1.125, h = 6);
    }
  }
  translate([5.6,-1,height-3]) {
    cube([width,6,10]);
  }
  translate([2,-1,height+0.6]) {
    rotate([0,45,0]) {
      cube([5,10,10]);
    }
  }
}
