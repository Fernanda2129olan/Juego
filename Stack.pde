Square square;
ArrayList<pSquare> pSquares = new ArrayList<pSquare>();

color[] colors = {color(205, 180, 219), color(255, 200, 221), 
  color(255, 175, 204), color(189, 224, 254), 
  color(162, 210, 255), color(251, 160, 196), 
  color(254, 125, 220)};
int colorIndex;
boolean colorDir;
int score;
int highScore;

void setup() {
  background(10, 40, 40);
  size(500, 500);
  square = new Square();
  square.x = 0;
  square.y = width - 40;
  square.wid = 200;
  score = 0;
  highScore = 0;
  noStroke();
}

void draw() {
  backgrnd();
  for (pSquare p : pSquares) {
    p.display();
  }
  square.update();
  square.display();
  showScores();
}

void mousePressed() {
  if (square.velocity < 15) {
    square.velocity += 0.5;
  }
  color colorAux = colors[colorIndex];
  if (colorDir) {
    colorIndex++;
  } else {
    colorIndex--;
  }
  if (colorIndex == -1) {
    colorIndex = 1;
    colorDir = true;
  } else if (colorIndex == 7) {
    colorIndex = 5;
    colorDir = false;
  }
  square.click(colorAux);
  score++;
}

void restart() {
  pSquares = new ArrayList<pSquare>();
  square.x = 0;
  square.y = width - 40;
  square.wid = 200;
  square.velocity = 5;
  if (score > highScore) {
    highScore = score;
  }
  score = -1;
}

void backgrnd() {
  int[] c1 = {72, 132, 130};
  int[] c2 = {174, 211, 163};
  for (int i = 0; i < height; i++) {
    float t = 0.002 * i;
    float[] cIndex = new float[3];
    cIndex[0] = (1 - t) * c1[0] + t * c2[0];
    cIndex[1] = (1 - t) * c1[1] + t * c2[1];
    cIndex[2] = (1 - t) * c1[2] + t * c2[2];
    fill(cIndex[0] - 20, cIndex[1] - 20, cIndex[2] - 20);
    rect(0, i, width, 1);
  }
}

void showScores() {
  fill(255);
  textAlign(CENTER);
  
   textSize(30);
  text("Instrucciones: Usa el click izquierdo", width/2, 20);
  textSize(30);
  text("Puntos: " + score, width/2, 70);
  textSize(20);
  text("Tu mejor puntuacion: " + highScore, width/2, 100);
}
