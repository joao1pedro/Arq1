%include "io.inc"
section .data
    CaseTable DB 1
    DD ESCREVER_MATRIZ
    EntrySize EQU ($ - CaseTable)
    DB 2
    DD PRINT
    DB 3
    DD MUL_ESC
    DB 4
    DD MUL_VET
    DB 5
    DD IGUALDADE
    DB 6
    DD OPOSTA
    DB 7
    DD SOMA
    DB 8
    DD SUBTRACAO
    DB 9
    DD TRANSPOSTA
    DB 10
    DD MULT
    NumberOfEntries EQU ($ - CaseTable) / EntrySize   
    
    matrix db 1,2,3,4,5,6,7,8,9 ;matriz pre definida para ser usada na função IMPRIME
    
    sizeM  equ ($-matrix)/1
    
section .bss
    matrizA resd 25
    matrizB resd 25
    matrizRes resd 25
    totalRes resd 1
    numLin resd 1
    numCol resd 1
    escalar resd 1
    totalA resd 1
    vetor resd 25
    lenV resd 1
    
section .text
global CMAIN
CMAIN:
    
    call MENU
    
QUIT:
    xor eax, eax
    ret

MENU:    
    
    GET_DEC 1, al
    mov ebx, CaseTable
    mov ecx, NumberOfEntries
    L1: cmp al,[ebx]
    jne L2
    xor edx, edx
    call [ebx + 1]
    jmp QUIT
    L2: add ebx,EntrySize
    dec ecx
    JNZ L1
    ret
        
    
ESCREVER_MATRIZ:
    GET_DEC 1, [numLin] ;le numero de linhas
    GET_DEC 1, [numCol] ;le numero de colunas
    mov eax, [numLin] ;move para eax numero de linhas
    mul byte[numCol] ;multiplica eax por numero de colunas
    
    
    mov [totalA], eax ;move para variavel totalA o resultado de eax (tamanho da matriz)
    mov ecx, [totalA] ;move para ecx o tamanho da matriz
    mov [totalRes], ecx
    mov esi, 0 ;inicializa esi em 0
    
    .L1:
        GET_DEC 1, [matrizA+esi] ;le os valores da matriz
        inc esi ;passa para o proximo elemento
        loop .L1
        
     .PRINT:
        mov esi,0
        mov eax,0 ;iterador da linha
        mov ebx,0 ;iterador da coluna
    .IMPRIMIR:    
        PRINT_DEC 1,[matrizA + (esi*1)]
        inc esi
        inc eax
        cmp eax,[numLin]
        je .NL
        jmp .IMPRIMIR
        
        
    .NL:
        xor eax,eax
        NEWLINE
        inc ebx
        cmp ebx,[numCol]
        JE  QUIT
        JMP .IMPRIMIR
        ret
MUL_ESC:
    GET_DEC 1, [numLin] ;le numero de linhas
    GET_DEC 1, [numCol] ;le numero de colunas
    mov eax, [numLin] ;move para eax numero de linhas
    mul byte[numCol] ;multiplica eax por numero de colunas
    GET_DEC 1, [escalar] ;le o valor de escalar
    mov esi, 0
    mov [totalA], eax
    mov ecx, [totalA]
    push esi
    push ecx
    .L1: ;ler matriz A para poder multiplicar pelo escalar
        GET_DEC 1, [matrizA+esi] ;le os valores da matriz
        inc esi ;passa para o proximo elemento
        loop .L1
        pop ecx ;restaura ecx
        pop esi ;restaura esi
    .L2: 
    mov eax, [matrizA+esi] ;move para eax o valor da posição da matriz
    mul byte[escalar] ;multiplica eax por escalar
    mov [matrizRes+esi], eax ;move para matriz resultado o valor de eax
    inc esi ;incrementa esi
    loop .L2
    mov esi, 0 
    mov ecx, [totalA]
    
    .PRINT:
        mov esi,0
        mov eax,0 ;iterador da linha
        mov ebx,0 ;iterador da coluna
    .IMPRIMIR:    
        PRINT_DEC 1,[matrizRes + (esi*1)]
        inc esi
        inc eax
        cmp eax,[numLin]
        je .NL
        jmp .IMPRIMIR
            
    .NL:
        xor eax,eax
        NEWLINE
        inc ebx
        cmp ebx,[numCol]
        JE  QUIT
        JMP .IMPRIMIR
        
    ret
