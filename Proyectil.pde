static class ProyectilVars {
  static color col;
}

class Proyectil {
  float x, y_0;
  private Alien killed;

  Proyectil(float x, float y_0) {
    this.x = x;
    this.y_0 = y_0;
    killed = null;
  }

  void show() {
    stroke(ProyectilVars.col);
    fill(ProyectilVars.col);
    float y = 0;
    for (Alien a : aliens) {
      if (a.checkCol(x) && a.y > y) {
        killed = a;
        y = a.y;
      }
    }
    if (boss != null && boss.checkCol(x) && boss.y > y) {
      killed = boss;
      y = boss.y;
    }
    line(x, y_0, x, y);
  }

  void kill() {
    if (killed != null)
      killed.die();
  }
}