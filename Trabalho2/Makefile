all: test

test.o:
	nasm -f elf test.asm

test: test.o
	ld -m elf_i386 -s -o test test.o

clean:
	@rm -f *.o test

