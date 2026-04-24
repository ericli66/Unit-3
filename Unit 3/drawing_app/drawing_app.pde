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
PImage YT, Dragon, Atomic;
PImage selectedStamp;
boolean stampOn = false;

void setup() {
  size(1600, 1000);
  background(255);
  selectedColor = red;
  sliderX = 250;
  YT = loadImage("YT.png");
  Dragon = loadImage("dragon.png");
  Atomic = loadImage("atomic.png");
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

  //stamp
  stampButton(Atomic, 950, 25, 100, 100);
  stampButton(YT, 550, 25, 100, 100);
  stampButton(Dragon, 750, 25, 100, 100);

  //Clear, Save, Load
  rectButton("CLEAR", 1150, 45, 120, 60);
  rectButton("SAVE", 1300, 45, 120, 60);
  rectButton("LOAD", 1450, 45, 120, 60);
}

//circle funtion
void circleButton(color c, int x, int y, int r) {
  // Tactile
  if (dist(mouseX, mouseY, x, y) < r) {
    stroke(white);
    if (mousePressed) {
      selectedColor = c;
      stampOn = false;
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

//stamp function
void stampButton(PImage label, int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w+15 && mouseY > y-5 && mouseY < y+h+5) {
    fill(white);
    if (mousePressed) {
      stampOn = true;
      selectedStamp = label;
    }
  } else {
    fill(gray);
  }
  stroke(black);
  strokeWeight(3);
  rect(x, y-5, w+15, h+10, 10);
  image(label, x+10, y+5, w, h);
}

//load, save, and clear buttons
void rectButton(String label, int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    fill(white);
  } else {
    fill(gray);
  }
  stroke(black);
  strokeWeight(2);
  rect(x, y, w, h, 10);
  fill(black);
  textAlign(CENTER, CENTER);
  textSize(20);
  text(label, x + w/2, y + h/2);
}

void saveImage(File f) {
  if (f != null) {
    PImage canvas = get(0, 150, width, height - 150);
    canvas.save(f.getAbsolutePath());
  }
}

void openImage(File f) {
  if (f != null) {
    int n = 0;
    while (n<10) {
      PImage pic = loadImage(f.getPath());
      image(pic, 0, 150);
      n = n+1 ;
    }
  }
}

void mouseDragged() {
  controlSlider();

  //check if the stamp is on
  if (mouseY > 150) {
    if (stampOn == true) {
      image(selectedStamp, mouseX-100, mouseY-100, 200, 200);
    } else {
      strokeWeight(strokeSize);
      stroke(selectedColor);
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
  }
}

void mousePressed() {
  controlSlider();

  // Check CLEAR button (Updated X: 1150 to 1270)
  if (mouseX > 1150 && mouseX < 1270 && mouseY > 45 && mouseY < 105) {
    fill(255);
    noStroke();
    rect(0, 150, width, height - 150);
  }

  // Check SAVE button (Updated X: 1300 to 1420)
  if (mouseX > 1300 && mouseX < 1420 && mouseY > 45 && mouseY < 105) {
    selectOutput("Choose a name for your file", "saveImage");
  }

  // Check LOAD button (Updated X: 1450 to 1570)
  if (mouseX > 1450 && mouseX < 1570 && mouseY > 45 && mouseY < 105) {
    selectInput("Pick an image to load", "openImage");
  }
}
