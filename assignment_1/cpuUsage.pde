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
    textSize( textSize );
    
    text( "CPU USAGE", x, y );
   
    for ( int i = 1; i < cpuPower; i++ )
    {
      rect( x + ( textSize * 3 ) + ( barW * i ), y, barW * 0.9, barH ); 
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
    if ( frameCount % 30 == 0 )
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