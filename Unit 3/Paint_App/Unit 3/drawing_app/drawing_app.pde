// Colors
color red = #ff4d4d, blue = #4d94ff, green = #5cd65c;
color yellow = #ffff66, orange = #ffad33, purple = #cc99ff;
color white = 255, black = 0, gray = 200;

//Color Variable
color selectedColor;

void setup() {
  size(800, 600);
  background(255);
  selectedColor = red;
}

void draw() {
  // 1. Draw Toolbar
  noStroke();
  fill(220);
  rect(0, 0, width, 100);
  
  //draw Interface elements
  Interface();
}
