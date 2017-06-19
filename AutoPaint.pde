class AutoPaint extends YellowTail{
  
  int counter=0;
  int counterMax=100;
  PVector p = new PVector(0,0);
  PVector t = new PVector(0,0);
  float ease = 600;
  float spread = 15;
  YellowTail yellowTail;

  AutoPaint(color _c, PVector _t) {
    super(_c);
    yellowTail = new YellowTail(_c);
    init(_t);
  }

  AutoPaint(color _c) {
    super(_c);
    yellowTail = new YellowTail(_c);
    init();
  }

  AutoPaint(PVector _t) {
    super();
    yellowTail = new YellowTail();
    init(_t);
  }
  
  AutoPaint() {
    super();
    yellowTail = new YellowTail();
    init();
  }
  
  void init(PVector _t) {
    counter=0;
    t = _t;
    p = _t;
    yellowTail.triggerStart(p.x,p.y);
  }

  void init() {
    counter=0;
    yellowTail.triggerStart(p.x,p.y);
  }

  void update(){
    yellowTail.update();
    if (counter<counterMax) {
      p.x = tween(p.x,t.x,ease) + random(spread) - random(spread);
      p.y = tween(p.y,t.y,ease) + random(spread) - random(spread);
      yellowTail.triggerDrag(p.x,p.y);
      counter++;
    } else {
      yellowTail.triggerEnd();
      //TEMPORARY
      testTrigger = false;
      //init();
    }
  }

  void draw() {
    yellowTail.draw();
    //
  }

  void run() {
    update();
    draw();
  }
  
  float tween(float v1, float v2, float e) {
    v1 += (v2-v1)/e;
    return v1;
  }

}