TITLE PROGRAMA EXEMPLO PARA MANIPULACAO DE VETORES USANDO BX PARTE B
.MODEL SMALL
.DATA
    VETOR DB 1,1,1,2,2,2
.CODE
MAIN PROC

    MOV AX,@DATA ; acessa @data
    MOV DS,AX

    XOR DL,DL   ; aciona dl
    MOV CX,6    ; move 6 para cx (contador de elementos do vetor)
    XOR BX,BX   ; aciona bx

VOLTA:
    MOV DL, VETOR[BX] ; move o endereco de memoria de bx para dl
    INC BX  ; incrementa bx para ir pro proimo elemento do vetor
    ADD DL,30H ; transforma de numero para caractere
    CALL IMPRIME
    LOOP VOLTA  ; se cx for menor ou igual a 6 vai para volta

    MOV AH,4CH  ; finaliza o programa
    INT 21H
MAIN ENDP

IMPRIME PROC 
    MOV AH,2 ;imprimir o caractere em dl
    INT 21H 
    RET
IMPRIME ENDP

END MAIN