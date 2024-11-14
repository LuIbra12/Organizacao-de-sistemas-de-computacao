Title divisao
.MODEL SMALL
.DATA

    MSG1 DB, "Digite o dividendo: $."
    MSG2 DB, 10,13, "Digite o divisor: $."
    MSG3 DB, 10,13, "Quociente: $."
    MSG4 DB, 10,13, "Resto: $."
.CODE
MAIN PROC
    XOR CL, CL   ; quociente

    MOV AX,@DATA ; Permite acesso as variaveis de @data
    MOV DS,AX

    MOV AH,9    ;imprime a msg1
    LEA DX,MSG1
    INT 21H

    MOV AH,1    ; le um caractere do teclado
    INT 21H
    AND AL,0FH  ; transforma em numero
    MOV BL,AL   ; salva em bl o dividendo

    MOV AH,9    ;imprime a msg2
    LEA DX,MSG2
    INT 21H

    MOV AH,1    ; le um caractere do teclado
    INT 21H
    AND AL,0FH  ; transforma em numero
    MOV DL,AL   ; salva em dl o divisor

SUBTRAIR:
    CMP BL,DL      ; compara o dividendo com o divisor
    JB IMPRIMIR    ; se for menor pula para imprimir
    SUB BL,DL     ; subtrai o dividendo do divisor
    INC CL        ; incrementa 1 no quociente
    JMP SUBTRAIR   ; faz um loop para subtrai

IMPRIMIR:

    MOV AH,9       ; imprime a msg3
    LEA DX,MSG3
    INT 21h
    OR CL,30H      ; trasnforma em caractere
    MOV DL,CL
    MOV AH,2       ; exibe o valor do quociente
    INT 21h

    MOV AH,9       ; imprime a msg4
    LEA DX,MSG4
    INT 21h
    OR BL,30H      ; trasnforma em caractere
    MOV DL,BL
    MOV AH,2       ; exibe o valor do resto
    INT 21H

    MOV AH,4CH     ; finaliza o programa
    INT 21h
MAIN ENDP
END MAIN





