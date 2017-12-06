/*class matrixCode extends boxModel
{
  // data
  color codeColor;
  
  int num_col;
  int yPosSize;
  float[] xPos;
  float[] yPos;
  char[][] charArray;
  
  int ROW;
  int COL;
  int i = 0;
  
  // contructor
  matrixCode( float x, float y, float boxWidth, float boxHeight, color codeColor )
  {
    super( x, y, boxWidth, boxHeight );
    this.codeColor = codeColor;
    
  }
  
  // methods
  void drawBox( color backgroudColor )
  {
    fill( backgroudColor );
    rect( x, y, boxWidth, boxHeight );
  }
  
  void resetArrays()
  {
    num_col = floor( random( boxWidth ) );
    yPosSize = floor( boxHeight * 2 );
    ROW = num_col;
    COL = yPosSize;
    
    xPos = new float[num_col];
    yPos = new float[yPosSize];
    charArray = new char[ROW][COL];  
    
    for ( int i = 0; i < ROW; i++ )
    {
      for ( int j = 0; j < COL; j++ )
      {
        charArray[i][j] = 'a';
        println(charArray[i][j]);
        
        //println(charArray[i][j]);
      }
    }
    println(ROW);
        println(COL);
    
    
  }
  
  void fallingCode()
  {
        
  }
  
  void update()
  {
    
  }
}

/*
  array of random chars
  xpos array [random ( 5, width / textSize )] = random( width / textSize ) * textSize
  ypos array [random ( 5, width / textSize )] = random( yStartingPoint, hieghh / 2 )
  
  run falling code method
    everytime it runs i++
      until ( any of the elements in ypos ) > height
      
  
  
*/