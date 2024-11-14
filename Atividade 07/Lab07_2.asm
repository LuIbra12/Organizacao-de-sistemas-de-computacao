Title soma
.MODEL SMALL
.DATA
    MSG1 DB, "Digite o multiplicando: $."
    MSG2 DB, 10,13, "Digite o muliplicador: $."
    MSG3 DB, 10,13, "Produto: $."
.CODE
MAIN PROC

    XOR CX,CX
    MOV AX,@DATA ; Permite acesso as variaveis de @data
    MOV DS,AX

    MOV AH,9    ;imprime a msg1
    LEA DX,MSG1
    INT 21H

    MOV AH,1    ; le um caractere do teclado
    INT 21H
    AND AL,0FH  ; transforma em numero
    MOV BL,AL   ; salva em bl o multiplicando

    MOV AH,9    ;imprime a msg2
    LEA DX,MSG2
    INT 21H

    MOV AH,1    ; le um caractere do teclado
    INT 21H
    AND AL,0FH  ; transforma em numero
    MOV CL,AL   ; salva em Cl o multiplicador

SOMA:
    ADD CH,BL   ; adiciono o multiplicando em ch
    DEC CL      ; decremento o multiplicador
    JNE SOMA    ; menor ou igual vai para soma

IMPRIMIR:
    MOV AH,9       ; imprime a msg3
    LEA DX,MSG3 
    INT 21h

    MOV AH,02
    OR CH,30H      ; transforma em caractere
    MOV DL,CH      ; produto para dl
    INT 21H
    
    MOV AH,4CH     ; finaliza o programa
    INT 21h
MAIN ENDP
END MAIN

