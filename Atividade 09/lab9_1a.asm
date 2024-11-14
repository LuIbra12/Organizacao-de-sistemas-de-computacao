TITLE PROGRAMA EXEMPLO PARA MANIPULACAO DE VETORES USANDO BX
.MODEL SMALL
.DATA  

    VETOR DB 1,1,1,2,2,2
.CODE
MAIN PROC
    
    MOV AX,@DATA ;acessa @data
    MOV DS,AX
    
    XOR DL,DL   ; aciona DL
    MOV CX,6    ; move 6 para cx (contador de elementos)
    LEA BX,VETOR ;chama o vetor que esta em @data

VOLTA:
    
    MOV DL,[BX] ; move o endereco de memoria de bx para dl
    INC BX ; incrementa bx para ir para o proximo elemento do vetor
    ADD DL,30H ; numero transorma para caractere
    CALL IMPRIME
    LOOP VOLTA ;cx for menor ou igual a 6 vai pra volta
    
    MOV AH,4CH ;finaliza o programa
    INT 21H

MAIN ENDP

IMPRIME PROC 
    MOV AH,2 ;imprimir o caractere em dl
    INT 21H 
    RET
IMPRIME ENDP

END MAIN
