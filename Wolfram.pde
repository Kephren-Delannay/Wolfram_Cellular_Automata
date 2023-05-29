final int CELLSIZE = 10;
int numCells;
int[] cells;
int generation = 0;
CA automaton;

void setup(){
  size(600, 300);
  background(0);
  numCells = width/CELLSIZE;
  cells = new int[numCells];

  // we choose this arbitrarily
  cells[numCells/2] = 1;
  
  // arbitrary ruleset
  int[] r = {0, 1, 1, 1, 1, 0, 0, 0};
  automaton = new CA(r);
}

void draw(){
   drawGeneration();
   cells = automaton.nextGeneration(cells);
   generation++;
}

void drawGeneration(){
  fill(255);
  for(int i = 0; i<numCells; i++){
    if(cells[i] == 1){
      rect(i*CELLSIZE, generation*CELLSIZE, CELLSIZE, CELLSIZE);  
    }
  }
}
