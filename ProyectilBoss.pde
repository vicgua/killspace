class ProyectilBoss extends Alien {

  ProyectilBoss(float x, float y) {
    super(x, y);
    img = AlienVars.proyImg;
    vx = AlienVars.proyVxMul * AlienVars.vx;
    vy = AlienVars.proyVyMul * AlienVars.vy;
    r = AlienVars.proyR;
  }

  void die() {
    return; // Indestructible
  }

  void inScreen() {
    if (y >= height) {
      alive = false;
      pnum--;
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