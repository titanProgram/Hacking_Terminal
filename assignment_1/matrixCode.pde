class matrixCode extends boxModel
{
  // data
  color codeColor;
  
  // data for fallingCode
  int ROW;
  // COL will be the randomized number of columns
  int COL;
  char[][] charList;
  float[][] charX;
  float[][] charY;
  
  float textSize = 10;
  
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
  
  void fallingCode()
  {
    COL = floor( random( 5, floor( height / 4 ) ) );
    ROW = floor( ( height * 2 ) / textSize );
    
    // creating array to store the falling characters in
    charList = new char[ROW][COL];
    charX = new float[ROW][COL];
    charY = new float[ROW][COL];
    // inserting random characters into the 2d array
    for ( int i = 0; i < ROW; i++ )
    {
      for ( int j = 0; j < COL; j++ )
      {
        // assigning the element [i][j] a random character
        charList[i][j] = char( floor( random( 255 ) ) );
      }
    }
    
    // inserting random characters into the 2d array
    for ( int i = 0; i < ROW; i++ )
    {
      for ( int j = 0; j < COL; j++ )
      {
        // assigning the element [i][j] a random character
        charList[i][j] = char( floor( random( 255 ) ) );
      }
    }
    
    
  }
  
  void update()
  {
    
  }
}