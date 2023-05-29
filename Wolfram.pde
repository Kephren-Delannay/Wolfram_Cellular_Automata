final int CELLSIZE = 10;
int numCells;
int[] cells;
int generation = 0;
CA automaton;
int maxIteration;

void setup(){
  size(1200, 600);
  background(0);
  numCells = width/CELLSIZE;
  cells = new int[numCells];

  // we choose this arbitrarily
  cells[numCells/2] = 1;
  
  // arbitrary ruleset
  int[] r = {0, 1, 1, 1, 1, 0, 0, 0};
  automaton = new CA(r);
  
  maxIteration = height / CELLSIZE;
}

void draw(){
   drawGeneration();
   cells = automaton.nextGeneration(cells);
   generation++;
   
   //reset auto
   //if(generation >= maxIteration){
   //  reset(); 
   //}
}

void drawGeneration(){
  fill(255);
  for(int i = 0; i<numCells; i++){
    if(cells[i] == 1){
      rect(i*CELLSIZE, generation*CELLSIZE, CELLSIZE, CELLSIZE);  
    }
  }
}

int[] randomRuleset(){
  int[] r = new int[8];
  //int[] r = {0, 1, 0, 1, 1, 0, 1, 1};
  for(int i = 0; i<8; i++){
    if(random(0, 100) >= 50)
    {
       r[i] = 1; 
    }else{
       r[i] = 0; 
    }
  }
  return r;
}

void mousePressed(){
 reset(); 
}

void reset(){
 background(0);
 int[] ruleset = randomRuleset();
 automaton.ruleset_ = ruleset;
 generation = 0;
}
