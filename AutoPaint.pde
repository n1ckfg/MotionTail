class AutoPaint extends YellowTail{
  
  int counter=0;
  int counterMax=100;
  PVector p = new PVector(0,0);
  PVector t = new PVector(0,0);
  float ease = 600;
  float spread = 15;
  YellowTail yellowTail;

  AutoPaint(color _c){
    super(_c);
    yellowTail = new YellowTail(_c);
    init();
  }

  void init(){
    counter=0;
    p = new PVector(random(width),random(height));
    t = new PVector(random(width),random(height));
    yellowTail.triggerStart(p.x,p.y);
  }

  void update(){
    yellowTail.update();
    if(counter<counterMax){
      p.x = tween(p.x,t.x,ease) + random(spread) - random(spread);
      p.y = tween(p.y,t.y,ease) + random(spread) - random(spread);
      yellowTail.triggerDrag(p.x,p.y);
      counter++;
    }else{
      yellowTail.triggerEnd();
      init();
    }
  }

  void draw(){
    yellowTail.draw();
    //
  }

  void run(){
    update();
    draw();
  }
  
  float tween(float v1, float v2, float e) {
    v1 += (v2-v1)/e;
    return v1;
  }

}