MUL_VET:
    mov esi, 0
    GET_DEC 1, [numLin] ;le numero de linhas
    GET_DEC 1, [numCol] ;le numero de colunas
    
    
    mov eax, [numLin] ;move para eax numero de linhas
    mul byte[numCol] ;multiplica eax por numero de colunas
    mov [totalA], eax
    mov [totalRes], eax
    mov ecx, [totalA]
    push esi
    
    .L1: ;ler matriz A 
        GET_DEC 1, [matrizA+esi] ;le os valores da matriz
        inc esi ;passa para o proximo elemento
        loop .L1
        pop esi ;restaura esi
    GET_DEC 1, [lenV] ;le tamanho do vetor
    mov ecx, [lenV] ;move para ecx o tamanho do vetor
    .L2:
        GET_DEC 1, [vetor+esi] ;le os elementos do vetor
        inc esi
        loop .L2
        mov esi, 0
        mov ecx, [lenV]
    .L3:
        mov eax, [matrizA+esi] ;move para eax a posição esi da matriz
        mov ebx, [vetor+esi] ;move para ebx o elemento do vetor na posição esi
        mul ebx ;multiplica eax por ebx
        mov [matrizRes+esi], eax ;move para a matriz resultado o resultado da multiplicacao
        inc esi
        loop .L3
        mov esi, 0
        mov ecx, [totalRes]
     
     .PRINT:
        mov esi,0
        mov eax,0 ;iterador da linha
        mov ebx,0 ;iterador da coluna
    .IMPRIMIR:    
        PRINT_DEC 1,[matrizRes + (esi*1)]
        inc esi
        inc eax
        cmp eax,[numLin]
        je .NL
        jmp .IMPRIMIR
        
        
    .NL:
        xor eax,eax
        NEWLINE
        inc ebx
        cmp ebx,[numCol]
        JE  QUIT
        JMP .IMPRIMIR
            
    ret
IGUALDADE:
    mov esi, 0
    GET_DEC 1, [numLin] ;le numero de linhas
    GET_DEC 1, [numCol] ;le numero de colunas
    mov eax, [numLin] ;move para eax numero de linhas
    mul byte[numCol] ;multiplica eax por numero de colunas
    mov [totalA], eax
    mov ecx, [totalA] ;matriz B pra ser igual a matriz A precisa ter o mesmo tamanho
    push esi
    push ecx
    
    .L1:
        GET_DEC 1, [matrizA+esi] ;le matriz B
        inc esi
        loop .L1
        pop ecx
        pop esi
    .L2:
        GET_DEC 1, [matrizB+esi] ;le matriz B
        inc esi
        loop .L2
        mov ecx, [totalA]
        mov esi, 0
    .L3:
        mov eax, [matrizA+esi] ;move elemento do indice i da matriz A para eax
        mov ebx, [matrizB+esi] ;move elemento do indice i da matriz B para ebx
        cmp eax, ebx ;compara eax e ebx
        jne NEQ ;se nao forem iguais salta para label NEQ
        mov eax, 1 ;se continuou, portanto sao iguais, eax recebe 1
        inc esi ;passa para o proximo elemento
        loop .L3
        
        jmp SHOWEQ ;mostra o resultado final de eax
        
        ret
SHOWEQ:  
       PRINT_DEC 1, eax 
       jmp QUIT
        

NEQ: mov eax, 0 ;nao sao iguais, eax recebe 0 e ja sai da execucao
    jmp SHOWEQ
    
OPOSTA:
    mov esi, 0
    GET_DEC 1, [numLin] ;le numero de linhas
    GET_DEC 1, [numCol] ;le numero de colunas
    mov eax, [numLin] ;move para eax numero de linhas
    mul byte[numCol] ;multiplica eax por numero de colunas
    mov [totalA], eax
    mov ecx, [totalA] ;matriz B pra ser igual a matriz A precisa ter o mesmo tamanho
    push esi
    push ecx
    .L1:
        GET_DEC 1, [matrizA+esi] ;le matriz A
        inc esi
        loop .L1
        pop ecx
        pop esi
    .L2:
        mov eax, [matrizA+esi] ;move posicao i da matriz para eax
        neg eax ;faz negação de eax
        mov [matrizRes+esi], eax ;move eax para posição i da matriz resultado
        inc esi
        loop .L2
        mov ecx, [totalA]
        mov esi, 0
    
    .PRINT:
        mov esi,0
        mov al,0 ;iterador da linha
        mov bl,0 ;iterador da coluna
    .IMPRIMIR:    
        PRINT_DEC 1,[matrizRes + (esi*1)]
        inc esi
        inc eax
        cmp eax,[numLin]
        je .NL
        jmp .IMPRIMIR
                
    .NL:
        xor eax,eax
        NEWLINE
        inc ebx
        cmp ebx,[numCol]
        JE  QUIT
        JMP .IMPRIMIR
        
    ret
SOMA:
    mov esi, 0
    GET_DEC 1, [numLin] ;le numero de linhas
    GET_DEC 1, [numCol] ;le numero de colunas
    mov eax, [numLin] ;move para eax numero de linhas
    mul byte[numCol] ;multiplica eax por numero de colunas
    mov [totalA], eax
    mov ecx, [totalA] ;matriz B pra ser igual a matriz A precisa ter o mesmo tamanho
    push esi
    push ecx
    .L1:
        GET_DEC 1, [matrizA+esi] ;le matriz A
        inc esi
        loop .L1
        pop ecx
        pop esi
    .L2:
        GET_DEC 1, [matrizB+esi] ;le matriz B
        inc esi
        loop .L2
        mov ecx, [totalA]
        mov esi, 0
    .L3:
        mov eax, [matrizA+esi] ;move posicao i da matriz para eax
        mov ebx, [matrizB+esi]
        add eax, ebx
        mov [matrizRes+esi], eax ;move eax para posição i da matriz resultado
        inc esi
        loop .L3
        mov ecx, [totalA]
        mov esi, 0
        push ecx
        push esi
    .COPY:
        mov eax, [matrizRes+esi]
        mov [matrizA+esi], eax
        loop .COPY
        pop esi
        pop ecx
    .PRINT:
        mov esi,0
        mov al,0 ;iterador da linha
        mov bl,0 ;iterador da coluna
    .IMPRIMIR:    
        PRINT_DEC 1,[matrizA + (esi*1)]
        inc esi
        inc al
        cmp al,2
        je .NL
        jmp .IMPRIMIR
        
    .NL:
        xor al,al
        NEWLINE
        inc bl
        cmp bl,2
        JE  QUIT
        JMP .IMPRIMIR
     
    ret
    
