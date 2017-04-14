static class AlienVars {
  static float vx, vy, bossVx, bossVy, r, bossR, proyVxMul, 
    proyVyMul, proyR, proyProb;
  static PImage img, deathImg, bossImg, bossDeathImg, proyImg;
}

class Alien {
  float x, y;
  float vx, vy, r;
  PImage img, deathImg;
  boolean alive;

  Alien(float x, float y) {
    this.x = x;
    this.y = y;
    vx = AlienVars.vx;
    vy = AlienVars.vy;
    r = AlienVars.r;
    img = AlienVars.img;
    deathImg = AlienVars.deathImg;
    alive = true;
  }

  void move() {
    if (!alive) return;
    x += vx;
    y += vy;
  }

  void show() {
    if (!alive) return;
    image(img, x, y);
  }

  boolean checkCol(float xrow) {
    if (!alive) return false;
    if (xrow >= x && xrow <= (x + 2*r))
      return true;
    return false;
  }

  void die() {
    image(deathImg, x-40, y-40);
    death_s.trigger();
    alive = false;
    if (boss == null) contador++;
  }

  void inScreen() {
    if (y >= height) {
      fill(color(255, 0, 0));
      noLoop();
      fill(255, 0, 0);
      palabra=createFont("WalkwayBold-48.vlw", 5);
      textFont (palabra, 60);
      text("GAME OVER", 130, 300);
      game_over_s.play();
    } else if ((x > mouseX - 15 && x < mouseX + 15) && (y > height - 65 && y < height - 35)) {
      image(deathImg, mouseX-50, height-100); 
      noLoop();
      fill(255, 0, 0);
      palabra=createFont("WalkwayBold-48.vlw", 5);
      textFont (palabra, 60);
      text("GAME OVER", 130, 300);
      explosion_s.play();
    }
  }
}