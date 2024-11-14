TITLE PROGRAMA EXEMPLO PARA MANIPULACAO DE VETORES USANDO SI
.MODEL SMALL
.DATA
    VETOR DB 1,1,1,2,2,2
.CODE
MAIN PROC
    MOV AX,@DATA ; acessa @data
    MOV DS,AX

    XOR DL,DL   ; aciona dl
    MOV CX,6    ; move 6 para cs (contador de elementos do vetor)
    LEA SI, VETOR  ;acessa os dados do vetor no si

VOLTA:
    MOV DL,[SI] ; move o endereco de memoria de si para dl
    INC SI  ; incrementa si para ir para o proximo elemento do vetor
    ADD DL,30H ; transforma de numero para caractere
    
    CALL IMPRIME
    LOOP VOLTA ; se cx menor ou igual a 6 vai para volta

    MOV AH,4CH ; finaliza o programa
    INT 21H
MAIN ENDP 

IMPRIME PROC 
    MOV AH,2 ;imprimir o caractere em dl
    INT 21H 
    RET
IMPRIME ENDP

END MAIN
