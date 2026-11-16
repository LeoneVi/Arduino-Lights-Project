syntax unified
.section .text
.global lights

lights:
  PUSH {R1, R2, R3, R4, LR} @ Save working registers
  LDR  R1, =0x50000300      @ GPIO Port 1 base address
  LDR  R2, =0xF800          @ Mask for all lights
  STR  R2, [R1, #0x50C]     @ Turn all pins off with CLR offset


  AND  R4, R0, #0x18         @ Get the 4th bit     / changed this bitmask from 0x8 -> 0x18 /
  LSR  R4, R4, #1           @ Shift into 3rd position


  AND  R3, R0, #0x4         @ Get the 3rd bit
  LSL  R3, R3, #2           @ Shift into 5th position R2 = (((R0&0x8)>>1) | ((R0&0x4)<<2) | (R0@0x3)) << 11;

  AND  R2, R0, #0x3         @ Get the bottom 2 bits

  ORR  R2, R3               @ Combine bottom 2 and shifted 3rd
  ORR  R2, R4            

  LSL  R2, #11              @ Move all to bit 11
  LDR  R0, = 10             @ Set pause length
  BL   pause                @ Pause
  STR  R2, [R1, #0x508]     @ Turn pins on with SET offset
  BL   pause                @ Pause
  POP  {R1, R2, R3, R4, LR} @ Restore working registers
  BX   LR                   @ Return


pause:
  PUSH  {R1}                @ Save working register
  LDR   R1, =1000000        @ Set pause time unit
  MUL   R1, R0, R1          @ Calculate total time
delay_loop:
  SUBS  R1, R1, #1
  BGT   delay_loop          @ Count down to 0
  POP   {R1}                @ Restore working register
  BX    LR                  @ Return
.end