all: entrada

entrada.o:
	nasm -f elf entrada.asm

entrada: entrada.o
	ld -m elf_i386 -s -o entrada entrada.o

clean:
	rm *.o entrada
