// minesweeper
// this is a test

//globals
int[][] board;
int[] cellColour;
int cols, rows;
float cellWidth, cellHeight;
int mineY;
int mineX;
int mineCounter = 0;
int numberOfMines = 15;
int numberOfMinesPlaced = 0;


void setup(){
 size (600, 600);
 background(255);
 cols = 10;
 rows = 10;
 cellWidth = width/cols;
 cellHeight = height/rows;
 board = new int[cols][rows];
 cellColour = new int[9];
 placeMines();
 findNeighbouringMines();
 cellColour[0] = (color(255)), (color(0)), (color(0)));

  
}



void draw(){

  drawBoard();
 //placeMines();


  
}


void drawBoard(){ 
  strokeWeight(6);
  for (int x=0; x<cols; x++) {
    for (int y=0; y<rows; y++) {
      if (board[x][y] != 9 &&  board[x][y] != 0){
    fill(255);
    textAlign(CENTER, CENTER);
    rect(x*cellWidth, y*cellHeight, cellWidth, cellHeight);
      }
        
        fill(colour[board[x][y]]);
        rect(x*cellWidth, y*cellHeight, cellWidth, cellHeight);
        fill(0);
        textSize(32);
        text((board[x][y]), (x*cellWidth + (cellWidth/2)), (y*cellHeight + (cellHeight/2)));
        
      
      
      //if(board[x][y] == 1){
      //  fill(255, 0, 0);
      //  rect(x*cellWidth, y*cellHeight, cellWidth, cellHeight);
      //  fill(0);
      //  textSize(32);
      //  text((board[x][y]), (x*cellWidth + (cellWidth/2)), (y*cellHeight + (cellHeight/2)));
        
      //}
      
      //if(board[x][y] == 2){
      //  fill(0, 0, 255);
      //  rect(x*cellWidth, y*cellHeight, cellWidth, cellHeight);
      //  fill(0);
      //  textSize(32);
      //  text('2', (x*cellWidth + (cellWidth/2)), (y*cellHeight + (cellHeight/2)));
        
      //}
      
      //if(board[x][y] == 3){
      //  fill(255, 0, 255);
      //  rect(x*cellWidth, y*cellHeight, cellWidth, cellHeight);
      //  fill(0);
      //  textSize(32);
      //  text('3', (x*cellWidth + (cellWidth/2)), (y*cellHeight + (cellHeight/2)));    
        
      //}  
      
      //if(board[x][y] == 4){
      //  fill(0, 255, 255);
      //  rect(x*cellWidth, y*cellHeight, cellWidth, cellHeight);
      //  fill(0);
      //  textSize(32);
      //  text('4', (x*cellWidth + (cellWidth/2)), (y*cellHeight + (cellHeight/2)));
        
      //}
      
      //if(board[x][y] == 5){
      //  fill(165, 200, 100);
      //  rect(x*cellWidth, y*cellHeight, cellWidth, cellHeight);
      //  fill(0);
      //  textSize(32);
      //  text('5', (x*cellWidth + (cellWidth/2)), (y*cellHeight + (cellHeight/2)));
        
      //}
      
      //if(board[x][y] == 6){
      //  fill(150, 50, 190);
      //  rect(x*cellWidth, y*cellHeight, cellWidth, cellHeight);
      //  fill(0);
      //  textSize(32);
      //  text('6', (x*cellWidth + (cellWidth/2)), (y*cellHeight + (cellHeight/2)));    
        
      //}  
      
      //if(board[x][y] == 7){
      //  fill(0, 200, 100);
      //  rect(x*cellWidth, y*cellHeight, cellWidth, cellHeight);
      //  fill(0);
      //  textSize(32);
      //  text('7', (x*cellWidth + (cellWidth/2)), (y*cellHeight + (cellHeight/2)));
        
      //}
      
      //if(board[x][y] == 8){
      //  fill(100, 100, 200);
      //  rect(x*cellWidth, y*cellHeight, cellWidth, cellHeight);
      //  fill(0);
      //  textSize(32);
      //  text('8', (x*cellWidth + (cellWidth/2)), (y*cellHeight + (cellHeight/2)));
        
      //}
      
  }
  }
  
  drawMines();
}
  
