TITLE IMPRIMIRB
.MODEL SMALL
.DATA
    MSG1 DB "O numero binario e: $"

.CODE
MAIN PROC

    MOV AX,@DATA    ; acesso ao .data
    MOV DS,AX
   
    MOV BX, 0001h   ; valor teste

    MOV AH,9        ; imprimir a msg1
    LEA DX, MSG1
    INT 21h

    MOV CX,16       ; aciona 16 no contador cx

CONTA:
    
    SHL BX,1    ; move bx para a esquerda 1 bit
    JC EX1      ; compara cf com 1, se for vai ex1
    MOV AH,2    ; funcao para output do sistema
    MOV DL, '0' ; move '0' para dl
    INT 21h     ;imprime dl
    JMP NEXT    ;pula para o loop

EX1:
    
    MOV AH,2    ; funcao para output do sistema
    MOV DL, '1' ; move '1' para dl
    INT 21h     ;imprime dl

NEXT:
    LOOP CONTA  ;loop para conta

FIM:
    MOV AX,4Ch  ; finaliza o programa
    INT 21h

MAIN ENDP
END MAIN