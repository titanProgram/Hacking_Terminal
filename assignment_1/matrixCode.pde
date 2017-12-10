class matrixCode
{
  // data
  float boxW;
  float boxH;
  float[] yPos;
  int yPosSize;
  float minPoint = -300;
  float count = minPoint;
  float maxPoint = 200;
  
  
  float textSize = 10;
  
  // constructor
  matrixCode( float boxW, float boxH )
  {
    this.boxW = boxW;
    this.boxH = boxH;
    
    
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
    fill( 0, 30 );
    rectMode( CORNER );
    noStroke();
    rect( 0, 0, boxW, boxH );
    textSize( textSize );
    
    fill( 0, 255, 0 );
    for ( int i = 1; i < yPosSize + 1; i++ )
    {
      text( char( floor( random( 1, 100 ) ) ), i * ( textSize * 2 ), yPos[i - 1] );
    }
    
    for ( int i = 0; i < yPosSize; i++ )
    {
      yPos[i] += textSize * 2;
    }
    
    count += textSize;
    
    if ( count > maxPoint )
    {
      resetMatrixCode();
      count = minPoint;
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