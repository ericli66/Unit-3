//palletes of colours//
color blue = #059AFA;

//slider
float sliderY;
float size;

void setup() {
  size(900, 800);
  background(255);
  s
}

void draw() {
  fill(blue);
  rect(0, 0, 900, 200);
}

void mouseDragged() {
  controlSlider();
}

void mousePressed() {
  controlSlider();
}

void controlSlider() {
  if (mouseX > 50 && mouseX < 150 && mouseY > 100 && mouseY < 500 ) {
    sliderY = mouseY;
  }
}

void tactile (int x, int y, int r) {
  if (dist(x, y, mouseX, mouseY) < r) {
    stroke(white);
  } else {
    stroke(darkBlue);
  }
}
