//pallette of colors
color lightPink = #ffc8dd;
color purple = #cdb4db;
color pink = #ffafcc;
color lightBlue= #bde0fe;
color darkBlue = #003566;

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

  //button
  fill(pink);
  circle(200, 500, 100);

  fill(lightPink);
  circle(400, 500, 100);

  fill(purple);
  circle(600, 500, 100);
  
//Indicator
  fill(selectedColor);
  square(250, 100, 300);
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
    if (dist(600, 500, mouseX, mouseY) < 50) {
    selectedColor = purple;
  }
}
