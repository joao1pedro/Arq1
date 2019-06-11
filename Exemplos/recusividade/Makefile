all: fat

fat.o:
	nasm -f elf fat.asm

fat: fat.o
	ld -m elf_i386 -s -o fat fat.o

clean:
	@rm -f *.o fat sum mul

sum.o:
	nasm -f elf sum.asm

sum: sum.o
	ld -m elf_i386 -s -o sum sum.o

mul.o:
	nasm -f elf mul.asm

mul: mul.o
	ld -m elf_i386 -s -o mul mul.o

