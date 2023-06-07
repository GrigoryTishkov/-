#include <stdio.h>
#include <malloc.h>

void input(){
    int number_of_elements;
    printf("Input number of elements: ");
    scanf("%d" , &number_of_elements);
    int* BaseAddress = (int*)malloc(sizeof(int) *  number_of_elements);
    for (int i = 0 ; i < number_of_elements ; ++i){
        int curr_elem;
        scanf("%d" , &curr_elem);
        BaseAddress[i] = curr_elem;
    }

    //теперь надо вернуть BaseAddress и number_of_elements в eax и edx соответсевнно
    __asm__(
        ""
        :
        :"a"(BaseAddress) , "d"(number_of_elements)
    );
} 