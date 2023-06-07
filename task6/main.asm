; Функция принимает два параметра, это базовый адрес BaseAdress и количество элементов
; На это Heap'e будут лежать 4 байтовые целые числа , так как компилировать буду в x86
; занесение чисел на этот heap происходит в файле input.c
; Сумма будет в edi

[bits 32]
section .text
global main
extern input
extern printf

main:
    call input ;теперь eax = BaseAddress edx = количество элементов
    mov edi , 0

main_loop:
    cmp edx , 0
    je done
    add edi ,  [eax]
    sub edx , 1
    lea eax , [eax + 4]
    jmp main_loop

done:
    push edi
    push format
    call printf
    add esp , 8
    ret

section .rdata:
    format: db "Summ = %d" , 10 , 0

