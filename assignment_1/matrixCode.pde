class matrixCode extends boxModel
{
  // data
  float x;
  float y;
  
  float[] yPos;
  int yPosSize;
  float minPoint = -300;
  float maxPoint = 200;
  
  
  float textSize = 10;
  
  // constructor
  matrixCode( float x, float y )
  {
    super( x, y );
    this.x = x;
    this.y = y;
    yPosSize = floor( width / textSize );
    yPos = new float[yPosSize];
    
    for ( int i = 0; i < yPosSize; i++ )
    {
      yPos[i] = floor( random( minPoint, maxPoint ) );
    }
  }
  
  // methods
  void drawMatrixCode()
  {
    background( 0, 5 );
    
    for ( int i = 1; i < yPosSize + 1; i++ )
    {
      text( char( floor( random( 1, 255 ) ) ), i * textSize, yPos[i - 1] );
    }
    
    for ( int i = 0; i < yPosSize; i++ )
    {
      yPos[i] += textSize;
    }
    
    if ( minPoint > height )
    {
      resetMatrixCode();
    }
  }
  
  void resetMatrixCode()
  {
    for ( int i = 0; i < yPosSize; i++ )
    {
      yPos[i] = floor( random( minPoint, maxPoint ) );
    }
  }
  
}