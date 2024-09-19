Title caractere
.MODEL SMALL
.DATA
    ; Exibir a mensagem que requisita o caractere e a mensagem informando qual caractere foi digitado pelo usuario 
    MSG1 DB     "Digite um caractere: $"
    MSG2 DB 13,10,  "O caractere digitado foi: $"
.CODE
MAIN PROC
     ; Permite o acesso às variáveis definidas em .DATA
    MOV AX,@DATA
    MOV DS,AX

    ; Exibe na tela do usuario a MSG1 e requisita o caractere para o usuario
    MOV AH,9
    LEA DX,MSG1
    INT 21h

    ; Lê o caractere escolhido pelo usuario e salva em AL
    MOV AH,1 
    INT 21h

    ; Copia o caracter lido para BL
    MOV BL,AL

    ; Pula uma linha
    MOV AH,2
    MOV DL,10
    INT 21h

    ; Exibe a MSG2 com o caractere escolhido pelo usuario
    MOV AH,9
    LEA DX,MSG2
    INT 21h

    ; Exibe o caracter lido (salvo em BL)
    MOV AH,2
    MOV DL,BL
    INT 21h

   ; Finaliza o Programa
    MOV AH,4Ch
    INT 21h
MAIN ENDP
END MAIN