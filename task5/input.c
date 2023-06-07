#include "stdio.h"

void input(){
    int number;
    scanf("%d" , &number);
    __asm__(
        "nop" 
        : 
        : "a"(number)
    );
}