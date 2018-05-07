all: hw4

hw4.o: hw4.asm
	nasm -f elf32 -g -F stabs hw4.asm
	
hw4: hw4.o
	ld -m elf_i386 -o hw4 hw4.o


rebuild: b

a: hw4.asm
	nasm -f elf32 -g -F stabs hw4.asm
	
b: a
	ld -m elf_i386 -o hw4 hw4.o


clean:
	rm *.o hw4