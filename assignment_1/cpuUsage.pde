class cpuUsage extends boxModel
{
  // data
  float x;
  float y;
  float barW;
  float barH;
  int cpuPower;
  int textSize = 15;
  // constructor
  cpuUsage( float x, float y, float barW, float barH )
  {
    super( x, y );
    this.x =x;
    this.y = y;
    this.barW = barW;
    this.barH = barH;
    this.cpuPower = 5;
  }
  
  // methods
  void drawBar()
  {
    noStroke();
    if ( cpuPower > 74 )
    {
      fill( 0, 255, 0 ); 
    }
    else if ( cpuPower > 44 )
    {
      fill( 0, 255, 255 );
    }
    else
    {
      fill( 255, 0, 0 );
    }
    fill( 255 );
    textSize( textSize );
    
    textAlign( CORNER, CENTER );
    text( "CPU USAGE", x, y );
    text( round( 100 * ( (float) cpuPower / 20 ) ) + "%", x + ( textSize * 4 ) + ( barW * 21 ), y );

    for ( int i = 1; i < cpuPower; i++ )
    {
      rect( x + ( textSize * 6 ) + ( barW * i ), y, barW * 0.9, barH ); 
    }
  }
  
  void increase()
  {
    if ( frameCount % 30 == 0 )
    {
      cpuPower += 1;
    }  
  }
  
  void decrease()
  {
    if ( frameCount % 180 == 0 && cpuPower > 5)
    {
      cpuPower -= 1;
    } 
  }
  
  boolean overload()
  {
    if ( cpuPower > 20 )
    {
      return true;
    }
    else
    {
      return false;
    }
  }
}