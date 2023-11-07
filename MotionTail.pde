// based on "Yellowtail," by Golan Levin. 

import java.awt.Polygon;

int sW = 960;
int sH = 540;
int sD = 1000;
int fps = 60;
float ease = 10;

OscHand[] hands = new OscHand[2];

ArrayList<AutoPaint> painters = new ArrayList<AutoPaint>();
int paintersLimit = 50;
color c1 = color(255, 100, 0, 250);
color c2 = color(0, 70, 255, 250);

boolean testTrigger = false;
String mode = "MidiViz"; //Leap, MidiViz
boolean fullScreen = false;

Settings settings;

void setup() {  
  size(960, 540, P3D);
  settings = new Settings("settings.txt");
  sD = int((float(sW)+float(sH))/2.0);
  surface.setSize(sW, sH);
  oscSetup();
  frameRate(fps);
  background(0);
  //blendMode(ADD);
  for (int i=0;i<hands.length;i++) {
    hands[i] = new OscHand();
  }
  noCursor();
  //initSyphon();
  canvas = (PGraphics3D) createGraphics(sW,sH,P3D);

  bloomSetup();
}

/*
boolean sketchFullScreen() {
  return true;
}
*/

void draw() {
  //beginSyphon();
  canvas.beginDraw();
  canvas.background(0);

  for (int i=0;i<hands.length;i++) {
    hands[i].run();
  }  

  println(hands[0].oscFinger[0].t.z);
  if (mode.equals("Leap")) {
    if (hands[0].oscFinger[0].t.z < 260 && !testTrigger) {
      addPainter();
      testTrigger=true;
    }
  } else {
    if (m.z < 260 && !testTrigger) {
      addPainter();
      testTrigger=true;
    }    
  }

  int countStrokes = 0;
  for (int i=0;i<painters.size();i++) {
    AutoPaint aP = painters.get(i);
    if (mode.equals("Leap")) {
      aP.t.x = hands[0].oscFinger[0].t.x;
      aP.t.y = hands[0].oscFinger[0].t.y;
    } else {
      aP.t.x = m.x;
      aP.t.y = m.y;
    }
    //println(aP.t + " " + hands[0].oscFinger[0].t);
    aP.run();
    countStrokes += aP.yellowTail.gestureArray.length;
  }
  //println("painters: " + painters.size() + "   strokes: " + countStrokes);
  if (painters.size()>paintersLimit) painters.remove(0);
  //endSyphon();
  canvas.endDraw();
  
  filter.bloom.apply(canvas);
  
  image(canvas, 0, 0);
}

void addPainter() {
  color c;
  if (random(1)<0.5) {
    c = c1;
  } else {
    c = c2;
  }
  AutoPaint aP;
  if (mode.equals("Leap")) {
   aP = new AutoPaint(c,new PVector(hands[0].oscFinger[0].t.x,hands[0].oscFinger[0].t.y));
  } else {
   aP = new AutoPaint(c,new PVector(m.x,m.y));
  }
  aP.ease = random(500);
  if (mode.equals("Leap")) {
    aP.spread = random(hands[0].oscFinger[0].t.z);
  } else {
    aP.spread = random((0.5 * sW) - m.x);
  }
  painters.add(aP);
}

//Tween movement.  start, end, ease (more = slower).
float tween(float v1, float v2, float e) {
  v1 += (v2-v1)/e;
  return v1;
}

PVector tween3D(PVector v1, PVector v2, PVector e) {
  v1.x += (v2.x-v1.x)/e.x;
  v1.y += (v2.y-v1.y)/e.y;
  v1.z += (v2.z-v1.z)/e.z;
  return v1;
}

//3D Hit Detect.  Assumes center.  xyz, whd of object 1, xyz, whd of object 2.
boolean hitDetect3D(PVector p1, PVector s1, PVector p2, PVector s2) {
  s1.x /= 2;
  s1.y /= 2;
  s1.z /= 2;
  s2.x /= 2;
  s2.y /= 2; 
  s2.z /= 2; 
  if (  p1.x + s1.x >= p2.x - s2.x && 
    p1.x - s1.x <= p2.x + s2.x && 
    p1.y + s1.y >= p2.y - s2.y && 
    p1.y - s1.y <= p2.y + s2.y &&
    p1.z + s1.z >= p2.z - s2.z && 
    p1.z - s1.z <= p2.z + s2.z
    ) {
    return true;
  } else {
    return false;
  }
}
