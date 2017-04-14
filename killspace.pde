import ddf.minim.*;
import java.util.*;


/* TODO
 * - Nave nodriza
 *   - Proyectiles
 *   - Desplazamiento horizontal, vy = 0
 * - Sonidos
 */


//PREPARATIVOS: 
//escenario, arma y los invasores. 
//coordenadas de los dos invasores
int alien1x, alien2x;
int alien1y, alien2y;
//velocidad de caida de los invasores
int vyAlien=1;

int contador = 0;
int lastAdded = 0, lastBoss = 0;
int diametroAlien=32;
PFont palabra;
PFont numeros;
PImage espacio;
PImage cohete;
PImage explosion;
PImage alien1, alien2;
PImage proyectil_boss;
List<Alien> aliens;
Nave nave;
int anum;
int pnum;
Boss boss = null;

Minim minim;
AudioPlayer explosion_s, game_over_s, death_b;
AudioSample death_s, boss_crash;

void setup () {
  size(600, 600);
  frameRate(25);
  anum = 2;
  pnum = 0;
  nave = new Nave(loadImage("Night Raider 1.png"), height - 50);
  AlienVars.vx = 0;
  AlienVars.vy = 4;
  AlienVars.bossVx = 4;
  AlienVars.bossVy = 0;
  AlienVars.proyVxMul = 0;
  AlienVars.proyVyMul = 3; // Velocidad proyectil
  AlienVars.r = 16;
  AlienVars.bossR = 76.5;
  AlienVars.proyR = 10; // Radio proyectil
  AlienVars.proyProb = .02;
  AlienVars.img = loadImage("enemy.png");
  AlienVars.deathImg = loadImage("Start Explosion.png");
  AlienVars.bossImg = loadImage("boss.png");
  AlienVars.proyImg = loadImage("proyectil.png");
  ProyectilVars.col = color(255, 242, 0);
  aliens = new ArrayList<Alien>();

  //invasores aleatoriamente situados horizontalmente y arriba (y=0)
  numeros=createFont("TimesNewRomanPS-BoldMT-20", 20);
  textFont (numeros);
  espacio=loadImage("earth-11014_640.jpg");
  cohete=loadImage("Night Raider 1.png");

  minim = new Minim(this);
  explosion_s = minim.loadFile("explosion.wav");
  game_over_s = minim.loadFile("game_over.wav");
  death_b     = minim.loadFile("boss_death.wav"); //
  death_s     = minim.loadSample("alien_death.mp3", 512);
  boss_crash  = minim.loadSample("boss_crash.mp3", 512); //
  // DEBUG
  contador = 59;
}

void draw() {
  //Fondo
  background (0);
  image (espacio, 0, 0);
  //cohete
  nave.x = mouseX - 10;
  nave.show();
  //invasores
  invasores();
  fill(255, 242, 0);
  text(contador, 30, 30);  
  while (boss == null && anum < 6 && contador >= lastAdded + 15) {
    anum++;
    AlienVars.vy += .2;
    lastAdded += 15;
  }
  if (contador % 60 == 0 && contador >= 60 && contador != lastBoss) {
    anum = 2;
    AlienVars.vy = 3;
    boss = new Boss(width / 2, 75);
    lastBoss = contador;
  }

  finJuego();
}

void invasores() {
  ListIterator<Alien> as = aliens.listIterator();
  // Elimina els aliens morts de la llista
  while (as.hasNext()) {
    if (!as.next().alive) {
      as.remove();
    }
  }
  
  if (boss != null && !boss.alive) {
    boss = null;
  }
  
  while (aliens.size() < anum + pnum) {
    aliens.add(new Alien(random(35, width - 35), 0));
  }
  for (Alien a : aliens) {
    a.show();
    a.move();
  }
  if (boss != null) {
    boss.show();
    boss.move();
  }
}

//DISPARO (cuAndo hacemos click)
void mousePressed () {
  nave.shoot();
}

//FINAL DEL JUEGO 
void finJuego() {
  for (Alien a : aliens) {
    a.inScreen();
  }
}