class sidePanel extends boxModel
{
  // data
  float x;
  float y;
  float panelW;
  float panelH;
  
  PShape panel;
  
  // constructor
  sidePanel( float x, float y, float panelW, float panelH )
  {
    super( x, y );
    this.x = x;
    this.y = y;
    this.panelW = panelW;
    this.panelH = panelH;
    
    // creating panel shape
    panel = createShape();
    panel.beginShape();
    panel.fill( 0 );
    panel.stroke( 66, 104, 244 );
    panel.strokeWeight( 5 );
    panel.vertex( x, y + ( panelH * 0.1 ) );
    panel.vertex( x, y + ( panelH * 0.9 ) );
    panel.vertex( x + ( panelW * 0.1 ), y + panelH );
    panel.vertex( x + ( panelW * 0.9 ), y + panelH );
    panel.vertex( x + panelW, y + ( panelH * 0.9 ) );
    panel.vertex( x + panelW, y + ( panelH * 0.1 ) );
    panel.vertex( x + ( panelW * 0.9 ), y );
    panel.vertex( x + ( panelW * 0.1 ), y );
    panel.endShape( CLOSE );
  }
  
  // methods
  void drawPanel()
  {
    shape( panel, 0, 0 );
  }
  
}