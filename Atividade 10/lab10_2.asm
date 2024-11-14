Title matriz2
.MODEL SMALL
.STACK 100H

PULALINHA MACRO 
    PUSH AX        ; ax para a pilha para nao perder o valor
    PUSH DX        ; dx para a pilha para nao perder o valor
    MOV AH,2       ; imprime um pula linha
    MOV DL,10
    INT 21H
    POP AX         ; ax sai da pilha
    POP DX         ; dx sai da pilha
ENDM

.DATA

        
    MATRIZ DB 1,0,0,0
           DB 0,0,0,1
           DB 0,0,1,0
           DB 0,1,0,0

    SOMA DB 10,13, 'SOMA: $.'
.CODE
MAIN PROC

    MOV AX,@DATA    ; aciona o .data
    MOV DS,AX
    
    CALL IMPRIME    ; vai para o procedimento imprime
    CALL SOMA1      ; vai para o procedimento soma 1

    MOV AH,4CH      ; finaliza  programa
    INT 21H

MAIN ENDP

IMPRIME PROC
    XOR BX,BX       ; inicializa o bx para apontar para a 1a linha
REP2:   
    MOV AH,2        ; chama a funcao para exibir
    MOV CX,4        ; cx 4 (numero de vezes a fazer)
    XOR SI,SI       ; Si para apontar para a primeira coluna

REP1:

    MOV AL, MATRIZ[BX][SI]  ;valor de bx si vai para al
    MOV DL,AL   ; al para dl para a impressao
    OR DL,30H   ; transforma em caracter
    INT 21H  
    INC SI      ; si aponta para o prox elemento
    LOOP REP1   ; se cx nao for 0 vai para rep1
    
    PULALINHA   ; macro pulalinha
    
   
    ADD BX,4    ; vai para a prox linha
    CMP BX,16   ; checa se ja fez todas as vezes necessarias
    JNE REP2    ; se nao fez vai para rep2
    RET
IMPRIME ENDP

SOMA1 PROC
    XOR DX,DX   ; inicializa dx
    XOR BX,BX   ; inicializa o bx para apontar para a 1a linha
REP4:   
    MOV CX,4     ; cx 4 (numero de vezes a fazer)
    XOR SI,SI    ; Si para apontar para a primeira coluna
        
REP3:

    ADD DL, MATRIZ[BX][SI]  ; adiciona o elemento em dl

    INC SI      ; prox elemento
    LOOP REP3   ; se nao fez 4 vezes repete
   
    ADD BX,4    ; vai para a prox linha
    CMP BX,16   ; checa se ja fez todas as vezes necessarias
    JNE REP4    ; se nao fez vai para rep4
    PUSH DX     ; valor de dx vai para a pilha
    MOV AH,9    ; exibe a msg soma
    LEA DX,SOMA
    INT 21H
    POP DX      ; volta o valor anterior de dx da pilha
    OR DL,30H   ; transforma em caracter
    MOV AH,2    ; imprime a soma
    INT 21H
    RET

SOMA1 ENDP
END MAIN



