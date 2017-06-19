
void mousePressed(){
  if (painters.size() < 1) addPainter();
  AutoPaint aP = painters.get(painters.size()-1);
  aP.p = new PVector(mouseX, mouseY, 0);
  aP.t = new PVector(mouseX, mouseY, 0);
}

void mouseMoved() {
  m = new PVector(mouseX, mouseY, 0);
}

void keyPressed() {
  for(int i=0;i<painters.size();i++){
    AutoPaint aP = painters.get(i);
    aP.yellowTail.clearGestures();
  }
}


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/*
void mousePressed() {
  println("press");
  yellowTail.triggerStart(mouseX, mouseY);
}

void mouseDragged() {
  println("drag");
  yellowTail.triggerDrag(mouseX, mouseY);
}

void mouseMoved (Event evt, float x, float y) {
  println("move");
  yellowTail.triggerMove(evt,x,y);
}

void mouseReleased() {
  println("release");
  yellowTail.triggerEnd();
}

void keyPressed() {
  switch (key){
    case '+':
    case '=':
    if (yellowTail.currentGestureID >= 0) {
      float th = yellowTail.gestureArray[yellowTail.currentGestureID].thickness;
      yellowTail.gestureArray[yellowTail.currentGestureID].thickness = Math.min(96, th+1);
      yellowTail.gestureArray[yellowTail.currentGestureID].compile();
    }
    break;
    case '-':
    if (yellowTail.currentGestureID >= 0) {
      float th = yellowTail.gestureArray[yellowTail.currentGestureID].thickness;
      yellowTail.gestureArray[yellowTail.currentGestureID].thickness = Math.max(2, th-1);
      yellowTail.gestureArray[yellowTail.currentGestureID].compile();
    }
    break;

    case ' ': yellowTail.clearGestures();
    break;
  }

}
*/
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~