/*
Particles text effects
 


Thanks to Daniel Shiffman for explanation on arrival behavior (shiffman.net)
Author: Jason Labbe
Site: jasonlabbe3d.com
*/

import controlP5.*;
ControlP5 cp5;

Table table;

int valSlider;

int rowCount;

String [] ano; 
int [] total;
int maxDato;
float [] barraTotal;

int [] suba;
int [] bolivar;
int [] kennedy;


// Global variables
ArrayList<Particle> particles = new ArrayList<Particle>();
int pixelSteps = 25; // Amount of pixels to skip //cantidad de particulas
boolean drawAsPoints = false;
ArrayList<String> words = new ArrayList<String>();
int wordIndex = 0;
color bgColor = color(255, 100);
String fontName = "Arial Bold";



class Particle {
  PVector pos = new PVector(0, 0);
  PVector vel = new PVector(0, 0);
  PVector acc = new PVector(0, 0);
  PVector target = new PVector(0, 0);

  float closeEnoughTarget = 50;
  float maxSpeed = 5.0;
  float maxForce = 0.1;
  float particleSize = 5;
  boolean isKilled = false;

  color startColor = color(0);
  color targetColor = color(0);
  float colorWeight = 0;
  float colorBlendRate = 0.025;

  void move() {
    // Check if particle is close enough to its target to slow down
    float proximityMult = 1.0;
    float distance = dist(this.pos.x, this.pos.y, this.target.x, this.target.y);
    if (distance < this.closeEnoughTarget) {
      proximityMult = distance/this.closeEnoughTarget;
    }

    // Add force towards target
    PVector towardsTarget = new PVector(this.target.x, this.target.y);
    towardsTarget.sub(this.pos);
    towardsTarget.normalize();
    towardsTarget.mult(this.maxSpeed*proximityMult);

    PVector steer = new PVector(towardsTarget.x, towardsTarget.y);
    steer.sub(this.vel);
    steer.normalize();
    steer.mult(this.maxForce);
    this.acc.add(steer);

    // Move particle
    this.vel.add(this.acc);
    this.pos.add(this.vel);
    this.acc.mult(0);
  }

  void draw() {
   // println(particles.size());    // Draw particle
    color currentColor = lerpColor(this.startColor, this.targetColor, this.colorWeight);
    if (drawAsPoints) {
      stroke(currentColor);
      point(this.pos.x, this.pos.y);
    } else {
      noStroke();
      fill(currentColor);
      ellipse(this.pos.x, this.pos.y, this.particleSize, this.particleSize);
    }

    // Blend towards its target color
    if (this.colorWeight < 1.0) {
      this.colorWeight = min(this.colorWeight+this.colorBlendRate, 1.0);
    }
  }

  void kill() {
    if (! this.isKilled) {
      // Set its target outside the scene
      PVector randomPos = generateRandomPos(width/2, height/2, (width+height)/2);
      this.target.x = randomPos.x;
      this.target.y = randomPos.y;

      // Begin blending its color to black
      this.startColor = lerpColor(this.startColor, this.targetColor, this.colorWeight);
      this.targetColor = color(0);
      this.colorWeight = 0;

      this.isKilled = true;
    }
  }
}


// Picks a random position from a point's radius
PVector generateRandomPos(int x, int y, float mag) {
  PVector sourcePos = new PVector(x, y);
  PVector randomPos = new PVector(random(0, width), random(0, height));

  PVector direction = PVector.sub(randomPos, sourcePos);
  direction.normalize();
  direction.mult(mag);
  sourcePos.add(direction);

  return sourcePos;
}


// Makes all particles draw the next word
void nextWord(String word) {
  // Draw word in memory
  PGraphics pg = createGraphics(width, height);
  pg.beginDraw();
  pg.fill(0);
  pg.textSize(10);
  pg.textAlign(CENTER);
  PFont font = createFont(fontName, 200);
  pg.textFont(font);
  pg.text(word, width/2, height/2);
  pg.endDraw();
  pg.loadPixels();

  // Next color for all pixels to change to
  color newColor = color(random(0.0, 255.0), random(0.0, 255.0), random(0.0, 255.0));

  int particleCount = particles.size();
  int particleIndex = 0;

  // Collect coordinates as indexes into an array
  // This is so we can randomly pick them to get a more fluid motion
  ArrayList<Integer> coordsIndexes = new ArrayList<Integer>();
  
  println(pixelSteps+ "   " + kennedy[valSlider]);
  
  for (int i = 0; i < (width*height)-1; i+= pixelSteps) {
    
    coordsIndexes.add(i);
  }

  for (int i = 0; i < coordsIndexes.size (); i++) {
    // Pick a random coordinate
    int randomIndex = (int)random(0, coordsIndexes.size());
    int coordIndex = coordsIndexes.get(randomIndex);
    coordsIndexes.remove(randomIndex);
    
    // Only continue if the pixel is not blank
    if (pg.pixels[coordIndex] != 0) {
      // Convert index to its coordinates
      int x = coordIndex % width;
      int y = coordIndex / width;

      Particle newParticle;

      if (particleIndex < particleCount) {
        // Use a particle that's already on the screen 
        newParticle = particles.get(particleIndex);
        newParticle.isKilled = false;
        particleIndex += 1;
      } else {
        // Create a new particle
        newParticle = new Particle();
        
        PVector randomPos = generateRandomPos(width/2, height/2, (width+height)/2);
        newParticle.pos.x = randomPos.x;
        newParticle.pos.y = randomPos.y;
        
        newParticle.maxSpeed = random(2.0, 5.0);
        newParticle.maxForce = newParticle.maxSpeed*0.025;
        newParticle.particleSize = random(10, 10); //tamaño
        newParticle.colorBlendRate = random(0.0025, 0.03);
        
        particles.add(newParticle);
      }
      
      // Blend it from its current color
      newParticle.startColor = lerpColor(newParticle.startColor, newParticle.targetColor, newParticle.colorWeight);
      newParticle.targetColor = newColor;
      newParticle.colorWeight = 0;
      
      // Assign the particle's new target to seek
      newParticle.target.x = x;
      newParticle.target.y = y;
    }
  }

  // Kill off any left over particles
  if (particleIndex < particleCount) {
    for (int i = particleIndex; i < particleCount; i++) {
      Particle particle = particles.get(i);
      particle.kill();
    }
  }
}


