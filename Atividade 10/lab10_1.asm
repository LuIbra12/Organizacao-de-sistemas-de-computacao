Title matriz1
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

    MATRIZ DB 1,2,3,4
           DB 4,3,2,1
           DB 5,6,7,8
           DB 8,7,6,5
.CODE
MAIN PROC

    MOV AX,@DATA    ; aciona o .data
    MOV DS,AX
    
    CALL IMPRIME    ; vai para o procedimento imprime

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

END MAIN




    


