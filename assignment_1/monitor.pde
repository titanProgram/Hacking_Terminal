class monitor extends boxModel
{
  // data
  float monitorW;
  float monitorH;
  PShape screen;
  
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
    //screen.vertex( x + monitorW, ( y + monitorH ) - ( monitorW * 0.1 ) );
    screen.vertex( x + monitorW, y, x + monitorW );
    screen.vertex( x + monitorW, y + ( monitorH * 0.9 ) );
    screen.vertex( x + monitorW, y );
    screen.endShape(CLOSE);
  }
  
  // methods
  void drawMonitor()
  {
    fill(0);
    shape( screen, 0, 0 );
  }
  
  void hackingBar()
  {
    
  }
}