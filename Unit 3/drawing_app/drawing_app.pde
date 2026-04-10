// Colors
color red = #ff4d4d, blue = #4d94ff, green = #5cd65c;
color yellow = #FCE03D, orange = #ffad33, purple = #cc99ff;
color white = 255, black = 0, gray = 200;

//Color Variable
color selectedColor;

//slidervariable
float strokeSize, sliderX;

void setup() {
  size(800, 600);
  background(255);
  selectedColor = red;
  sliderX = 250;
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
  circleButton(red, 40, 30, 20);
  circleButton(orange, 90, 30, 20);
  circleButton(yellow, 140, 30, 20);
  circleButton(green, 40, 75, 20);
  circleButton(blue, 90, 75, 20);
  circleButton(purple, 140, 75, 20);

  //thickness slider
  slider(200, 50, 25);

  //Indicator
  stroke(selectedColor);
  strokeWeight(strokeSize);
  line(375, 20, 375, 85);
}

void circleButton(color c, int x, int y, int r) {
  // Tactile
  if (dist(mouseX, mouseY, x, y) < r) {
    stroke(white);
  } else {
    stroke(black);
  }
  //circle
  strokeWeight(2);
  fill(c);
  circle(x, y, 2*r);
}

void slider(int x, int y, int r) {
  strokeWeight(5);
  stroke(0);
  line(x, y, x + 100, y);
  if (dist(mouseX, mouseY, sliderX, 50) < r) {
    stroke(white);
  } else {
    stroke(black);
  }
  fill(0);
  circle(sliderX, y, 50);
  strokeSize = map(sliderX, 200, 300, 1, 20);
}

void controlSlider() {
  if (mouseX > 200 && mouseX < 300 && mouseY > 25 && mouseY < 75 ) {
    sliderX = mouseX;
  }
}

void mouseDragged() {
  controlSlider();
  if (mouseY > 100) {
  stroke(selectedColor);
  line(pmouseX, pmouseY, mouseX, mouseY);
  }
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
  controlSlider();
}
