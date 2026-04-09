// Slider Variables
float sliderX = 100;
float strokeSize;

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
  strokeSize = 5;
  sliderY = 300;
}

void draw() {
  // 1. Draw Toolbar Area 
  noStroke();
  fill(220);
  rect(0, 0, width, 100);
  
  // 2. Draw Interface Elements
  Interface();
  
  // 3. Handle Drawing Logic
  if (mousePressed && mouseY > 100) {
    handleDrawing();
  }
}

// --- CORE FUNCTIONS ---

void handleDrawing() {
  stroke(selectedColor);
  strokeWeight(strokeSize);
}

void Interface() {
  // circle Buttons 
  circleButton(red, 40, 30, 40);
  circleButton(orange, 90, 30, 40);
  circleButton(yellow, 140, 30, 40);
  circleButton(green, 40, 75, 40);
  circleButton(blue, 90, 75, 40);
  circleButton(purple, 140, 75, 40);
  
   Thickness Slider
  drawSlider(300, 50, 150);
  
   Indicator (Shows current settings)
  fill(currentColor);
  stroke(0);
  strokeWeight(1);
  ellipse(500, 50, strokeSize * 2, strokeSize * 2);
  
   Stamp Buttons (Rectangular & Tactile)
  rectButton("S1", 570, 30, 50, 40, isStamp1On);
  rectButton("S2", 630, 30, 50, 40, isStamp2On);
  
   Action Buttons
  rectButton("NEW", 710, 30, 60, 40, false);
}

// --- BUTTON HELPER FUNCTIONS ---

void circleButton(color c, int x, int y, int r) {
  // Tactile feedback: lighten if hovering
  if (dist(mouseX, mouseY, x, y) < r) {
    stroke(white);
  } else {
    stroke(gray);
  }
  fill(c);
  circle(x, y, r);
}


void rectButton(String label, int x, int y, int w, int h, boolean active) {
  // Tactile feedback + Active state feedback
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    fill(active ? 100 : 180);
  } else {
    fill(active ? 150 : 255);
  }
  
  stroke(0);
  strokeWeight(active ? 3 : 1);
  rectMode(CORNER);
  rect(x, y, w, h);
  
  fill(0);
  textAlign(CENTER, CENTER);
  text(label, x + w/2, y + h/2);
}

void drawSlider(int x, int y, int len) {
  stroke(0);
  strokeWeight(4);
  line(x, y, x + len, y);
  
  // Tactile Knob
  if (dist(mouseX, mouseY, sliderVal, y) < 15) fill(150);
  else fill(255);
  
  circle(sliderVal, y, 20);
  
  // Map slider position to stroke weight (1 to 20)
  strokeSize = map(sliderVal, x, x + len, 1, 20);
}

// --- INTERACTION LOGIC ---

void mousePressed() {
  // Check Color Buttons
  if (dist(mouseX, mouseY, 40, 30) < 20) selectColor(red);
  if (dist(mouseX, mouseY, 90, 30) < 20) selectColor(orange);
  if (dist(mouseX, mouseY, 140, 30) < 20) selectColor(yellow);
  if (dist(mouseX, mouseY, 40, 75) < 20) selectColor(green);
  if (dist(mouseX, mouseY, 90, 75) < 20) selectColor(blue);
  if (dist(mouseX, mouseY, 140, 75) < 20) selectColor(purple);
  
  // Check Stamp Buttons
  if (mouseX > 570 && mouseX < 620 && mouseY > 30 && mouseY < 70) {
    isStamp1On = !isStamp1On;
    isStamp2On = false;
  }
  if (mouseX > 630 && mouseX < 680 && mouseY > 30 && mouseY < 70) {
    isStamp2On = !isStamp2On;
    isStamp1On = false;
  }
  
  // Check New Button
  if (mouseX > 710 && mouseX < 770 && mouseY > 30 && mouseY < 70) {
    background(255);
  }
}

void mouseDragged() {
  // Move slider knob
  if (mouseX > 300 && mouseX < 450 && mouseY > 35 && mouseY < 65) {
    sliderVal = mouseX;
  }
}

void selectColor(color c) {
  currentColor = c;
  isStamp1On = false;
  isStamp2On = false;
}
