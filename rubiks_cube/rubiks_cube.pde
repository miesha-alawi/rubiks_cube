import peasy.*;

PeasyCam cam;

int dim = 3; //dimensions of cube
float scale = 50; //cube scale
float offset = (dim-1)*scale*0.5;
Cubie[] cube = new Cubie[dim*dim*dim];
Move[] allMoves = new Move[]{ //list of all moves
  new Move(0, 1, 0, 1),
  new Move(0, 1, 0, -1),
  new Move(0, -1, 0, 1),
  new Move(0, -1, 0, -1),
  new Move(1, 0, 0, 1),
  new Move(1, 0, 0, -1),
  new Move(-1, 0, 0, 1),
  new Move(-1, 0, 0, -1),
  new Move(0, 0, 1, 1),
  new Move(0, 0, 1, -1),
  new Move(0, 0, -1, 1),
  new Move(0, 0, -1, -1)
};
int counter = 0;
boolean shuffle = false;
Move currentMove;
ArrayList<Move> sequence = new ArrayList<Move>();
float speed = 0.1;

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 400);
  currentMove = allMoves[0];
  int index = 0;
  //triple nested loop to create rubix cube
  for (int x = -1; x <= 1; x++) {
    for (int y = -1; y <= 1; y++) {
      for (int z = -1; z <= 1; z++) {
        PMatrix3D matrix = new PMatrix3D();
        matrix.translate(x, y, z);
        cube[index] = new Cubie(matrix, x, y, z);
        index++;
      }
    }
  }
}

//function to create a random sequence of moves and apply them
void shuffle() {
  for (int i = 0; i < 50; i++) {
    int r = int(random(allMoves.length));
    Move m = allMoves[r];
    sequence.add(m);
  }
}

void draw() {
  background(51);
  scale(50);
  currentMove.update();

  if (shuffle) {
    if (currentMove.finished) {
      if (counter < sequence.size()-1) {
        counter++;
        currentMove = sequence.get(counter);
        currentMove.start();
      }
    }
  }
  
  //draws and rotates the cube accordingly
  for (int i = 0; i < cube.length; i++) {
    push();
    Cubie c = cube[i];
    if (abs(c.z) > 0 && c.z == currentMove.z) {
      rotateZ(currentMove.angle);
    } else if (abs(c.x) > 0 && c.x == currentMove.x) {
      rotateX(currentMove.angle);
    } else if (abs(c.y) > 0 && c.y == currentMove.y) {
      rotateY(-currentMove.angle);
    }
    c.draw();
    pop();
  }
}
