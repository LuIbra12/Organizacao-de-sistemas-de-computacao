Title Letras
.MODEl SMALL
.DATA
    ;  A mensagem que requisita ao usuario uma letra minuscula e devolve a letra escolhida so que maiuscula
    MSG1 DB     "Digite uma letra minuscula: $"
    MSG2 DB 13,10,    "A letra maiuscula correspondente é: $"

.CODE
MAIN PROC

    ; Permitir o acesso as variaveis definidas em .DATA
    MOV AX,@DATA
    MOV DS,AX

    ;   Exibir na tela do usuario a MSG1 e requisitar a letra minuscula
    MOV AH,9
    LEA DX,MSG1
    INT 21h

    ; Lê a letra minuscula esolhida pelo usuario
    MOV AH,1
    INT 21h

    ; copia o caracter para BL
    MOV BL,AL

    ; transformar de minusculo para maiusculo
    SUB BL,20h

   ;   Exibir na tela do usuario a MSG1 e requisitar a letra minuscula
    MOV AH,9
    LEA DX,MSG2
    INT 21h

    ; Exibir a letra convertida
    MOV AH,2
    MOV DL,BL
    INT 21h

    ; Finaliza o programa
    MOV AH,4CH
    INT 21h
MAIN ENDP
END MAIN
