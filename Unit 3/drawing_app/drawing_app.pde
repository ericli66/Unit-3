// Colors
color red = #ff4d4d, blue = #4d94ff, green = #5cd65c;
color yellow = #FCE03D, orange = #ffad33, purple = #cc99ff;
color white = 255, black = 0, gray = 200;
color pink = #ffb3f0, cyan = #00ffff, brown = #8b4513;

//Color Variable
color selectedColor;

//slidervariable
float strokeSize, sliderX;

//stamp images
PImage YT;
PImage selectedStamp;
boolean stampOn = false;

void setup() {
  size(1600, 1000);
  background(255);
  selectedColor = red;
  sliderX = 250;
  //YT = loadImage("YT.png");
}

void draw() {
  // Draw Toolbar
  noStroke();
  fill(220);
  rect(0, 0, 1600, 150);

  //draw Interface
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
  circleButton(pink, 40, 120, 20);
  circleButton(cyan, 90, 120, 20);
  circleButton(brown, 140, 120, 20);

  //thickness slider
  slider(225, 75, 25);

  //Indicator
  stroke(selectedColor);
  strokeWeight(strokeSize);
  line(450, 25, 450, 125);

  ////stamp
  //stampButton(YT, 500, 100, 100, 100);
}

//circle funtion
void circleButton(color c, int x, int y, int r) {
  // Tactile
  if (dist(mouseX, mouseY, x, y) < r) {
    stroke(white);
    if (mousePressed) {
      selectedColor = c;
    }
  } else {
    stroke(black);
  }
  //circle
  strokeWeight(2);
  fill(c);
  circle(x, y, 2*r);
}

//slider function
void slider(int x, int y, int d) {
  strokeWeight(5);
  stroke(0);
  line(x, y, x + 150, y);
  //tactile
  if (dist(mouseX, mouseY, sliderX, 50) < d/2) {
    stroke(white);
  } else {
    stroke(black);
  }
  fill(0);
  circle(sliderX, y, d);
  strokeSize = map(sliderX, 200, 350, 1, 20);
}

//to move the slider
void controlSlider() {
  if (mouseX > 225 && mouseX < 375 && mouseY > 50 && mouseY < 100 ) {
    sliderX = mouseX;
  }
}

////stamp function
//void stampButton(PImage label, int x, int y, int w, int h) {
//  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
//    fill(white);
//    if (mousePressed) {
//      stampOn = true;
//      selectedStamp = label;
//    }
//  } else {
//    fill(gray);
//  }
//  stroke(black);
//  rect(x, y, w, h);
//  image(label, x, y, w, h);
//  fill(black);
//}

void mouseDragged() {
  controlSlider();
  
//check if the stamp is one
  if (mouseY > 150) {
    if (stampOn == true) {
      image(selectedStamp, mouseX, mouseY);
    } else {
      stroke(selectedColor);
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
  }
}

void mousePressed() {
  controlSlider();
  
  //if(
  
}