SUBTRACAO:
    mov esi, 0
    GET_DEC 1, [numLin] ;le numero de linhas
    GET_DEC 1, [numCol] ;le numero de colunas
    mov eax, [numLin] ;move para eax numero de linhas
    mul byte[numCol] ;multiplica eax por numero de colunas
    mov [totalA], eax
    mov ecx, [totalA] ;matriz B pra ser igual a matriz A precisa ter o mesmo tamanho
    push esi
    push ecx
    .L1:
        GET_DEC 1, [matrizA+esi] ;le matriz A
        inc esi
        loop .L1
        pop ecx
        pop esi
    .L2:
        GET_DEC 1, [matrizB+esi] ;le matriz B
        inc esi
        loop .L2
        mov ecx, [totalA]
        mov esi, 0
    .L3:
        mov eax, [matrizA+esi] ;move posicao i da matriz para eax
        mov ebx, [matrizB+esi]
        sub eax, ebx
        mov [matrizRes+esi], eax ;move eax para posição i da matriz resultado
        inc esi
        loop .L3
        mov ecx, [totalA]
        mov esi, 0
        push ecx
        push esi
    .COPY:
        mov eax, [matrizRes+esi]
        mov [matrizA+esi], eax
        loop .COPY
        pop esi
        pop ecx
    .PRINT:
        mov esi,0
        mov eax,0 ;iterador da linha
        mov eax,0 ;iterador da coluna
    .IMPRIMIR:    
        PRINT_DEC 1,[matrizA + (esi*1)]
        inc esi
        inc eax
        cmp eax,[numLin]
        je .NL
        jmp .IMPRIMIR   
        
    .NL:
        xor eax,eax
        NEWLINE
        inc ebx
        cmp ebx,[numCol]
        JE  QUIT
        JMP .IMPRIMIR
     
    ret
    
TRANSPOSTA:
    mov esi, 0
    mov edi, 0
    GET_DEC 1, [numLin] ;le numero de linhas
    GET_DEC 1, [numCol] ;le numero de colunas
    mov eax, [numLin] ;move para eax numero de linhas
    mul byte[numCol] ;multiplica eax por numero de colunas
    mov [totalA], eax
    mov ecx, [totalA] ;matriz B pra ser igual a matriz A precisa ter o mesmo tamanho
    push ecx
    push esi
    mov ebp, [numLin]
    .L1:
        GET_DEC 1, [matrizA+esi] ;le matriz A
        inc esi
        loop .L1
        pop ecx
        pop esi
    .L2:
        mov eax, [matrizA+esi]
        mov ebx, [matrizA+edi]
        mov [matrizRes+esi], ebx
        mov [matrizRes+edi], eax
        inc esi
        add edi, 2
        loop .L2
        mov esi, 0
        mov ecx, [totalA]
    .L3:
        PRINT_DEC 1, [matrizRes+esi] ;mostra valor da matriz resultado
        inc esi
        loop .L3
    ret
    
PRINT:
        mov esi,0
        mov eax,0 ;iterador da linha
        mov ebx,0 ;iterador da coluna
    IMPRIMIR:    
        PRINT_DEC 1,[matrix + (esi*1)]
        inc esi
        inc eax
        cmp eax,3 ;compara com iterador de linha
        je NL
        jmp IMPRIMIR    
        
    NL:
        xor eax,eax
        NEWLINE
        inc ebx
        cmp ebx,3 ;compara com iterador de coluna
        JE  QUIT
        JMP IMPRIMIR
           
MULT:
    mov esi, 0
    GET_DEC 1, [numLin] ;le numero de linhas
    GET_DEC 1, [numCol] ;le numero de colunas
    mov eax, [numLin] ;move para eax numero de linhas
    mul byte[numCol] ;multiplica eax por numero de colunas
    mov [totalA], eax
    mov ecx, [totalA] ;matriz B pra ser igual a matriz A precisa ter o mesmo tamanho
    push esi
    push ecx
    .L1:
        GET_DEC 1, [matrizA+esi] ;le matriz A
        inc esi
        loop .L1
        pop ecx
        pop esi
    .L2:
        GET_DEC 1, [matrizB+esi] ;le matriz B
        inc esi
        loop .L2
        mov ecx, [totalA]
        mov esi, 0
        
    ret
    