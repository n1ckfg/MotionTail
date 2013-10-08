// based on "Yellowtail," by Golan Levin. 

import java.awt.Polygon;
import processing.opengl.*;

int sW = 640;
int sH = 480;
int fps = 60;

AutoPaint aP1, aP2;

void setup(){
  size(sW,sH,OPENGL);
  frameRate(fps);
  background(0);
  aP1 = new AutoPaint(color(255,100,0,150));
  aP1.ease = 500;
  aP1.spread = 10;
  aP2 = new AutoPaint(color(0,70,255,150));
  aP2.ease = 50;
  aP2.spread = 100;
  blendMode(ADD);
}

void draw(){
  background(0);

  aP1.run();
  aP2.run();
}



