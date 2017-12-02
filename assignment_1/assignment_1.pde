/*
    Developer: Byron Farrell
    Date created: 11/11/2017
    
    Description:
    ...
*/

Table personalInfo;
buttonModel loginButton;
buttonModel cpuPower;
buttonModel hackingBar;
buttonModel hackComputer;
buttonModel logout;

// 0 = false amd 1 = true
int loggedIn = 0;

// x and y margins
float marginX;
float marginY;
float margin;

// button size and position variabels
float buttonX;
float buttonY;
float buttonW;
float buttonH;

// monitor size variables
float monitorW;
float monitorH;
float monitorX;
float monitorY;

// status panel
float statusPanelX;
float statusPanelY;
float statusPanelW;
float statusPanelH;

// control panel
float controlPanelX;
float controlPanelY;
float controlPanelW;
float controlPanelH;

void setup()
{
  fullScreen();
  
  // button size and postion variables
  buttonW = width / 10;
  buttonH = width / 40;
  
  // monitor
  marginX = 200;
  marginY = 30;
  margin = 30;
  monitorW = width - ( marginX * 2 );
  monitorH = height * 0.7;
  monitorX = marginX;
  monitorY = marginY;
  
  // status panel
  statusPanelX = width * 0.5 + margin / 2;
  statusPanelY = monitorH + marginY * 2;
  statusPanelW = ( width * 0.5 ) - marginX - ( margin / 2 );
  statusPanelH = ( height - ( monitorH + marginY ) ) - marginY * 2;
  
  // control panel
  controlPanelX = marginX;
  controlPanelY = monitorH + marginY * 2;
  controlPanelW = ( width * 0.5 ) - marginX - ( margin / 2 );
  controlPanelH = ( height - ( monitorH + marginY ) ) - marginY * 2;  
  
  // initiliazing objects
  loginButton = new buttonModel( width / 2, height * 0.7, buttonW, buttonH, color( 0, 0, 0 ), color( 0, 255, 0 ), "login" );
  // control panel
  hackComputer = new buttonModel(controlPanelX + controlPanelW / 2, controlPanelY + buttonH * 1.5, controlPanelW - margin * 2, buttonH * 1.5, color( 0 ), color( 51, 122, 46 ), "HACK" );
  logout = new buttonModel(controlPanelX + controlPanelW / 2, controlPanelY + buttonH * 3.5, controlPanelW - margin * 2, buttonH * 1.5, color( 0 ), color( 51, 122, 46 ), "LOGOUT" );
  // status panel
  cpuPower = new buttonModel( statusPanelX + statusPanelW / 2, statusPanelY + buttonH * 1.5, statusPanelW - margin * 2, buttonH * 1.5, color( 0 ), color( 51, 122, 46 ), "" );
  hackingBar = new buttonModel( statusPanelX + statusPanelW / 2, statusPanelY + buttonH * 3.5, statusPanelW - margin * 2, buttonH * 1.5, color( 0 ), color( 51, 122, 46 ), "" );
  
  
}

void draw()
{
  
  switch( loggedIn )
  {
    case 0:
      logged_out();
      break;
    case 1:
      logged_in();
      break;
  }
  
}


// FUNCTIONS
void logged_out()
{
  background( 0, 0, 255 );
  loginButton.drawButton();
  if( mousePressed && mouseX > loginButton.xTopLeft && mouseX < loginButton.xTopLeft + loginButton.buttonW && mouseY > loginButton.yTopLeft && mouseY < loginButton.yTopLeft + loginButton.buttonH )
  {
    loggedIn = 1; 
  }
}

void logged_in()
{
  // monitor
  background( 0 );
  fill( 80 );
  noStroke();
  rect( monitorX, monitorY, monitorW, monitorH, 7 );
  
  // status panel
  rectMode( CORNER ); 
  rect( statusPanelX, statusPanelY, statusPanelW, statusPanelH, 7 );
  strokeWeight( 5 );
  cpuPower.drawButton();
  hackingBar.drawButton();
  strokeWeight( 1 );
  
  // control panel
  rectMode( CORNER );
  fill( 80 );
  noStroke();
  rect( controlPanelX, controlPanelY, controlPanelW, controlPanelH, 7 );
  strokeWeight( 5 );
  hackComputer.drawButton();
  logout.drawButton();
  strokeWeight( 1 );
  
  rectMode( CORNER ); 
  
}