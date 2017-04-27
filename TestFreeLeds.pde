//--------------------------------------------------------------
//-- Testing the freeleds board connected to the Skymega
//-- The "knight rider" effect is played on the freeleds board
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
const int freeled[8]={D0,D1,D2,D3,D4,D5,D6,D7};


void setup()
{
  //-- All the leds are configured as outputs
  for (int i=0; i<8; i++)
    pinMode(freeled[i], OUTPUT);
}

//-- Play!!!
void loop()
{
  //-- Turn on leds from D0 to D7
  for (int i=0; i<8; i++) {
    digitalWrite(freeled[i], ON);
    delay(100);
    digitalWrite(freeled[i], OFF);
  }

  //-- Turn on leds from D7 to D0
  for (int i=6; i>0; i--) {
    digitalWrite(freeled[i], HIGH);
    delay(100);
    digitalWrite(freeled[i], LOW);
  }

}
