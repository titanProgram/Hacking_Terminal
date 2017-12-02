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

// 0 = false amd 1 = true
int loggedIn = 0;

// button size and position variabels
float buttonX;
float buttonY;
float buttonW;
float buttonH;

// monitor size variables
float margin;
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
  margin = 200;
  monitorW = width - ( margin * 2 );
  monitorH = height / 2;
  monitorX = margin;
  monitorY = margin;
  
  // status panel
  statusPanelX = width * 0.5 + margin;
  statusPanelY = monitorH + margin * 2;
  statusPanelW = ( width * 0.5 ) - margin * 2;
  statusPanelH = ( height - ( monitorH + margin ) ) - margin * 2;
  
  // control panel
  controlPanelX = margin;
  controlPanelY = monitorH + margin * 2;
  controlPanelW = ( width * 0.5 ) - margin * 2;
  controlPanelH = ( height - ( monitorH + margin ) ) - margin * 2;  
  
  // initiliazing objects
  loginButton = new buttonModel( width / 2, height * 0.7, buttonW, buttonH, color( 0, 0, 0 ), color( 0, 255, 0 ), "login" );
  cpuPower = new buttonModel( statusPanelX , statusPanelY, buttonW, buttonH, color( 0, 0, 0 ), color( 0, 255, 0 ), "" );
  
  
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
  background( 80 );
  rectMode( CORNER ); 
  rect( monitorX, monitorY, monitorW, monitorH, 7 );
  
  // status panel
  rect( statusPanelX, statusPanelY, statusPanelW, statusPanelH, 7 );
  
  // control panel
  rect( controlPanelX, controlPanelY, controlPanelW, controlPanelH, 7 );
}