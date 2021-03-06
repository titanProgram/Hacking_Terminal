
import processing.sound.*;

Table table;
TableRow row;

// declaring objects
buttonModel loginButton;
buttonModel shutdown;
buttonModel hackComputer;
buttonModel logout;

matrixCode fallingCode;

sidePanel statusPanel;
sidePanel controlPanel;

cpuUsage cpuBar;

systemErrors error;

monitor monitorScreen;

arcAnimation logo;

// sound files
SoundFile click1;
SoundFile loading;
SoundFile hover;
SoundFile alarm1;
SoundFile alarm2;
SoundFile staticSound;

// state of the program
int state = 0;

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
int hackedNum = 0;
boolean hacked = false;
boolean loadingBar = true;
boolean playSound = true;
boolean playHover = true;
boolean playStatic = false;
boolean playAlarm2 = true;
boolean changeBackground = true;



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
  loginButton = new buttonModel( width / 2, height * 0.7, buttonW, buttonH, color( 0, 0, 0 ), color( 66, 244, 72 ), "login" );
  shutdown = new buttonModel( width / 2, height * 0.71 + buttonH, buttonW, buttonH, color( 0, 0, 0 ), color( 255, 0, 0 ), "Terminate" );
  // control panel
  hackComputer = new buttonModel(controlPanelX + controlPanelW / 2, controlPanelY + buttonMargin + ( buttonH / 2 ), controlPanelW - margin * 2, buttonH * 1.5, color( 80 ), color(  66, 244, 72  ), "HACK" );
  logout = new buttonModel(controlPanelX + controlPanelW / 2, controlPanelY + buttonMargin * 2 + ( buttonH * 1.5 ), controlPanelW - margin * 2, buttonH * 1.5, color( 80 ), color(  66, 244, 72  ), "LOGOUT" );
  
  monitorScreen = new monitor( monitorX, monitorY, monitorW, monitorH );
  
  fallingCode = new matrixCode( width, height );
  
  table = loadTable( "hacked_data.csv", "header" );
  
  logo = new arcAnimation( ( monitorW + monitorX ) - monitorW * 0.1, ( monitorH + monitorY ) - monitorH * 0.2, 80 );
  
  statusPanel = new sidePanel( statusPanelX, statusPanelY, statusPanelW, controlPanelH );
  controlPanel = new sidePanel( controlPanelX, controlPanelY, controlPanelW, controlPanelH );
  
  cpuBar = new cpuUsage( statusPanelX + ( statusPanelW * 0.05 ), statusPanelY + ( statusPanelH * 0.3 ), statusPanelW / 30, statusPanelH / 6, statusPanelW );
  
  error = new systemErrors( 0, 0 );
  
  // initiliazing sound files
  click1 = new SoundFile( this, "click1.wav" );
  loading = new SoundFile( this, "loadingBar.wav" );
  hover = new SoundFile( this, "hover.wav" );
  alarm1 = new SoundFile( this, "alarm1.wav" );
  alarm2 = new SoundFile( this, "alarm2.mp3" );
  staticSound = new SoundFile( this, "static.mp3" );
}

void draw()
{
  switch( state )
  {
    case 0:
      logged_out();
      break;
    case 1:
      logged_in();
      break;
    case 2:
      error.blueScreenOfDeath();
      loading.stop();
      if ( playAlarm2 )
      {
        alarm2.play();
        playAlarm2 = false;
      }
      
      if ( frameCount % 300 == 0 )
      {
        playAlarm2 = true;
      }
      break;
    case 3:
      error.corruption();
      
      if ( !playStatic )
      {
        if ( frameCount % 35 == 0 )
        {
          alarm1.loop();
        }
      }
      
      if ( playStatic )
      {
        staticSound.play();
      }
      
      if ( frameCount % 240 == 0 )
      {
        playStatic = true;
      }
      break;
  } 
  checkHover();
}


// FUNCTIONS
void logged_out()
{
  // speed at which the charaters will fall down
  if ( frameCount % 4 == 0 )
  {
    fallingCode.drawMatrixCode();
  }
  // buttons
  loginButton.drawButton();
  shutdown.drawButton();
  changeBackground = true;
}


