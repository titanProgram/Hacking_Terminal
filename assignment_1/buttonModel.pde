class buttonModel
{
  // data
  float x;
  float y;
  float buttonW;
  float buttonH;
  color fillC;
  color strokeC;
  String text;
  float buttonCurve = 7;
  
  float xTopLeft;
  float yTopLeft;
  
  // constructor
  buttonModel( float x, float y, float buttonW, float buttonH, color fillC, color strokeC, String text )
  {
    this.x = x;
    this.y = y;
    this.buttonW = buttonW;
    this.buttonH = buttonH;
    this.fillC = fillC;
    this.strokeC = strokeC;
    this.text = text;
    
    xTopLeft = x - ( buttonW / 2 );
    yTopLeft = y - ( buttonH / 2 );
  }
  
  void drawButton()
  {
    rectMode( CENTER );
    fill( fillC );
    stroke( strokeC );
    rect( x, y, buttonW, buttonH, buttonCurve );
    
    fill( 255 );
    textAlign( CENTER, CENTER );
    textSize( buttonH * 0.4 );
    text(text, x, y);
  }
  
  boolean buttonPressed()
  {
    if( mousePressed && mouseX > xTopLeft && mouseX < xTopLeft + buttonW && mouseY > yTopLeft && mouseY < yTopLeft + buttonH )
    {
      return true; 
    } 
    else
    {
      return false; 
    }
  }
  
  
}

/*
if( mousePressed 
    && mouseX > ( loginButton.x - loginButton.buttonW / 2 ) && mouseX < ( loginButton.x - loginButton.buttonW / 2 ) + loginButton.buttonW 
    && mouseY > ( loginButton.y - loginButton.buttonH / 2 ) && mouseY < ( loginButton.y - loginButton.buttonH / 2 ) + loginButton.buttonH )
    {
      */