void placeMines(){
  while(numberOfMinesPlaced < numberOfMines) {
    int mineX = int(random(cols));
    int mineY = int(random(rows));
    
    if(board[mineX][mineY] != 9){
      board[mineX][mineY] = 9;
      numberOfMinesPlaced ++;
      
      
      
    println (mineX, mineY);
    }
  }
} 


void drawMines(){
  for (int x=0; x<cols; x++) {
    for (int y=0; y<rows; y++) {
      if (board[x][y] == 9){
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
      
      if (board[x][y] != 9){
        
        if (x == 0 && y == 0) {//top left corner
          if (board[x+1][y] == 9) mineCounter++;
          if (board[x][y+1] == 9) mineCounter++;
          if (board[x+1][y+1] == 9) mineCounter++;
        }
        
        else if(x == cols-1 && y == 0) {//top right corner
          if (board[x-1][y] == 9) mineCounter++;
          if (board[x-1][y+1] == 9) mineCounter++;
          if (board[x][y+1] == 9) mineCounter++;
        }
        
        else if(x == cols-1 && y == rows-1){//bottom right corner
          if (board[x-1][y-1] == 9) mineCounter++;
          if (board[x-1][y] == 9) mineCounter++;
          if (board[x][y-1] == 9) mineCounter++;
        }
        
        else if(x == 0 && y == rows-1){//bottom left corner
          if (board[x][y-1] == 9) mineCounter++;
          if (board[x+1][y-1] == 9) mineCounter++;
          if (board[x+1][y] == 9) mineCounter++; 
        }
        
        else if(x == 0 && (y > 0 && y < rows-1)){//left side
          if (board[x][y-1] == 9) mineCounter++;
          if (board[x+1][y-1] == 9) mineCounter++;
          if (board[x+1][y] == 9) mineCounter++;
          if (board[x][y+1] == 9) mineCounter++;
          if (board[x+1][y+1] == 9) mineCounter++;       
        }
        
        else if(y == 0 && (x > 0 && x < cols-1)){//top side
          if (board[x-1][y] == 9) mineCounter++;
          if (board[x+1][y] == 9) mineCounter++;
          if (board[x-1][y+1] == 9) mineCounter++;
          if (board[x][y+1] == 9) mineCounter++;
          if (board[x+1][y+1] == 9) mineCounter++;
        }
        
        else if(x == cols-1 && (y > 0 && y < rows-1)){//right side
          if (board[x][y-1] == 9) mineCounter++;
          if (board[x-1][y-1] == 9) mineCounter++;
          if (board[x-1][y] == 9) mineCounter++;
          if (board[x-1][y+1] == 9) mineCounter++;
          if (board[x][y+1] == 9) mineCounter++;        
        }
          
        else if(y == rows-1 && (x > 0 && x < cols-1)){//bottom side
          if (board[x][y-1] == 9) mineCounter++;
          if (board[x-1][y-1] == 9) mineCounter++;
          if (board[x+1][y-1] == 9) mineCounter++;
          if (board[x-1][y] == 9) mineCounter++;
          if (board[x+1][y] == 9) mineCounter++;
        }
        
        else {
          if (board[x][y-1] == 9) mineCounter++;
          if (board[x-1][y-1] == 9) mineCounter++;
          if (board[x+1][y-1] == 9) mineCounter++;
          if (board[x-1][y] == 9) mineCounter++;
          if (board[x+1][y] == 9) mineCounter++;
          if (board[x-1][y+1] == 9) mineCounter++;
          if (board[x][y+1] == 9) mineCounter++;
          if (board[x+1][y+1] == 9) mineCounter++;
        }
        
        board[x][y] = mineCounter;
        
        println(mineCounter);
      }
    }
  }
   
}