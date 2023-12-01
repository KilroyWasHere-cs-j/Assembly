global _start

section .data
  msg db 'Hello World', 0xa

section .bss
  buf resb 64

section .text

hold:
  mov rax, 1
  mov rdi, 1
  mov rsi, buf
  mov rdx, 64
  syscall

foo:
  mov rax, 1
  mov rdi, 1
  mov rsi, msg
  mov rdx, 11
  syscall

_start:

    ; read from console
    mov rax, 0
    mov rdi, 0
    mov rsi, buf
    mov rdx, 64 
    syscall

    ; write read value to console
    ;mov rax, 1
    ;mov rdi, 1
    ;mov rsi, buf
    ;mov rdx, 64
    ;syscall

   mov eax, 2 
   mov edx, 2

   ; compairs eax to edx and if it's true it jumps hold
   cmp eax, edx
   je hold

   cmp eax, edx
   jz foo
 
    ; exit program
    mov rax, 60
    mov rsi, rsi
    syscall
