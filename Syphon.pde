String syphonServerName = "Simple Server";
PGraphics canvas;
boolean localEcho = true;

/*
// MAC
import codeanticode.syphon.*;

SyphonServer server;

void initSyphon(){
  server = new SyphonServer(this, syphonServerName);
  canvas = createGraphics(sW,sH,P3D);
}

void beginSyphon(){
  canvas.beginDraw(); //1.  begin draw loop
}

void endSyphon(){
  canvas.endDraw(); //2.  end draw loop
  server.sendImage(canvas); //3.  canvas goes to Syphon server
  if(localEcho) image(canvas, 0, 0);  //4.  canvas is displayed in app
}
*/

// ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

// WIN
import spout.*;

Spout server;

void initSyphon() {
  server = new Spout(this);
  server.createSender(syphonServerName);
  canvas = createGraphics(sW,sH,P3D);
}

void beginSyphon() {
  canvas.beginDraw();
}

void endSyphon() {
  canvas.endDraw();
  image(canvas, 0, 0);
  server.sendTexture();
}