void logged_in()
{
  // monitor
  if ( changeBackground )
  {
    background( 0 );
    changeBackground = false;
  }
  if ( frameCount % 4 == 0 )
  {
    fallingCode.drawMatrixCode();
  }
  monitorScreen.drawMonitor();
  noStroke();
   
  // control panel
  controlPanel.drawPanel();
  strokeWeight( 3 );
  hackComputer.drawButton();
  logout.drawButton();
  strokeWeight( 1 );
  
  logo.drawArcs();
  logo.rotateArcs();
  
  // status panel
  statusPanel.drawPanel();
  
  textSize( cpuBar.textSize );
  
  cpuBar.drawBar();
  cpuBar.decrease();
  rectMode( CORNER ); 
  textSize( cpuBar.textSize );
  fill( 66, 244, 72 );
  text( "User: Anonymous", statusPanelX + ( statusPanelW * 0.05 ), statusPanelY + ( statusPanelH * 0.6 ) );
  text( "Number of computers hacked: " + hackedNum, statusPanelX + ( statusPanelW * 0.35 ), statusPanelY + ( statusPanelH * 0.6 ) );
  
  // if the user clicked hack
  if ( hacked )
  { 
    // will be true while the loading bar is loading
    if ( loadingBar )
    {
      // play sound while loading bar is loading
      if ( playSound )
      {
        loading.play();
        playSound = false;
      }
      if ( monitorScreen.hackingBar() )
      {
        hackedNum++;
        loadingBar = false;
        playSound = true;
        loading.stop();
      }
      cpuBar.increase();
      if ( cpuBar.overload() )
      {
        state = 2;  
      }
      
    } 
    else
    {
      hack( randNum );
      monitorScreen.hackingBar();
    }
  }
}


void hack( int randNum )
{
  // local variables
  String emailMsg;
  char[] charArray1 = new char[2000];
  char[] charArray2 = new char[100];
  float num = 9;
  int lastLine;
  int count;
  
  row = table.getRow(randNum);
  
  
  fill( 66, 244, 72 );
  textSize( monitorTextSize );
  textAlign( LEFT, TOP );
  // getting data from csv file
  text( "Name: " + row.getString("name"), monitorX + monitorTextSize, monitorY + monitorTextSize);
  text( "Age: " + row.getString("age"), monitorX + monitorTextSize, monitorY + monitorTextSize * 2);
  text( "Location: " + row.getString("location"), monitorX + monitorTextSize, monitorY + monitorTextSize * 3);
  text( "Bank Account Number: " + row.getString("bankAccountNo"), monitorX + monitorTextSize, monitorY + monitorTextSize * 4);
  text( "Amount: " + row.getString("amount"), monitorX + monitorTextSize, monitorY + monitorTextSize * 5);
  text( "Email to: " + row.getString("emailTo"), monitorX + monitorTextSize, monitorY + monitorTextSize * 7);
  
  emailMsg = row.getString("emailMessage");
  charArray1 = emailMsg.toCharArray();
  // calculating how many characters are in the last line of the email
  lastLine = charArray1.length % 100;
  count = ( charArray1.length - lastLine ) / 100;
  // last line will be store in this char array
  // it will stop random character being printed or any unwanted text
  char[] charArray3 = new char[lastLine];
  
  // printing email onto the screen
  for ( int i = 0; i < charArray1.length; i += 100 )
  {
    for ( int j = 0; j < 100 && i + j < charArray1.length; j++ )
    {
      charArray2[j] = charArray1[i + j];
    }
    
    println("lastLine = " + lastLine);
    println("charArray1 = " + charArray1.length);
    println("count = " + count);
    println("i = " + i);
    if ( count == 0 )
    {
      for ( int k = 0; k < lastLine; k++ )
      {
        charArray3[k] = charArray2[k];
      }
      emailMsg = new String(charArray3);
    }
    else
    {
      emailMsg = new String(charArray2);
    }
    text( emailMsg, monitorX + monitorTextSize, monitorY + monitorTextSize * num );
    num++;
    count--;
  }
  
  // if the user hacked mr robot
  // change state to 3, which will call the corruption method in the error class
  if ( row.getString("name").equals( "Mr Robot" ) )
  {
    textAlign( CENTER, CENTER );
    textSize( width / 30 );
    text( "HELLO FRIEND", width / 2, height / 2 );
    state = 3;
  }
}

// checking if the mouse id hovering over the button
void checkHover()
{
  if ( loginButton.hover() )
  {
    loginButton.fillC = color( 51, 122, 46 );
  }
  else
  {
    loginButton.fillC = color( 0, 0, 0 );
  }
  
  if ( shutdown.hover() )
  {
    shutdown.fillC = color( 255, 0, 0 );
  }
  else
  {
    shutdown.fillC = color( 0, 0, 0 );
  }
  
  if ( logout.hover() )
  {
    logout.fillC = color( 51, 122, 46 );
  }
  else
  {
    logout.fillC = color( 0, 0, 0 );
  }
  
  if ( hackComputer.hover() )
  {
    hackComputer.fillC = color( 51, 122, 46 );
  }
  else
  {
    hackComputer.fillC = color( 0, 0, 0 );
  }
}

// checking if any of the button have been clicked
void checkButtons()
{
  if ( loginButton.buttonPressed() )
  {
    state = 1;
    click1.play();
  }
  
  if ( shutdown.buttonPressed() )
  {
    click1.play();
    delay(1000);
    exit();
  }
  
  if ( logout.buttonPressed() )
  {
    state = 0;
    background( 0 );
    click1.play();
  }
  
  if ( hackComputer.buttonPressed() )
  {
    randNum = floor( random( 0, table.getRowCount() ) );
    hacked = true;
    loadingBar = true;
    monitorScreen.i = 1;
    click1.play();
  }
}


void mouseReleased()
{
  checkButtons();
}