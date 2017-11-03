// minesweeper
// this is a test

//globals
int[][] board;
color[] cellColour = {color(255, 0, 0), color(255, 0, 100), color(255, 150, 100), color(150, 0, 100), color(100, 200, 100),
                      color(50, 0, 50), color(15, 60, 170), color(255, 0, 255), color(0) };
int cols, rows;
float cellWidth, cellHeight;
int mineY;
int mineX;
int mineCounter = 0;
int numberOfMines = 15;
int numberOfMinesPlaced = 0;
int state;
int x;
int y;
int neighbouringZeros = 0;

void setup(){
 size (600, 600);
 background(255);
 cols = 10;
 rows = 10;
 cellWidth = width/cols;
 cellHeight = height/rows;
 board = new int[cols][rows];
 placeMines();
 findNeighbouringMines();
 drawBoard();
 
 

  
}



void draw(){
  displayClickedCell();

 //placeMines();
 whatIsTheState();




  
}

void whatIsTheState() {
  if (state == 2){
    textSize(32);
    textAlign(CENTER, CENTER);
    fill(255, 0, 0);
    rect(0, 0, width, height);
    fill(0);
    text("YOU PROBABLY DIED", width/2, height/2);
  }
}


void drawBoard(){ 
  strokeWeight(6);
  for (int x=0; x<cols; x++) {
    for (int y=0; y<rows; y++) {
      fill(150, 150, 150);
      rect(x*cellWidth, y*cellHeight, cellWidth, cellHeight);
      
      
      //if (board[x][y] != 9 &&  board[x][y] != 0  && board[x][y] != 15){
      //  fill(255);
      //  textAlign(CENTER, CENTER);
      //  rect(x*cellWidth, y*cellHeight, cellWidth, cellHeight);
        
        //fill(cellColour[board[x][y]]);
        //rect(x*cellWidth, y*cellHeight, cellWidth, cellHeight);
        //fill(0);
        //textSize(32);
        //text((board[x][y]), (x*cellWidth + (cellWidth/2)), (y*cellHeight + (cellHeight/2)));
      //}
    
      //if (board[x][y] == 15){
      //  fill(0);
      //  text("FLAG", (x*cellWidth + (cellWidth/2)), (y*cellHeight + (cellHeight/2)));
      //}
        
    
    
     

      
 
  }
  }
  
  //drawMines();
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



//void mousePressed () {
//  int xCord = int(mouseX/cellWidth);
//  int yCord = int(mouseY/cellHeight);
  
//  if (mouseButton == LEFT){
    
//    displayClickedCell();
    
//    if (board[xCord][yCord] == 9){
//      state = 2;
//    }  
 
//  if (mouseButton == RIGHT){
//    board[xCord][yCord] = 15; 
//    fill(0);
//    text("FLAG", (xCord*cellWidth + (cellWidth/2)), (yCord*cellHeight + (cellHeight/2)));
    
    
//  }
  
    
//  }
  
  
  //board[xCord][yCord] = 8;
//}
void youClickedOnAZero(){
  int xCord = int(mouseX/cellWidth);
  int yCord = int(mouseY/cellHeight);
  

  
  
  if (x == 0 && y == 0) {//top left corner
  if (board[x+1][y] == 9) neighbouringZeros++;
  if (board[x][y+1] == 9) neighbouringZeros++;
  if (board[x+1][y+1] == 9) neighbouringZeros++;
  }
  
  else if(x == cols-1 && y == 0) {//top right corner
    if (board[x-1][y] == 9) neighbouringZeros++;
    if (board[x-1][y+1] == 9) neighbouringZeros++;
    if (board[x][y+1] == 9) neighbouringZeros++;
  }
  
  else if(x == cols-1 && y == rows-1){//bottom right corner
    if (board[x-1][y-1] == 9) neighbouringZeros++;
    if (board[x-1][y] == 9) neighbouringZeros++;
    if (board[x][y-1] == 9) neighbouringZeros++;
  }
  
  else if(x == 0 && y == rows-1){//bottom left corner
    if (board[x][y-1] == 9) neighbouringZeros++;
    if (board[x+1][y-1] == 9) neighbouringZeros++;
    if (board[x+1][y] == 9) neighbouringZeros++; 
  }
  
  else if(x == 0 && (y > 0 && y < rows-1)){//left side
    if (board[x][y-1] == 9) neighbouringZeros++;
    if (board[x+1][y-1] == 9) neighbouringZeros++;
    if (board[x+1][y] == 9) neighbouringZeros++;
    if (board[x][y+1] == 9) neighbouringZeros++;
    if (board[x+1][y+1] == 9) neighbouringZeros++;       
  }
  
  else if(y == 0 && (x > 0 && x < cols-1)){//top side
    if (board[x-1][y] == 9) neighbouringZeros++;
    if (board[x+1][y] == 9) neighbouringZeros++;
    if (board[x-1][y+1] == 9) neighbouringZeros++;
    if (board[x][y+1] == 9) neighbouringZeros++;
    if (board[x+1][y+1] == 9) neighbouringZeros++;
  }
  
  else if(x == cols-1 && (y > 0 && y < rows-1)){//right side
    if (board[x][y-1] == 9) neighbouringZeros++;
    if (board[x-1][y-1] == 9) neighbouringZeros++;
    if (board[x-1][y] == 9) neighbouringZeros++;
    if (board[x-1][y+1] == 9) neighbouringZeros++;
    if (board[x][y+1] == 9) neighbouringZeros++;        
  }
    
  else if(y == rows-1 && (x > 0 && x < cols-1)){//bottom side
    if (board[x][y-1] == 9) neighbouringZeros++;
    if (board[x-1][y-1] == 9) neighbouringZeros++;
    if (board[x+1][y-1] == 9) neighbouringZeros++;
    if (board[x-1][y] == 9) neighbouringZeros++;
    if (board[x+1][y] == 9) neighbouringZeros++;
  }
  
  else {
    if (board[x][y-1] == 9) neighbouringZeros++;
    if (board[x-1][y-1] == 9) neighbouringZeros++;
    if (board[x+1][y-1] == 9) neighbouringZeros++;
    if (board[x-1][y] == 9) neighbouringZeros++;
    if (board[x+1][y] == 9) neighbouringZeros++;
    if (board[x-1][y+1] == 9) neighbouringZeros++;
    if (board[x][y+1] == 9) neighbouringZeros++;
    if (board[x+1][y+1] == 9) neighbouringZeros++;
  }
  
  
  
  
}

void displayClickedCell() {
  int xCord = int(mouseX/cellWidth);
  int yCord = int(mouseY/cellHeight);
  if (mouseButton == LEFT){
    x = xCord;
    y = yCord;
  
    if (board[x][y] == 9){
      state = 2;
    }
     
     
    if (board[x][y] == 0){
      board[x][y] = 20;
      youClickedOnAZero();
    }
    else {
      fill(cellColour[board[x][y]]);
      rect(x*cellWidth, y*cellHeight, cellWidth, cellHeight);
      fill(0);
      textSize(32);
      text((board[x][y]), (x*cellWidth + (cellWidth/2)), (y*cellHeight + (cellHeight/2)));
      
      
      
    }
      
      
      
 
  

    
    
  }
  
}