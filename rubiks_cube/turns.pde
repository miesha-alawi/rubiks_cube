
void turnZ(int index, int dir) {
  for(int i = 0; i < cube.length; i++) {
    Cubie qb = cube[i];
    if(qb.z == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);
      matrix.translate(qb.x, qb.y);
      qb.turnFacesZ(dir);
      qb.update(round(matrix.m02), round(matrix.m12), round(qb.z));
    }
  }
}

void turnY(int index, int dir) {
  for(int i = 0; i < cube.length; i++) {
    Cubie qb = cube[i];
    if(qb.y == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);
      matrix.translate(qb.x, qb.z);
      qb.turnFacesY(dir);
      qb.update(round(matrix.m02), qb.y, round(matrix.m12));
    }
  }
}

void turnX(int index, int dir) {
  for(int i = 0; i < cube.length; i++) {
    Cubie qb = cube[i];
    if(qb.x == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);
      matrix.translate(qb.y, qb.z);
      qb.turnFacesX(dir);
      qb.update(qb.x, round(matrix.m02),round(matrix.m12));
    }
  }
}
