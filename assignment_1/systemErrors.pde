class systemErrors extends boxModel
{
  // data
  float x;
  float y;
  int textSize = 40;
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
    image( skull, width / 2, height / 4, 200, 200 );
    
    fill( 0 );
    textSize( textSize );
    textAlign( CENTER, CENTER );
    text( "BLUE SCREEN OF DEATH!!", width /2, height / 2 );
  }
  
  void corruption()
  {
  }
}