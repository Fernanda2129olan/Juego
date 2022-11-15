class Square {
  float x;
  float y;
  float wid;
  float velocity = 2.5;
  boolean direction;
  void display() {
    fill(colors[colorIndex]);
    rect(x, y, wid, 40);
  }
  void update() {
    if (x - velocity <= 0) {
      direction = true;
    }
    if (x + velocity + wid >= width) {
      direction = false;
    }
    if (direction) {
      x += velocity;
    } else {
      x -= velocity;
    }
  }
  void click(color colour) {
    boolean reset = false;
    pSquare newSquare = new pSquare();
    newSquare.colour = colour;
    if (pSquares.size() > 0) {
      pSquare prev = pSquares.get(pSquares.size() - 1);
      if (x > prev.x) {
        if (x > prev.x + prev.wid) {
          restart();
          reset = true;
        } else {
          newSquare.wid = dist(x, 0, prev.x + prev.wid, 0);
          wid = dist(x, 0, prev.x + prev.wid, 0);
          newSquare.x = x;
        }
      } else if (x < prev.x) {
        if (x + wid < prev.x) {
          restart();
          reset = true;
        } else {
          newSquare.wid = dist(prev.x, 0, x + wid, 0);
          wid = dist(prev.x, 0, x + wid, 0);
          newSquare.x = prev.x;
        }
      } else {
        newSquare.wid = wid + 30;
        newSquare.x = x - 15;
        wid += 30;
        velocity = 6.5;
        score += 25;
        newSquare.perfect = true;
      }
    } else {
      newSquare.wid = wid;
      newSquare.x = x;
    }
    if (!reset) {
      newSquare.y = y;
      pSquares.add(newSquare);
      if (pSquares.size() == 8) {
        pSquares.remove(pSquares.get(0));
      }
      if (y >= 250) {
        y -= 40;
      } else {
        for (pSquare p : pSquares) {
          p.y += 40;
        }
      }
    }
  }
}
