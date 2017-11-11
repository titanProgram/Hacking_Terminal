class matrixCode extends boxModel
{
  // data
  color codeColor;
  
  
  char[] charList = { ' ', ' ', '{', '}', '^', '$' };
  char[] fallingChars = new char[100];
  
  float[] charX1 = new float[100];
  float[] charY1 = new float[100];
  
  float[] charX2 = new float[100];
  float[] charY2 = new float[100];
  
  float textSpacing;
  int randomIndex;
  boolean switchArray = false;
  
  
  
  int index = 0;
  // contructor
  matrixCode( float x, float y, float boxWidth, float boxHeight, color codeColor )
  {
    super( x, y, boxWidth, boxHeight );
    this.codeColor = codeColor;
    textSpacing =  boxWidth / 40 ;
    
    for ( int i = 0; i < 100; i++ )
    {
       randomIndex = (int) random( 0, 6 );
       fallingChars[i] = charList[randomIndex];
    }
    

  }
  
  // methods
  void drawBox()
  {
    rect( x, y, boxWidth, boxHeight );
    
    for ( int i = 0; i < 100; i++ )
    {
      text( fallingChars[i], charX1[i], charY1[i] );
      text( fallingChars[i], charX2[i], charY2[i] );
    }
  }
  
  void resetArray1()
  {
    for ( int i = 0; i < 10; i++ )
    {
      for ( int j = 0; j < 10; j++ )
      {
        charX1[index] += textSpacing;
        index++;
        textSpacing += boxWidth / 20;
      }
    }
    
    // reseting textSpacing
    textSpacing =  boxWidth / 40;
    
    // reseting index
    index = 0;
    
    for ( int i = 0; i < 10; i++ )
    {
      for ( int j = 0; j < 10; j++ )
      {
        charY1[index] -= textSpacing;
        index++;
        textSpacing += boxWidth / 20;
      }
    }
    
    // reseting textSpacing
    textSpacing =  boxWidth / 40;
    
    // reseting index
    index = 0;
  }
  
  void resetArray2()
  {
    for ( int i = 0; i < 10; i++ )
    {
      for ( int j = 0; j < 10; j++ )
      {
        charX2[index] += textSpacing;
        index++;
        textSpacing += boxWidth / 20;
      }
    }
    
    // reseting textSpacing
    textSpacing =  boxWidth / 40;
    
    // reseting index
    index = 0;
    
    for ( int i = 0; i < 10; i++ )
    {
      for ( int j = 0; j < 10; j++ )
      {
        charY2[index] -= textSpacing;
        index++;
        textSpacing += boxWidth / 20;
      }
    }
    
    // reseting textSpacing
    textSpacing =  boxWidth / 40;
    
    // reseting index
    index = 0;
  }
  
  void update()
  {
    if ( !switchArray )
    {
      for ( int i = 0; i < 100; i++ )
      {
        charY1[i] += textSpacing;
        textSpacing += 1;
      }
      
      // reseting textSpacing
      textSpacing =  boxWidth / 40;
    }
    else
    {
      for ( int i = 0; i < 100; i++ )
      {
        charY2[i] += textSpacing;
        textSpacing += 1;
      }
      
      // reseting textSpacing
      textSpacing =  boxWidth / 40;
    }
    
    if ( charY1[0] >= height )
    {
      switchArray = true;
      resetArray2();
    }
    
    if ( charY2[0] > height )
    {
      switchArray = false;
      resetArray1();
    }
  }
}