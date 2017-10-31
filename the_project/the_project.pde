// minesweeper


//globals
int[] [] board;
float cols, rows;
float cellWidth, cellHeight;
int bombY;
int bombX;

void setup(){
 size (800, 800);
 background(255);
 cols = 10;
 rows = 10;
 cellWidth = width/cols;
 cellHeight = height/rows;
  
}

void draw(){
 drawBoard();
 placeBombs();
  
}


void drawBoard(){ 
  strokeWeight(6);
  for (int x=0; x<(width); x += cellWidth) {
    for (int y=0; y<(height); y += cellHeight) {
    rect(x, y, cellWidth, cellHeight);
  }
  }
}
  
void placeBombs(){
  for(int n=0; n < 10; n++ ){
    bombY = int(random(0 , (cols-1)));
    bombX = int(random(0 , (cols-1)));
    
    
  }
  
  
}