void setup() {
  size(1900, 1000);
  background(255);
  
  table = loadTable("localidades.csv", "header");
  rowCount = table.getRowCount();
  //println(rowCount + " filas en la tabla");
  
  cp5 = new ControlP5(this);  
  
  gui();
  
  ano = new String [rowCount];

  total = new int [rowCount];

  bolivar = new int [rowCount];
  suba = new int [rowCount];
  kennedy = new int [rowCount];
  
  for (int i = 0; i < rowCount; i++)
  {
    TableRow row = table.getRow(i);

    ano[i] = row.getString("Tiempo");
    suba[i] = row.getInt("Suba");
    bolivar[i] = row.getInt("Ciudad Bolivar");
    kennedy[i] = row.getInt("Kennedy");


    if (suba[i] > maxDato) 
    {
      maxDato =  suba[i];
    }
  }

  //words.add("kennedy");
  words.add("Suba");
//  words.add("Ciudad Bolivar");

  //words.add("Bye :-)");
 // words.add("");

  nextWord(words.get(wordIndex));
  
  //if( .setRange == 1){
    //pixelSteps = 200;
  //}
}

void gui()
{

  //slider 
  cp5.addSlider("valSlider")
    .setPosition(620, 700) 
    .setWidth(650) 
    .setRange(0, rowCount-1) 
    .setValue(0)
    .setNumberOfTickMarks(rowCount) 
    .setSliderMode(Slider.FLEXIBLE) 
    ;
}

void drawPorcentage() 
{

  textSize(14);    
  fill(255);
  for (int i = 0; i < rowCount; i++)
  { 
    float x = map(i, 0, rowCount-1, 620, 1255);

    pushMatrix();
    translate(x, 720);
    rotate(PI/2);
    text(ano[i], 0, 0);
    popMatrix();
  }
  

  fill(#2D11ED);
  textSize(20);
  text("Suba = "+suba[valSlider]+" casos", 845, 650);
  //textSize(18);
  //text(bolivar[valSlider]+" bolivar", 120, 308);
  //text("Número de casos", 120, 300);
  //text("kennedy = " +kennedy[valSlider]+ " casos", 845, 650);
  
  pixelSteps = int(map(suba[valSlider],20,43,25,9)); //cantidad segun el excel

}

void draw() {
  // Background & motion blur
  
  drawPorcentage();
  
  fill(bgColor);
  noStroke();
  rect(0, 0, width*2, height*2);

  for (int x = particles.size ()-1; x > -1; x--) {
    // Simulate and draw pixels
    Particle particle = particles.get(x);
    particle.move();
    particle.draw();

    // Remove any dead pixels out of bounds
    if (particle.isKilled) {
      if (particle.pos.x < 0 || particle.pos.x > width || particle.pos.y < 0 || particle.pos.y > height) {
        particles.remove(particle);
      }
    }
  }

  // Display control tips
  fill(255-red(bgColor));
  textSize(9);
  String tipText = "Left-click for a new word.";
  tipText += "\nDrag right-click over particles to interact with them.";
  tipText += "\nPress any key to toggle draw styles.";
  text(tipText, 10, height-40);
}


// Show next word
void mousePressed() {
  if (mouseButton == LEFT) {
    wordIndex += 1;
    if (wordIndex > words.size()-1) { 
      wordIndex = 0;
    }
    nextWord(words.get(wordIndex));
  }
}


// Kill pixels that are in range
void mouseDragged() {
  if (mouseButton == RIGHT) {
    for (Particle particle : particles) {
      if (dist(particle.pos.x, particle.pos.y, mouseX, mouseY) < 50) {
        particle.kill();
      }
    }
  }
}


// Toggle draw modes
void keyPressed() {
  drawAsPoints = (! drawAsPoints);
  if (drawAsPoints) {
    background(0);
    bgColor = color(0, 40);
  } else {
    background(255);
    bgColor = color(255, 100);
  }
}
