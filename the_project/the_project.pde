// minesweeper
// this is a test

//globals
int[][] board;
int[] neighbours;
int cols, rows;
float cellWidth, cellHeight;
int mineY;
int mineX;


void setup(){
 size (600, 600);
 background(255);
 cols = 10;
 rows = 10;
 cellWidth = width/cols;
 cellHeight = height/rows;
 board = new int[cols][rows];
 neighbours = new int[8];
 placeMines();

  
}



void draw(){
 drawBoard();
 //placeMines();
 findNeighbouringMines();

  
}


void drawBoard(){ 
  strokeWeight(6);
  for (int x=0; x<cols; x++) {
    for (int y=0; y<rows; y++) {
      if (board[x][y] != 7){
    fill(255);
    rect(x*cellWidth, y*cellHeight, cellWidth, cellHeight);
      }
  }
  }
  
  drawMines();
}
  
void placeMines(){
  for(int n=0; n < 10; n++ ){
    int mineX = int(random(cols));
    int mineY = int(random(rows));
    board[mineX][mineY] = 7;
    println (mineX, mineY);
  }
} 


void drawMines(){
  for (int x=0; x<cols; x++) {
    for (int y=0; y<rows; y++) {
      if (board[x][y] == 7){
        fill(0, 255, 0);
        rect(x*cellWidth, y*cellHeight, cellWidth, cellHeight);
        
      }
    }
  } 
}

void findNeighbouringMines(){
  for (int x=0; x<cols; x++) {
    for (int y=0; y<rows; y++) {
      if (board[x][y] != 7){
        
        
        
        

      }
    }
  }
  
        
  
  
  
  
}