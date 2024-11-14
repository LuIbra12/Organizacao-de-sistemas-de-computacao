TITLE BINARIOS
.MODEL SMALL
.DATA
    MSG1 DB, "Entre com 0 ou 1: $" 
    
.CODE
MAIN PROC

    MOV AX,@DATA    ; acesso ao .data
    MOV DS,AX

    MOV CX,16   ; aciona 16 no contador cx
    XOR BX,BX   ; zera bx

    MOV AH,9    ; imprimir a msg1
    LEA DX, MSG1
    INT 21H


    MOV AH,1

CONTA:
    INT 21H     ;input do usuario
    CMP AL,13   ;compara o input com enter
    JE FIM      ; se for enter vai pra fim
    AND AL,0FH  ; se nao for trasnforma em numero
    SHL BX,1    ; move bx para a esquerda 1 bit
    OR BL,AL    ; insere no lsb de bx
    LOOP CONTA  ;loop ate 16


FIM:
    
    MOV AX,4CH  ;finaliza o programa
    INT 21H

MAIN ENDP
END MAIN

