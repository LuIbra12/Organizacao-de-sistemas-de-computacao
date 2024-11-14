TITLE PROGRAMA EXEMPLO PARA MANIPULACAO DE VETORES USANDO DI
.MODEL SMALL
.DATA
    VETOR DB 1,1,1,2,2,2
.CODE
MAIN PROC
    MOV AX,@DATA ; acessa @data
    MOV DS,AX

    XOR DL,DL   ; aciona dl
    MOV CX,6    ; move 6 para cx (contador de elementos do vetor)
    XOR DI,DI   ; aciona di

VOLTA:
    MOV DL, VETOR[DI] ;move o valor do endereco de memoria do 1o elemento do vetor (que esta em bx) para dl
    INC DI ; incrementa di para ir ao proximo elemento
    ADD DL,30H  ; trasnforma numero para caractere
    CALL IMPRIME
    LOOP VOLTA ; se cx for menor igual a 6 vai para volta 

    MOV AH,4CH ; finaliza o programa
    INT 21H
MAIN ENDP

IMPRIME PROC 
    MOV AH,2 ;imprimir o caractere em dl
    INT 21H 
    RET
IMPRIME ENDP

END MAIN
