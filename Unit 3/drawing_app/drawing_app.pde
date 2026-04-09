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

void Interface() {
  // circle Buttons
  circleButton(red, 40, 30, 40);
  circleButton(orange, 90, 30, 40);
  circleButton(yellow, 140, 30, 40);
  circleButton(green, 40, 75, 40);
  circleButton(blue, 90, 75, 40);
  circleButton(purple, 140, 75, 40);
  
  //Indicator
  fill(selectedColor);
  stroke(0);
  strokeWeight(1);
  //ellipse(
}

void circleButton(color c, int x, int y, int r) {
  // Tactile
  if (dist(mouseX, mouseY, x, y) < r) {
    stroke(white);
  } else {
    stroke(black);
  }
  //circle
  fill(c);
  circle(x, y, 2^r);
}

void mousePressed() {
  // Check Color Buttons
  if (dist(mouseX, mouseY, 40, 30) < 20) {
    selectedColor = red;
  }
  if (dist(mouseX, mouseY, 90, 30) < 20) {
    selectedColor = orange;
  }
  if (dist(mouseX, mouseY, 140, 30) < 20) {
    selectedColor = yellow;
  }
  if (dist(mouseX, mouseY, 40, 75) < 20) {
    selectedColor = green;
  }
  if (dist(mouseX, mouseY, 90, 75) < 20) {
    selectedColor = blue;
  }
  if (dist(mouseX, mouseY, 140, 75) < 20) {
    selectedColor = purple;
  }
}
