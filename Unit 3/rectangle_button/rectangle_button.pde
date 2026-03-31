//pallette of colors
color lightPink = #ffc8dd;
color purple = #cdb4db;
color pink = #ffafcc;
color lightBlue= #bde0fe;
color darkBlue = #003566;
color white = #ffffff;

//variables for color selection
color selectedColor;

void setup() {
  size(800, 600);
  strokeWeight(5);
  stroke(darkBlue);
  selectedColor = purple;
}

void draw() {
  background(lightBlue);

  //pink buttons
  tactile(200, 500, 50);
  fill(pink);
  rect(125, 425, 150, 100);

  //lightpink button
  tactile(400, 500, 50);
  fill(lightPink);
  rect(325, 425, 150, 100);

  //purple button
  tactile(600, 500, 50);
  fill(purple);
  rect(525, 425, 150, 100);

  //Indicator
  stroke(darkBlue);
  fill(selectedColor);
  square(250, 75, 300);
}


void tactile (int x, int y, int r) {
  if (dist(x, y, mouseX, mouseY) < r) {
    stroke(white);
  } else {
    stroke(darkBlue);
  }
}


void mouseReleased() {
  //pink button
  if (dist(200, 500, mouseX, mouseY) < 50) {
    selectedColor = pink;
  }

  //lightpink button
  if (dist(400, 500, mouseX, mouseY) < 50) {
    selectedColor = lightPink;
  }
  //purple button
  if (dist(600, 500, mouseX, mouseY) < 50) {
    selectedColor = purple;
  }
}
