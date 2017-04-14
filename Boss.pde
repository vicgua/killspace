class Boss extends Alien {
  int lives;

  Boss(float x, float y) {
    super(x, y);
    img = AlienVars.bossImg;
    vx = AlienVars.bossVx;
    vy = AlienVars.bossVy;
    r = AlienVars.bossR;
    lives = 10;
  }

  void move() {
    println("Move called", alive);
    if (!alive) return;
    y += vy;
    if ((x + r + vx >= width) ||(x - r + vx <= 0)) vx *= -1;
    x += vx;
  }

  void die() {
    lives--;
    if (lives <= 0) {
      death_b.play(); // Me gustaria justarlo con una o mas explosiones, las normales sirven
      contador += 20;
      alive = false;
      hasBoss = false;
    }
    else  boss_crash.trigger(); // Suena cuando es golpeado

  }

  void inScreen() {
  }
}