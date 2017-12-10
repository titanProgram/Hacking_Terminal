class monitor extends boxModel
{
  // data
  float monitorW;
  float monitorH;
  PShape screen;
  
  float textSize = width / 80;
  int i = 1;
  
  // constructor
  monitor( float x, float y, float monitorW, float monitorH )
  {
    super( x, y );
    this.monitorW = monitorW;
    this.monitorH = monitorH;
    
    screen = createShape();
    screen.beginShape();
    screen.fill( 0 );
    screen.stroke( 66, 104, 244 );
    screen.strokeWeight( 5 );
    screen.vertex( x, y );
    screen.vertex( x, y + monitorH );
    screen.vertex( x + ( monitorW * 0.9 ), y + monitorH );
    screen.vertex( x + monitorW, y + ( monitorH * 0.9 ) );
    screen.vertex( x + monitorW, y, x + monitorW );
    screen.vertex( x + monitorW, y + ( monitorH * 0.9 ) );
    screen.vertex( x + monitorW, y );
    screen.endShape( CLOSE );
  }
  
  // methods
  void drawMonitor()
  {
    fill(0);
    shape( screen, 0, 0 );
  }
  
  boolean hackingBar()
  {    
    textSize( textSize );
    textAlign( LEFT, CENTER );
    fill( 66, 244, 72 );
    text( "Hacking", x + textSize, y + monitorH - textSize * 2 );
    
    noStroke();
    fill( 66, 244, 72 );
    rectMode( CENTER );
    
    for ( int j = 0; j < i; j++ )
    {
      rect( x + ( ( textSize ) * j ) + ( textSize * 6 ), y + monitorH - textSize * 2, textSize * 0.7, textSize * 1.6 );
    }
    
    if ( frameCount % 5 == 0 )
    {
      if ( i < 40 )
      {
        i++;
      }
    }
    fill( 66, 244, 72 );
    text( round( 100 * ( (float) i / 40 ) ) + "%", x + ( ( textSize ) * 40 ) + ( textSize * 6 ), y + monitorH - textSize * 2 );
    
    if ( i == 40 )
    {
      return true;
    }
    else
    {
      return false;
    }
  }
}