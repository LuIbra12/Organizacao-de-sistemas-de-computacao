TITLE letras 
.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    MOV AH,2 ; Exibe a na tela

    MOV CX,26  ;26 para o contador cx pois sao 26 leras do alfabeto
    MOV DL,"A" ;1aM letra para dl

MAIUSCULAS:
    INT 21H ; executa funcao 2
    INC DL ;Incrementa em DL, para passar para a proxima letra
    LOOP MAIUSCULAS ;loop 

    MOV CX,0 ;reinicia o contador
    MOV CX,26 ; ;26 para o contador cx pois sao 26 leras do alfabeto
    MOV DL,"a" ; 1am letra para dl
MINUSCULAS:
    INT 21H ; executa funcao 2
    INC DL ;Incrementa em DL, para passar para a proxima letra
    LOOP MINUSCULAS ;loop

    MOV AH,4CH ; finaliza o programa
    INT 21H
MAIN ENDP
END MAIN

