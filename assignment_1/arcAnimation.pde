class arcAnimation
{
  // data
  float x;
  float y;
  float arcRadius;
  float ellipseRadius;
  float speed1 = 0;
  float speed2 = 0;
  
  PShape triangle1;
  PShape triangle2;
  
  boolean toggle = true;
  
  
  // constructor
  arcAnimation( float x, float y, float radius )
  {
    this.x = x;
    this.y = y;
    arcRadius = radius;
    ellipseRadius = radius;
    
    // creating hourglass shape
    triangle1 = createShape( TRIANGLE, x, y, x + ( radius * 0.25 ), y - ( radius * 0.4 ), x - ( radius * 0.25 ), y - ( radius * 0.4 ) );
    triangle2 = createShape( TRIANGLE, x, y, x + ( radius * 0.25 ), y + ( radius * 0.4 ), x - ( radius * 0.25 ), y + ( radius * 0.4 ) );

    
  }
  
  // methods
  void drawArcs( )
  {
    strokeWeight( 3 );
    noFill();
    stroke( 66, 134, 244 );
    ellipse( x, y, ellipseRadius, ellipseRadius );
    arc( x, y, arcRadius + 10, arcRadius + 10, radians( speed1 ), radians( speed1 + 90 ) );
    arc( x, y, arcRadius + 20, arcRadius + 20, radians( speed2 ), radians( speed2 + 45 ) );
    arc( x, y, arcRadius + 30, arcRadius + 30, radians( speed2 + 220 ), radians( speed2 + 360) );
    arc( x, y, arcRadius + 40, arcRadius + 40, radians( speed1 ), radians( speed1 + 180) );
  }
  
  void rotateArcs()
  {
    speed1 += 2;
    speed2 -= 1;
   
    // if the ellipse == the arcRaduis decrease its raduis if 
    // if == the arcRadius / 2 increase its radius
    if ( ellipseRadius == arcRadius )
    {
      toggle = true;
    }
    else if ( ellipseRadius == arcRadius / 2 )
    {
      toggle = false;
    }
    
    if ( toggle )
    {
      ellipseRadius -= 0.5;
    }
    else
    {
      ellipseRadius += 0.5;
    }
  } 
}