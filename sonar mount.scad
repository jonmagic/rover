width = 20;
difference() {
  cube([width,width*3,width*4]);
  translate([-1,width+10,0]) rotate([-width,0,0]) cube([width+2,width*3,width*9]);
  rotate([-width,0,0]) translate([-1,-width*3,0]) cube([width+2,width*3,width*9]);
  translate([-width,-1,width]) rotate([0,width/3,0]) cube([width,width*3+2,width*9]);
  mirror([1,0,0]) translate([-width*2,-1,width]) rotate([0,width/3,0]) cube([width,width*3+2,width*9]);
  translate([-1,0,-1]) cube([width+2,width/3,width+2]);
}
