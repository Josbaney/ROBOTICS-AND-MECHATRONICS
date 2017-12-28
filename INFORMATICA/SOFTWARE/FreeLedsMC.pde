//--------------------------------------------------------------
//-- Manual Counter. The counter is incremented when the test
//-- button is pressed. The counter is Displayed Freeleds (in binary)
//--------------------------------------------------------------
//-- (c) Juan Gonzalez-Gomez (Obijuan), Dec 2011
//-- GPL license
//--------------------------------------------------------------

//-- Map between Freeled board leds and arduino pins
const int D0=2;  //-- Led 0
const int D1=3;  //-- Led 1
const int D2=4;  //-- Led 2
const int D3=5;  //-- Led 3
const int D4=6;  //-- Led 4
const int D5=7;  //-- Led 5
const int D6=A0; //-- Led 6
const int D7=A1; //-- Led 7

//-- LED states:
const int ON = HIGH;
const int OFF = LOW;

//-- Array to easily access the freeled's leds
const int freeled_bit[8]={D0,D1,D2,D3,D4,D5,D6,D7};

//-- Skymega's test button is attached to pin 12
//--   It has no pull-up resistor
const int BUTTON = 12;
//-- Button states
const int PRESSED = LOW;
const int NOT_PRESSED = HIGH;


void setup()
{
  //-- All the leds are configured as outputs
  for (int i=0; i<8; i++)
    pinMode(freeled_bit[i], OUTPUT);

  //-- The button is an input
  pinMode(BUTTON, INPUT);
  //-- Activate the button pull-up resistor
  digitalWrite(BUTTON, HIGH);
}

//-- Show a number in the Freeleds (in binary)
void freeleds(int number)
{
  int bit;
  for (int i=0; i<8; i++) {
    bit = (number>>i) & 0x01;
    digitalWrite(freeled_bit[i],bit);
  }
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

int counter=0;

void loop()
{
  //-- Display the counter in the Freeleds
  freeleds(counter);

  //-- If the test button is clicked, the counter is incremented
  if (button_clicked())
    counter++;
}
