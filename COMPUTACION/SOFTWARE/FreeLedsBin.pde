//--------------------------------------------------------------
//-- Display numbers in the Freeleds (in binary)
//-- As an example, a visual sequence is played
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


void setup()
{
  //-- All the leds are configured as outputs
  for (int i=0; i<8; i++)
    pinMode(freeled_bit[i], OUTPUT);
}

int bit;

//-- Show a number in the Freeleds (in binary)
void freeleds(int number)
{
  for (int i=0; i<8; i++) {
    bit = (number>>i) & 0x01;
    digitalWrite(freeled_bit[i],bit);
  }
}

void loop()
{
  freeleds(0xAA);
  delay(200);
  freeleds(0x55);
  delay(200);

}
