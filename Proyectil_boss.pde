class Proyectil_boss extends Alien {
 
  Proyectil_boss(float x, float y) {
    super(x, y);
    img = AlienVars.proyImg;
    vx = AlienVars.proyVx;
    vy = AlienVars.proyVy;
    r = AlienVars.proyR;
  }
  
  void move() {
    if (!alive) return;
    x += vx;
    y += vy;
  }
  void inScreen(){
    if (y >= height) {
      alive = false; 
    }
    else if ((x > mouseX - 15 && x < mouseX + 15) && (y > height - 65 && y < height - 35)) {
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