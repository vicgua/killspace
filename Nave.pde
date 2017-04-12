class Nave {
  float x, y;
  PImage img;
  
  Nave(PImage img, float y) {
    this.img = img;
    this.y = y;
  }
  
  void show() {
    image(img, x, y);
  }
  
  void shoot() {
    Proyectil p = new Proyectil(x + 12, y);
    p.show();
    p.kill();
  }
}