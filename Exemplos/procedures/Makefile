all: sum

clean:
	@rm -f *.o fat sum mul

sum.o:
	nasm -f elf sum.asm

sum: sum.o
	ld -m elf_i386 -s -o sum sum.o
