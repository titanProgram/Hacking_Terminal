class systemErrors extends boxModel
{
  // data
  float x;
  float y;
  PImage skull;
  
  // contructor
  systemErrors( float x, float y )
  {
    super( x, y );
    this.x = x;
    this.y = y;
    
    skull = loadImage( "skull.png" );
  }
  
  // methods
  void blueScreenOfDeath()
  {
    imageMode( CENTER );
    background( 0, 0, 255 );
    image( skull, width / 2, height / 2, 100, 100 );
    
  }
  
  void corruption()
  {
  }
}