class Button {
  private float x, y, dx, dy;
  private color f, s;
  String txt;

  Button(float dx, float dy) {
    this.dx = dx;
    this.dy = dy;
  }

  void move(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void setColors(color f, color s) {
    this.f = f;
    this.s = s;
  }

  void show() {
    rectMode(CORNER);
    fill(f);
    stroke(s);
    rect(x, y, dx, dy);
    palabra=createFont("WalkwayBold-48.vlw", 5);
    textFont (palabra, 30);
    textAlign(CENTER, CENTER);
    noStroke();
    fill(0);
    text(txt, x + dx / 2, y + dy / 2);
  }

  boolean clicked() {
    return mouseX >= x && mouseX <= x + dx && mouseY >= y && mouseY <= y + dy;
  }
}