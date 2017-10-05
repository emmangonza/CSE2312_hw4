  .global _start

_start:
  ldr r1, =letters
  mov r2, #1          @loop counter
  ldr r3, [r1]        @will increment through the string
  bal loop

_exit:
  mov r7, #1
  swi 0

  .data

letters:
  .asciz "This IS a ~ sAMPLE string 4 U 2 use."

loop:
  cmp r2, #0
  beg _exit

  
