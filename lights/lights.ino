extern "C" {void lights(int param1);}

void setup() {
  delay(1000); 
  // intitialize the digital pins as output
  pinMode(2, OUTPUT);
  pinMode(3, OUTPUT);
  pinMode(4, OUTPUT);
  pinMode(5, OUTPUT);
  pinMode(6, OUTPUT);
}


void loop() {
  for (int arg1 = 0; arg1 <=15; arg1++)
    lights(arg1);            // call assembly light display
}
