//-- Skymega description

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


//-- Skymega configuration
void setup()
{
  // The led is an output
  pinMode(LED, OUTPUT);

  //-- The button is an input
  pinMode(BUTTON, INPUT);
  //-- Activate the button pull-up resistor
  digitalWrite(BUTTON, HIGH);
}

// Variable for reading the button
int button;

void loop()
{
  // read the button
  button = digitalRead(BUTTON);

  // check if the pushbutton is pressed.
  if (button == PRESSED) {
    // if it is, turn LED on:
    digitalWrite(LED, ON);
  }
  else {
    // turn LED off:
    digitalWrite(LED, OFF);
  }
}
