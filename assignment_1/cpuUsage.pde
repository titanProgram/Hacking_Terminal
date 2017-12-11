class cpuUsage extends boxModel
{
  // data
  float x;
  float y;
  float barW;
  float barH;
  float panelW;
  int cpuPower;
  int textSize;
  // constructor
  cpuUsage( float x, float y, float barW, float barH, float panelW )
  {
    super( x, y );
    this.x =x;
    this.y = y;
    this.barW = barW;
    this.barH = barH;
    this.panelW = panelW;
    this.cpuPower = 5;
    textSize = floor( panelW / 40 );
  }
  
  // methods
  void drawBar()
  {
    noStroke();
    if ( cpuPower > 15 )
    {
      fill( 255, 0, 0 ); 
    }
    else if ( cpuPower > 9 )
    {
      fill( 255, 255, 0 );
    }
    else
    {
      fill( 66, 244, 72 );
    }
    textSize( textSize );
    
    textAlign( CORNER, CENTER );
    text( "CPU USAGE", x, y );
    text( round( 100 * ( (float) cpuPower / 20 ) ) + "%", x + panelW * 0.8, y );

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