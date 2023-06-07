
all: run

main.elf: main.o input.o
	gcc -m32 -o $@ $^


%.o : %.c
	gcc -m32 -masm=intel -o $@ -c $<

%.o : %.asm
	nasm -felf -o $@ $<

run: main.elf
	./main.elf

clean:
	rm -rf *.o 
	rm -rf *.elf