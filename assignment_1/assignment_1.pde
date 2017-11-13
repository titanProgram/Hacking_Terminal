/*
    Developer: Byron Farrell
    Date created: 11/11/2017
    
    Description:
    ...
*/

matrixCode matrixBox;

void setup()
{
  size( 500, 500 );
  matrixBox = new matrixCode( 0, 0, 200, 200, color( 0, 255, 0 ) );
  matrixBox.fallingCode();
}

void draw()
{
  textSize(10);
  fill(255);
  text( "H", 50, 50);
  //background(0);
  textSize(22);
  noFill();
  //matrixBox.drawBox( 0 );
  fill( 0,  255, 0 );
  
  
  
  if ( frameCount % 60 == 0 )
  {
    
  }
}


// FUNCTIONS