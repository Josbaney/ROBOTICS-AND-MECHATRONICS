//--------------------------------------------------------------
//-- Blinking the led with a changeable frequency. When the
//-- Test button is pressed, the frequency is increased
//--------------------------------------------------------------
//-- (c) Juan Gonzalez-Gomez (Obijuan), Dec 2011
//-- GPL license
//--------------------------------------------------------------


//-- The skymega's led is attached to pin 13
//-- Same as Arduino
const int LED = 13;
//-- LED states:
const int ON = HIGH;
const int OFF = LOW;

//-- Skymega's test button is attached to pin 12
//--   It has no pull-up resistor
const int BUTTON = 12;
//-- Button states
const int PRESSED = LOW;
const int NOT_PRESSED = HIGH;


void setup()
{
  // The led is an output
  pinMode(LED, OUTPUT);

  //-- The button is an input
  pinMode(BUTTON, INPUT);
  //-- Activate the button pull-up resistor
  digitalWrite(BUTTON, HIGH);

  //-- Serial port is used for debuging
  Serial.begin(9600);
}

//-- This function returns true when the test button
//-- is pressed
bool button_clicked()
{

  static int button=1;
  static int oldbutton=1;

  //-- Save the previous button state
  oldbutton=button;

  // read the button
  button = digitalRead(BUTTON);

  //-- Detect a change in the button
  if (button!=oldbutton) {
    delay(20); //-- for debouncing
    if (button==PRESSED)
      return true;
  }

  return false;
}

//-- This function returns true when the time "time"
//-- has passed since the last call
bool timeout(long time)
{
  static long previousMillis = 0;
  static long currentMillis;

  //-- Read current time
  currentMillis = millis();

  //-- Check if the timeout has passed
  if(currentMillis - previousMillis > time) {
    previousMillis = currentMillis;

    return true;
  }

  return false;
}


//-- Led state
int ledState = OFF;

//-- Led blinking period, in ms
long period = 1000;

void loop()
{

  // If the botton is clicked the blinking period is
  // decreased (and the value send though the serial port
  // for debugging
  if (button_clicked()) {
    Serial.println(period,DEC);
    period-=50;
    if (period<=0) period=1000;
  }

  //-- If "period" ms have passed, change the led state
  if (timeout(period)) {
    ledState^=0x01;
    digitalWrite(LED,ledState);
  }
}
