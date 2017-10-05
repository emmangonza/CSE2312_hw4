  .global _start

_start:
  ldr r1, =numbers
  mov r2, #1          @loop counter
  mov r3, #1          @loop counter
  mov r4, #1          @loop counter
  mov r5, #1          @loop counter
  ldr r6, [r1]        @initial min
  ldr r7, [r1]        @will increment through the array
  bal min_loop

_exit:
  mov r7, #1
  swi 0

numbers:
  .word 24, 0, 16, -21, 34, 13, 55, -9, 7, 64, 99, -15, 75, -20, 100

min_loop1:
  cmp r2, #15
  bge _exit

  cmp r6, r8
  bal check_min

  ldr r8, [r1, #4]
  add r2, #1
  bal min_loop1

check_min:
  cmp r6, r8
  blt less_than

less_than:
  mov r6, r8
