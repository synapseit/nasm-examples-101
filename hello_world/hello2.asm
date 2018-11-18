; in the .data section, we define data before compilation
section .data
    ; define some raw bytes which represents our text string (1 byte: 1 char)
    ; "10" represents a new line in ASCII (i.e. the \n char)
    ; "text" is basically a label to the memory address where our text string begins
    text db "Hello, World!",10

; the actual program code goes in the .text section below
section .text
    global _start
 
_start:
;   call a subroutine, defined below.
    call _greet

;   call a subroutine to exit successfully
    call _exit

_greet:
;   this is equivalent to sys_write(1, text, 14). 
;   we move "1" in the rax register, representing the sys_write syscall ID value
    mov rax, 1
;   we move "1" in the rdi register, representing the STDOUT (which has code 1)
    mov rdi, 1
;   we move the memory address which the label "text" represents in the rsi register
    mov rsi, text
;   we move "14" in the rdx register, representing our string length (13 chars + 1 new line char)
    mov rdx, 14
    syscall
;   we return to the calling step
    ret

_exit:
;   this is equivalent to sys_exit(0)
;   we move "60" in the rax register, representing the sys_exit syscall ID value
    mov rax, 60
;   we move "0" in the "rdi" registry, representing a successful execution
    mov rdi, 0
    syscall
    ret
