float sliderY;
float size;

void setup() {
  size(800, 600);
  strokeWeight(5);
  sliderY = 300;
  size = 100;
}

void draw() {
  background(255);
  line(100, 100, 100, 500);
  circle(100, sliderY, 50);
  circle(500, 300, size);
  size = map(sliderY, 100, 500, 50, 500);
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
