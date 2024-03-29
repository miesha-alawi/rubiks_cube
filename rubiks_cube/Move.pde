class Move {
  float angle = 0;
  int x,y,z,dir;
  boolean animating, finished;
  Move(int x, int y, int z, int dir) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.dir = dir;
    animating = false;
    finished = false;
  }
  
  void start() {
    animating = true;
    finished = false;
    this.angle = 0;
  }
  
  
  void update() {
    if(animating) {
      angle += dir * speed;
      if(abs(angle) > HALF_PI) {
        angle = 0;
        animating = false;
        if(abs(z) > 0) {
        turnZ(z,dir);
        } else if (abs(x) > 0) {
          turnX(x,dir);
        } else if (abs(y) > 0) {
          turnY(y,dir);
        }
        finished = true;
      }
      
    }
  }
}
