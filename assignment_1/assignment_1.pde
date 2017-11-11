/*
    Developer: Byron Farrell
    Date created: 11/11/2017
    
    Description:
    ...
*/

matrixCode matrixBox;

void setup()
{
  size( 1500, 500 );
  matrixBox = new matrixCode( 0, 0, 200, 200, color( 0, 255, 0 ) );
  matrixBox.resetArray1();
}

void draw()
{
  background(0);
  textSize(22);
  noFill();
  matrixBox.drawBox();
  fill( 0,  255, 0 );
  matrixBox.update();
  
  
  if ( frameCount % 60 == 0 )
  {
    
  }
}


// FUNCTIONS