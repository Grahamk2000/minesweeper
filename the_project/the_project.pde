// minesweeper
// this is a test

//globals
int[][] board;
color[] cellColour = {color(0, 0, 0), color(255, 0, 100), color(255, 150, 100), color(150, 0, 100), color(100, 200, 100),
                      color(50, 0, 50), color(15, 60, 170), color(255, 0, 255), color(0) };
int cols, rows;
float cellWidth, cellHeight;
int mineY;
int mineX;
int mineCounter = 0;
int numberOfMines = 40;
int numberOfMinesPlaced = 0;
int state;
int x;
int y;
int neighbouringZeros = 0;
boolean nextToAZero = false;

void setup(){
 size (700, 700);
 background(255);
 cols = 13;
 rows = 13;
 cellWidth = width/cols;
 cellHeight = height/rows;
 board = new int[cols][rows];
 placeMines();
 findNeighbouringMines();
 drawBoard();
 textAlign(CENTER, CENTER);
 

  
}



void draw(){
  if(board[x][y] == 20){

    fill(255);
    rect(x*cellWidth, y*cellHeight, cellWidth, cellHeight);
    fill(0);
    textSize(cellWidth/2);
    text('0', (x*cellWidth + (cellWidth/2)), (y*cellHeight + (cellHeight/2)));
  }
  
  displayClickedCell();


 whatIsTheState();




  
}

