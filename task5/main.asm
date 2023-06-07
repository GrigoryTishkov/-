;eax - неотрицательное целое число x
; if x >= 16 -> (x - 11) ^ 2 + 125
;if x < 16 x^2 + 72x + 6400
;вернем в тоже в eax

section .text
global main
extern printf
extern input

main:
    call input
    
    cmp eax , 16
    jl func_case2


func_case1:
    sub eax , 11
    mul eax
    add eax , 125
    call print_this
    ret 


func_case2:
    mov edi , eax
    mul eax
    add eax , 6400
    mov ecx , eax 
    mov eax , edi 
    mov edi , 72
    mul edi
    add ecx , eax
    mov eax , ecx
    call print_this
    ret

print_this:
    push eax 
    push message
    call printf
    add esp , 8
    ret


message db "Answer= %d", 10, 0


