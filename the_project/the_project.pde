// minesweeper


//globals
int[][] board;
int cols, rows;
float cellWidth, cellHeight;
int mineY;
int mineX;
int m;

void setup(){
 size (800, 800);
 background(255);
 cols = 10;
 rows = 10;
 cellWidth = width/cols;
 cellHeight = height/rows;
 placeMines();
 board = new int[cols][rows];
  
}



void draw(){
 drawBoard();
 //placeMines();

  
}


void drawBoard(){ 
  strokeWeight(6);
  for (int x=0; x<(width); x += cellWidth) {
    for (int y=0; y<(height); y += cellHeight) {
    rect(x, y, cellWidth, cellHeight);
  }
  }
}
  
void placeMines(){
  for(int n=0; n < 10; n++ ){
    mineY = int(random(0 , (cols)));
    mineX = int(random(0 , (cols)));
    board[mineX][mineY] = m;
    drawMines(mineX, mineY);
    
    

  }
       
} 




void drawMines(int mineX, int mineY){
  
  
  
  
  println(mineX, mineY);
  fill(255);

  
  
  
  
}