void whatIsTheState() {
  if (state == 2){
    textSize(32);

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



void youClickedOnAZero(){

  neighbouringZeros = 0;  
  for (int x=0; x<cols; x++) {
    for (int y=0; y<rows; y++) {

      
      if(board[x][y] == 20){
      

  
      
      if (x == 0 && y == 0) {//top left corner
        if (board[x+1][y] == 0){
          neighbouringZeros++;
          board[x+1][y] = 20;
        }
        if (board[x][y+1] == 0){
          neighbouringZeros++;
          board[x][y+1] = 20;
        }
        if (board[x+1][y+1] == 0){
          neighbouringZeros++;
          board[x+1][y+1] = 20;
        }     
    }
      
      else if(x == cols-1 && y == 0) {//top right corner
        if (board[x-1][y] == 0){
          neighbouringZeros++;
          board[x-1][y] = 20;
        }
        if (board[x-1][y+1] == 0){
          board[x-1][y+1] = 20;
          neighbouringZeros++;
        }
        if (board[x][y+1] == 0){
          neighbouringZeros++;
          board[x][y+1] = 20;
        }
      }
      
      else if(x == cols-1 && y == rows-1){//bottom right corner
        if (board[x-1][y-1] == 0){
          neighbouringZeros++;
          board[x-1][y-1] = 20;
        }
        if (board[x-1][y] == 0){
          neighbouringZeros++;
          board[x-1][y] = 20;
        }
        if (board[x][y-1] == 0){
          neighbouringZeros++;
          board[x][y-1] = 20;
        }
      }
      
      else if(x == 0 && y == rows-1){//bottom left corner
        if (board[x][y-1] == 0){
          neighbouringZeros++;
          board[x][y-1] = 20;
        }
        if (board[x+1][y-1] == 0){
          neighbouringZeros++;
          board[x+1][y-1] = 20;
        }
        if (board[x+1][y] == 0){
          neighbouringZeros++; 
          board[x+1][y] = 20;
        }
      }
      
      else if(x == 0 && (y > 0 && y < rows-1)){//left side
        if (board[x][y-1] == 0){
          neighbouringZeros++;
          board[x][y-1] = 20;
        }
        if (board[x+1][y-1] == 0){
          neighbouringZeros++;
          board[x+1][y-1] = 20;
        }
        if (board[x+1][y] == 0){
          neighbouringZeros++;
          board[x+1][y] = 20;
        }
        if (board[x][y+1] == 0){
          neighbouringZeros++;
          board[x][y+1] = 20;
        }
        if (board[x+1][y+1] == 0){
          neighbouringZeros++;
          board[x+1][y+1] = 20;
        }
      }
      
      else if(y == 0 && (x > 0 && x < cols-1)){//top side
        if (board[x-1][y] == 0){
          neighbouringZeros++;
          board[x-1][y] = 20;
        }
        if (board[x+1][y] == 0){
          neighbouringZeros++;
          board[x+1][y] = 20;
        }
        if (board[x-1][y+1] == 0){
          neighbouringZeros++;
          board[x-1][y+1] = 20;
        }
        if (board[x][y+1] == 0){
          neighbouringZeros++;
          board[x][y+1] = 20;
        }
        if (board[x+1][y+1] == 0){
          neighbouringZeros++;
          board[x+1][y+1] = 20;
        }
      }
      
      else if(x == cols-1 && (y > 0 && y < rows-1)){//right side
        if (board[x][y-1] == 0){
          neighbouringZeros++;
          board[x][y-1] = 20;
        }
        if (board[x-1][y-1] == 0){
          neighbouringZeros++;
          board[x-1][y-1] = 20;
        }
        if (board[x-1][y] == 0){
        neighbouringZeros++;
        board[x-1][y] = 20;
        }
        if (board[x-1][y+1] == 0){
          neighbouringZeros++;
          board[x-1][y+1] = 20;
        }
        if (board[x][y+1] == 0){
          neighbouringZeros++;  
          board[x][y+1] = 20;
        }
      }
        
      else if(y == rows-1 && (x > 0 && x < cols-1)){//bottom side
        if (board[x][y-1] == 0){
          neighbouringZeros++;
          board[x][y-1] = 20;
        }
        if (board[x-1][y-1] == 0){
          neighbouringZeros++;
          board[x-1][y-1] = 20;
        }
        if (board[x+1][y-1] == 0){
          neighbouringZeros++;
          board[x+1][y-1] = 20;
        }
        if (board[x-1][y] == 0){
          neighbouringZeros++;
          board[x-1][y] = 20;
        }
        if (board[x+1][y] == 0){
          neighbouringZeros++;
          board[x+1][y] = 20;
        }
      }
      
      else {
        if (board[x][y-1] == 0){
          neighbouringZeros++;
          board[x][y-1] = 20; }
        if (board[x-1][y-1] == 0){
          neighbouringZeros++;
          board[x-1][y-1] = 20; }
        if (board[x+1][y-1] == 0){
          neighbouringZeros++;
          board[x+1][y-1] = 20; }
        if (board[x-1][y] == 0){
          neighbouringZeros++;
          board[x-1][y] = 20; }
        if (board[x-1][y] == 0){
          neighbouringZeros++;
          board[x-1][y] = 20; }
        if (board[x-1][y+1] == 0){
          neighbouringZeros++;
          board[x-1][y+1] = 20; }
        if (board[x][y+1] == 0){
          neighbouringZeros++;
          board[x][y+1] = 20;}
        if (board[x+1][y+1] == 0){
          neighbouringZeros++;
          board[x+1][y+1] = 20; }
          
     displayZeros();   

      
  if (neighbouringZeros != 0){
        youClickedOnAZero();}
  if (neighbouringZeros == 0){
    displayCellsNextToZeros();}
    
  }
      }     
  }
  
    }
  
  
  
}
void displayZeros(){
  for (int x=0; x<cols; x++) {
    for (int y=0; y<rows; y++) {

      if(board[x][y] == 20){
        fill(255);
        rect(x*cellWidth, y*cellHeight, cellWidth, cellHeight);
        fill(0);
        textSize(cellWidth/2);
        text('0', (x*cellWidth + (cellWidth/2)), (y*cellHeight + (cellHeight/2)));}
    }
  }
  
}

void displayCellsNextToZeros(){
  for (int x=0; x<cols; x++) {
    for (int y=0; y<rows; y++) {
      nextToAZero = false;
      if (board[x][y] != 20 && board[x][y] != 9) {
        
        if (x == 0 && y == 0) {//top left corner
          if (board[x+1][y] == 20) {
            nextToAZero = true;}
          if (board[x][y+1] == 20){
            nextToAZero = true;}
          if (board[x+1][y+1] == 20){
            nextToAZero = true;}
        }
        
        else if(x == cols-1 && y == 0) {//top right corner
          if (board[x-1][y] == 20) {
            nextToAZero = true;}
          if (board[x-1][y+1] == 20) {
            nextToAZero = true;}
          if (board[x][y+1] == 20) {
            nextToAZero = true;}
        }
        
        else if(x == cols-1 && y == rows-1){//bottom right corner
          if (board[x-1][y-1] == 20) {
            nextToAZero = true;}
          if (board[x-1][y] == 20) {
            nextToAZero = true;}
          if (board[x][y-1] == 20) {
            nextToAZero = true;}
        }
        
        else if(x == 0 && y == rows-1){//bottom left corner
          if (board[x][y-1] == 20){
            nextToAZero = true;}
          if (board[x+1][y-1] == 20){
            nextToAZero = true;}
          if (board[x+1][y] == 20) {
            nextToAZero = true;}
        }
        
        else if(x == 0 && (y > 0 && y < rows-1)){//left side
          if (board[x][y-1] == 20) {
            nextToAZero = true;}
          if (board[x+1][y-1] == 20){
            nextToAZero = true;}
          if (board[x+1][y] == 20) {
            nextToAZero = true;}
          if (board[x][y+1] == 20) {
            nextToAZero = true;}
          if (board[x+1][y+1] == 20){
            nextToAZero = true;}
        }
        
        else if(y == 0 && (x > 0 && x < cols-1)){//top side
          if (board[x-1][y] == 20) {
            nextToAZero = true;}
          if (board[x+1][y] == 20) {
            nextToAZero = true;}
          if (board[x-1][y+1] == 20){
            nextToAZero = true;}
          if (board[x][y+1] == 20) {
            nextToAZero = true;}
          if (board[x+1][y+1] == 20){ 
            nextToAZero = true;}
        }
        
        else if(x == cols-1 && (y > 0 && y < rows-1)){//right side
          if (board[x][y-1] == 20) {
            nextToAZero = true;}
          if (board[x-1][y-1] == 20){
            nextToAZero = true;}
          if (board[x-1][y] == 20) {
            nextToAZero = true;}
          if (board[x-1][y+1] == 20) {
            nextToAZero = true;}
          if (board[x][y+1] == 20){
            nextToAZero = true;}
        }
          
        else if(y == rows-1 && (x > 0 && x < cols-1)){//bottom side
          if (board[x][y-1] == 20){
            nextToAZero = true;}
          if (board[x-1][y-1] == 20) {
            nextToAZero = true;}
          if (board[x+1][y-1] == 20) {
            nextToAZero = true;}
          if (board[x-1][y] == 20) {
            nextToAZero = true;}
          if (board[x+1][y] == 20) {
            nextToAZero = true;}
        }
        
        else if (y != 0 && y != rows-1 && x != 0 && x!= cols-1){
          if (board[x][y-1] == 20){
            nextToAZero = true;}
          if (board[x-1][y-1] == 20){
            nextToAZero = true;}
          if (board[x+1][y-1] == 20){
          nextToAZero = true;}
          if (board[x-1][y] == 20) {
            nextToAZero = true;}
          if (board[x+1][y] == 20) {
            nextToAZero = true;}
          if (board[x-1][y+1] == 20){
            nextToAZero = true;}
          if (board[x][y+1] == 20) {
           nextToAZero = true;}
          if (board[x+1][y+1] == 20){ 
            nextToAZero = true;}
        }
        
        if(nextToAZero == true){
        fill(cellColour[(board[x][y])]);
        rect(x*cellWidth, y*cellHeight, cellWidth, cellHeight);
        fill(0);
        textSize(cellWidth/2);
        text(board[x][y], (x*cellWidth + (cellWidth/2)), (y*cellHeight + (cellHeight/2)));}
        
        
      }
    }
  }

}
  


void displayClickedCell() {
  int xCord = int(mouseX/cellWidth);
  int yCord = int(mouseY/cellHeight);
   x = xCord;
   y = yCord;
  if (mouseButton == RIGHT){
    //if get();
    fill(252, 114, 0);
    rect(x*cellWidth, y*cellHeight, cellWidth, cellHeight);
    fill(0);
    textSize(cellWidth/2);
    text("FLAG", (x*cellWidth + (cellWidth/2)), (y*cellHeight + (cellHeight/2)));
    
  }
  
  
  if (mouseButton == LEFT){

  
   if (board[x][y] == 9){
      state = 2;
    }
     
     
   else if (board[x][y] == 0){
      board[x][y] = 20;
      
    
      youClickedOnAZero();
    }
   
    
    
    else {
      if (board[x][y] != 20){
        fill(cellColour[board[x][y]]);
        rect(x*cellWidth, y*cellHeight, cellWidth, cellHeight);
        fill(0);
        textSize(cellWidth/2);
        text((board[x][y]), (x*cellWidth + (cellWidth/2)), (y*cellHeight + (cellHeight/2)));
      }
      
      
      
    }

    
  }
  
}