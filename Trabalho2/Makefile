all: trab

trab.o:
	nasm -f elf trab.asm

trab: trab.o
	ld -m elf_i386 -s -o trab trab.o

clean:
	@rm -f *.o trab

