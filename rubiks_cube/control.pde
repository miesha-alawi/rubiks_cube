void keyPressed() {
  if(key != ' ') {
    applyMove(key);
  }
  else{
    shuffle = true;
    shuffle();
    currentMove = sequence.get(counter);
    currentMove.start();
  }
}

void applyMove(char move) {
  switch(move) {
    case 'f':
    currentMove = allMoves[0];
    break;
    case 'F':
    currentMove = allMoves[1];
    break;
    case 'b':
    currentMove = allMoves[2];
    break;
    case 'B':
    currentMove = allMoves[3];
    break;
    case 'u':
    currentMove = allMoves[4];
    break;
    case 'U':
    currentMove = allMoves[5];
    break;
    case 'd':
    currentMove = allMoves[6];
    break;
    case 'D':
    currentMove = allMoves[7];
    break;
    case 'l':
    currentMove = allMoves[8];
    break;
    case 'L':
    currentMove = allMoves[9];
    break;
    case 'r':
    currentMove = allMoves[10];
    break;
    case 'R':
    currentMove = allMoves[11];
    break;
  }
  currentMove.start();
}
