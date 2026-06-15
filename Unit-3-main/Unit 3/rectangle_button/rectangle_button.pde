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
  tactile(125);
  fill(pink);
  rect(125, 425, 150, 100);

  //lightpink button
  tactile(325);
  fill(lightPink);
  rect(325, 425, 150, 100);

  //purple button
  tactile(525);
  fill(purple);
  rect(525, 425, 150, 100);

  //Indicator
  stroke(darkBlue);
  fill(selectedColor);
  square(250, 75, 300);
}


void tactile (int x) {
  if (mouseX > x && mouseX < x+150 && mouseY > 425 && mouseY < 525) {
    stroke(white);
  } else {
    stroke(darkBlue);
  }
}


void mouseReleased() {
  //pink button
  if (mouseX > 125 && mouseX < 275 && mouseY > 425 && mouseY < 525) {
    selectedColor = pink;
  }

  //lightpink button
  if (mouseX > 325 && mouseX < 475 && mouseY > 425 && mouseY < 525) {
    selectedColor = lightPink;
  }
  //purple button
  if (mouseX > 525 && mouseX < 675 && mouseY > 425 && mouseY < 525) {
    selectedColor = purple;
  }
}
