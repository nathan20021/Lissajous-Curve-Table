ArrayList<roundCircle> row = new ArrayList<roundCircle>();
ArrayList<roundCircle> col = new ArrayList<roundCircle>();

roundCircle circle1;
int num = 10;
int cr = 25;
float sw = 0.5;

void setup(){
  size(810, 810);
  //fullScreen();
  smooth(4);
  background(0,0,0);
  float gapX = ((width-5)-((num+1)*2*cr)) / num;
  float _x = 5 + (3*cr) + gapX;
  float _y = cr+5;
  for(int i = 1; i <= num; i++){
   col.add(new roundCircle(_x,_y,cr,0.01*i));
   _x += (2*cr)+ gapX;
  }

  float gapY = ((height-5)-((num+1)*2*cr)) / num;
  _x = 5+cr;
  _y = 5+ (cr*3) + gapY;
  for(int i = 1; i <= num; i++){
   row.add(new roundCircle(_x,_y,cr,0.01*i));
   _y += (2*cr)+ gapY;
  }  
}

void draw(){
  //background(0,0,0);
  fill(0);
  noStroke();
  rect(0,0,width, 15+(cr*2));
  rect(0,0, 15+(cr*2), height);
  for(int i = 0; i < col.size(); i++){
    roundCircle thing = col.get(i);
    thing.show();
    //strokeWeight(1);
    //line(thing.px, thing.py, thing.px ,height);
  }
  for(int i = 0; i < row.size(); i++){
    roundCircle thing = row.get(i);
    thing.show();
    //strokeWeight(1);
    //line(thing.px, thing.py, width, thing.py);
  }
  for(int i = 0; i < col.size(); i++){
   for(int j = 0; j < row.size(); j++){
     roundCircle thingR = row.get(i);
     roundCircle thingC = col.get(j);
     stroke(255);
     strokeWeight(sw);
     //noFill();
     beginShape();
     vertex(thingC.px, thingR.py);
     endShape(CLOSE);
   }
  }
}

class roundCircle{
  float x; float y;
  float px; float py;
  float anguVel; float angle;
  float r;
  roundCircle(float _x,float _y,float _r , float _speed){
    x = _x;
    y = _y;
    r = _r;
    px = x;
    py = y - r;
    angle = 0;
    anguVel = _speed;
  }
  
  void show(){
    fill(0);
    stroke(221);
    strokeWeight(1);
    ellipseMode(RADIUS);
    circle(x, y, r);
    noFill();
    strokeWeight(10);
    point(px, py);
    angle += anguVel;
    px = x+ (sin(angle) *r);
    py = y+ (cos(angle) *r);
  }
}
