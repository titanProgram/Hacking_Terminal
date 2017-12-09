/*
    Developer: Byron Farrell
    Date created: 11/11/2017
    
    Description:
    ...
*/



Table table;
TableRow row;

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
float buttonMargin;

// monitor size variables
float monitorW;
float monitorH;
float monitorX;
float monitorY;
float monitorTextSize;

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

int randNum;
boolean hacked = false;


monitor monitorScreen;

arcAnimation logo;

void setup()
{
  fullScreen( );
  
  // monitor
  marginX = 200;
  marginY = 30;
  margin = 30;
  monitorW = width - ( marginX * 2 );
  monitorH = height * 0.7;
  monitorX = marginX;
  monitorY = marginY;
  monitorTextSize = width / 80;
  
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
  
  // button size and postion variables
  buttonW = width / 10;
  buttonH = width / 40;
  buttonMargin = ( controlPanelH - ( buttonH * 2 ) ) / 3;
  
  // initiliazing objects
  loginButton = new buttonModel( width / 2, height * 0.7, buttonW, buttonH, color( 0, 0, 0 ), color( 0, 255, 0 ), "login" );
  // control panel
  hackComputer = new buttonModel(controlPanelX + controlPanelW / 2, controlPanelY + buttonMargin + ( buttonH / 2 ), controlPanelW - margin * 2, buttonH * 1.5, color( 80 ), color( 51, 122, 46 ), "HACK" );
  logout = new buttonModel(controlPanelX + controlPanelW / 2, controlPanelY + buttonMargin * 2 + ( buttonH * 1.5 ), controlPanelW - margin * 2, buttonH * 1.5, color( 80 ), color( 51, 122, 46 ), "LOGOUT" );
  // status panel
  //cpuPower = new buttonModel( statusPanelX + statusPanelW / 2, statusPanelY + buttonMargin + ( buttonH / 2 ), statusPanelW - margin * 2, buttonH * 1.5, color( 80 ), color( 51, 122, 46 ), "" );
  //hackingBar = new buttonModel( statusPanelX + statusPanelW / 2, statusPanelY + buttonMargin * 2 + ( buttonH * 1.5 ), statusPanelW - margin * 2, buttonH * 1.5, color( 80 ), color( 51, 122, 46 ), "" );
  monitorScreen = new monitor( monitorX, monitorY, monitorW, monitorH );
  
  table = loadTable( "hacked_data.csv", "header" );
  
  logo = new arcAnimation( ( monitorW + monitorX ) - monitorW * 0.1, ( monitorH + monitorY ) - monitorH * 0.2, 80 );


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
  //logo.hourglass();
  logo.drawArcs();
  logo.rotateArcs();
}


// FUNCTIONS
void logged_out()
{
  background( 0, 0, 255 );
  loginButton.drawButton();
  

}

void logged_in()
{
  // monitor
  background( 80 );
  /*
  fill( 0 );
  noStroke();
  rect( monitorX, monitorY, monitorW, monitorH, 7 );*/
  monitorScreen.drawMonitor();
  noStroke();
  
  // status panel
  rectMode( CORNER ); 
  fill( 0 );
  rect( statusPanelX, statusPanelY, statusPanelW, statusPanelH, 7 );
  strokeWeight( 3 );
  //cpuPower.drawButton();
  //hackingBar.drawButton();
  strokeWeight( 1 );
  
  // control panel
  rectMode( CORNER );
  fill( 0 );
  noStroke();
  rect( controlPanelX, controlPanelY, controlPanelW, controlPanelH, 7 );
  strokeWeight( 3 );
  hackComputer.drawButton();
  logout.drawButton();
  strokeWeight( 1 );
  
  rectMode( CORNER ); 
  
  if ( hacked )
  {
    hack( randNum );
  }
  
}

void hack( int randNum )
{
  // local variables
  String emailMsg;
  char[] charArray1 = new char[2000];
  char[] charArray2 = new char[100];
  float num = 9;
  
  row = table.getRow(randNum);
  
  fill( 0, 255, 0 );
  textSize( monitorTextSize );
  textAlign( LEFT, TOP );
  text( "Name: " + row.getString("name"), monitorX + monitorTextSize, monitorY + monitorTextSize);
  text( "Age: " + row.getString("age"), monitorX + monitorTextSize, monitorY + monitorTextSize * 2);
  text( "Location: " + row.getString("location"), monitorX + monitorTextSize, monitorY + monitorTextSize * 3);
  text( "Bank Account Number: " + row.getString("bankAccountNo"), monitorX + monitorTextSize, monitorY + monitorTextSize * 4);
  text( "Amount: " + row.getString("amount"), monitorX + monitorTextSize, monitorY + monitorTextSize * 5);
  text( "Email to: " + row.getString("emailTo"), monitorX + monitorTextSize, monitorY + monitorTextSize * 7);
  
  emailMsg = row.getString("emailMessage");
  charArray1 = emailMsg.toCharArray();
  for ( int i = 0; i < charArray1.length; i += 100 )
  {
    for ( int j = 0; j < 100 && i + j < charArray1.length; j++ )
    {
      charArray2[j] = charArray1[i + j];
      println(i + j);
       println(charArray1.length);
    }
    
    
    
    emailMsg = new String(charArray2);
    text( emailMsg, monitorX + monitorTextSize, monitorY + monitorTextSize * num );
    num++;
    
    for ( int j = 0; j < 50; j++ )
    {
      charArray2[j] = ' ';
    }
  }
}

void checkButtons()
{
  if ( loginButton.buttonPressed() )
  {
    loggedIn = 1;
  }
  
  if ( logout.buttonPressed() )
  {
    loggedIn = 0; 
  }
  
  if ( hackComputer.buttonPressed() )
  {
    randNum = floor( random( 0, table.getRowCount() ) );
    hacked = true;
  }
}

void mouseReleased()
{
  checkButtons();
}