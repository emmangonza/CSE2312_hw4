  .global _start

_start:
  ldr r1, =numbers
  mov r2, #1          @loop counter
  ldr r3, [r1]        @initial min
  ldr r4, [r1]        @initial max
  ldr r5, [r1]        @will increment through the array
  bal loop

_exit:
  mov r7, #1
  swi 0

  .data
  
numbers:
  .word 24, 0, 16, -21, 34, 13, 55, -9, 7, 64, 99, -15, 75, -20, 100

loop:
  cmp r2, #15
  bge _exit

  cmp r3, r5
  blt less_than
  bgt greater_than

  bal increment

less_than:
  mov r3, r5

greater_than:
  mov r4, r5

increment:
  mov r0, #0
  add r0, r3, r4

  add r1, r1, #4
  ldr r5, [r1]

  bal loop
