class Boss extends Alien {
  private int lives;
  private int lastProj;

  Boss(float x, float y) {
    super(x, y);
    img = AlienVars.bossImg;
    vx = AlienVars.bossVx;
    vy = AlienVars.bossVy;
    r = AlienVars.bossR;
    lives = 10;
    lastProj = 0;
  }

  void show() {
    tint(255, 255 * (1 - .075 * (10 - lives)));
    super.show();
    noTint();
  }

  void move() {
    if (!alive) return;
    y += vy;
    if ((x + r + vx >= width) || (x - r + vx <= 0)) vx *= -1;
    x += vx;
    if (millis() >= lastProj + 500 && random(0, 1) <= AlienVars.proyProb) {
      pnum++;
      aliens.add(new ProyectilBoss(x, y));
      lastProj = millis();
    };
  }

  void die() {
    lives--;
    if (lives <= 0) {
      death_b.play();
      image(AlienVars.bossDeathImg, x - 160, y - 160);
      contador += 20;
      alive = false;
    } else boss_crash.trigger();
  }

  void inScreen() {
    return; // Mai no pot sortir de la pantalla
  }
}