// minesweeper
// this is a test

//globals
int[][] board;
int[] neighbours;
int cols, rows;
float cellWidth, cellHeight;
int mineY;
int mineX;
int mineCounter = 0;


void setup(){
 size (600, 600);
 background(255);
 cols = 10;
 rows = 10;
 cellWidth = width/cols;
 cellHeight = height/rows;
 board = new int[cols][rows];
 //neighbours = new int[8];
 placeMines();
 findNeighbouringMines();

  
}



void draw(){

  drawBoard();
 //placeMines();


  
}


void drawBoard(){ 
  strokeWeight(6);
  for (int x=0; x<cols; x++) {
    for (int y=0; y<rows; y++) {
      if (board[x][y] != 7){
    fill(255);
    rect(x*cellWidth, y*cellHeight, cellWidth, cellHeight);
      }
      if(board[x][y] == 1){
        fill(255, 0, 0);
        rect(x*cellWidth, y*cellHeight, cellWidth, cellHeight);
        
      }
      
      if(board[x][y] == 2){
        fill(0, 0, 255);
        rect(x*cellWidth, y*cellHeight, cellWidth, cellHeight);
        
      }
      
      if(board[x][y] == 3){
        fill(255, 0, 255);
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
      
      mineCounter = 0;
      
      if (board[x][y] != 7){
        
        if (x == 0 && y == 0) {//top left corner
          if (board[x+1][y] == 7) mineCounter++;
          if (board[x][y+1] == 7) mineCounter++;
          if (board[x+1][y+1] == 7) mineCounter++;
        }
        
        else if(x == cols && y == 0) {//top right corner
          if (board[x-1][y] == 7) mineCounter++;
          if (board[x-1][y+1] == 7) mineCounter++;
          if (board[x][y+1] == 7) mineCounter++;
        }
        
        else if(x == cols && y == rows){//bottom right corner
          if (board[x-1][y-1] == 7) mineCounter++;
          if (board[x-1][y] == 7) mineCounter++;
          if (board[x][y-1] == 7) mineCounter++;
        }
        
        else if(x == 0 && y == rows){//bottom left corner
          if (board[x][y-1] == 7) mineCounter++;
          if (board[x+1][y-1] == 7) mineCounter++;
          if (board[x+1][y] == 7) mineCounter++; 
        }
        
        else if(x == 0 && (y > 0 && y < rows)){//left side
          if (board[x][y-1] == 7) mineCounter++;
          if (board[x+1][y-1] == 7) mineCounter++;
          if (board[x+1][y] == 7) mineCounter++;
          if (board[x][y+1] == 7) mineCounter++;
          if (board[x+1][y+1] == 7) mineCounter++;       
        }
        
        else if(y == 0 && (x > 0 && x < cols)){//top side
          if (board[x-1][y] == 7) mineCounter++;
          if (board[x+1][y] == 7) mineCounter++;
          if (board[x-1][y+1] == 7) mineCounter++;
          if (board[x][y+1] == 7) mineCounter++;
          if (board[x+1][y+1] == 7) mineCounter++;
        }
        
        else if(x == cols && (y > 0 && y < rows)){//right side
          if (board[x][y-1] == 7) mineCounter++;
          if (board[x-1][y-1] == 7) mineCounter++;
          if (board[x-1][y] == 7) mineCounter++;
          if (board[x-1][y+1] == 7) mineCounter++;
          if (board[x][y+1] == 7) mineCounter++;        
        }
          
        else if(y == rows && (x > 0 && x < cols)){//bottom side
          if (board[x][y-1] == 7) mineCounter++;
          if (board[x-1][y-1] == 7) mineCounter++;
          if (board[x+1][y-1] == 7) mineCounter++;
          if (board[x-1][y] == 7) mineCounter++;
          if (board[x+1][y] == 7) mineCounter++;
        
        
        }
        
        
        
        
        //else {
        //  if (board[x][y-1] == 7) mineCounter++;
        //  if (board[x-1][y-1] == 7) mineCounter++;
        //  if (board[x+1][y-1] == 7) mineCounter++;
        //  if (board[x-1][y] == 7) mineCounter++;
        //  if (board[x+1][y] == 7) mineCounter++;
        //  if (board[x-1][y+1] == 7) mineCounter++;
        //  if (board[x][y+1] == 7) mineCounter++;
        //  if (board[x+1][y+1] == 7) mineCounter++;
        //}
        
        board[x][y] = mineCounter;
        
        println(mineCounter);
        
        
    
        
        
        
        

      }
    }
  }
  
        
  
  
  
  
}