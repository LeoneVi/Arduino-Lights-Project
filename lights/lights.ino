extern "C" {void lights(int param1);}

#define LOOP_COUNT 14

void setup() {
  delay(1000); 
  // intitialize the digital pins as output
  pinMode(2, OUTPUT);
  pinMode(3, OUTPUT);
  pinMode(4, OUTPUT);
  pinMode(5, OUTPUT);
  pinMode(6, OUTPUT);
}


/*
  Fibonacci sequence:
  F_0 = 0, F_1 = 1
  F_n = F_n-1 + F_n-2 for n>1


  Examples:
  F_0 = 0
  F_1 = 1
  F_2 = F_1 + F_0 = 1
  F_3 = F_2 + F_1 = 1 + 1 = 2
  F_4 = F_3 + F_2 = 2 + 1 = 3
  F_5 = F_4 + F_3 = 3 + 2 = 5
*/
void loop() {
  int nums[LOOP_COUNT];
  for (int i = 0; i < LOOP_COUNT; i++) {
    if(i == 0 || i == 1){
        nums[i] = i;
    } else {
        nums[i] = nums[i-1] + nums[i-2];
    }
    lights(nums[i]);
  }    
}