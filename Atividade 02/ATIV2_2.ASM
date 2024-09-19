Title soma
.MODEL SMALL
.DATA
     ;  A mensagem que requisita ao usuario um numero de 0 a 9, repete a priemira mensagem, a mensagem do resultado da soma dos escolhidos anteriormente
    MSG1 DB     "Digite um primeiro numero: $"
    MSG2 DB 13,10,    "Digite um segundo numero: $"
    MSG3 DB 13,10,      " A soma dos dois numeros é: $"

.CODE
MAIN PROC
   
    ; Permitir o acesso as variaveis definidas em .DATA
    MOV AX,@DATA
    MOV DS,AX

     ;   Exibir na tela do usuario a MSG1 e requisitar o numero entre 0 a 9
    MOV AH,9
    LEA DX,MSG1
    INT 21h

    ; Lê o primeiro numero pelo usuario
    MOV AH,1
    INT 21h

    ; copia o caracter para BL
    MOV BL,AL

     ;   Exibir na tela do usuario a MSG1 e requisitar a letra minuscula
    MOV AH,9
    LEA DX,MSG2
    INT 21h

    ; Lê o segundo numero pelo usuario
    MOV AH,1
    INT 21h

    ; copia o caracter para CL
    MOV CL,AL

    ; subtrair o 0 para conversao
    SUB BL, "0"
    SUB CL, "0"

     ;Somar os numeros escolhidos
    ADD BL,CL

    ; Somar 0 em BL/ transformar em decimal
    ADD Bl,"0"

     ;   Exibir na tela do usuario a MSG3 
    MOV AH,9
    LEA DX,MSG3
    INT 21h

    ; Exibir a soma
    MOV AH,2
    MOV DL,BL
    INT 21h

    ; Finaliza o programa
    MOV AH,4CH
    INT 21h
MAIN ENDP
END MAIN

