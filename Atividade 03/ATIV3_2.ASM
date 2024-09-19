Title Caractere
.MODEL SMALL
.STACK 100h
.DATA
    MSG1 DB    "Digite um caractere: $"
    MSG2 DB    10,13, "O caractere digitado e um numero.$"
    MSG3 DB    10,13, "O caractere digitado e uma letra.$"
    MSG4 DB    10,13, "O caractere digitado e um caractere desconhecido.$"
.CODE
MAIN PROC
    ; Permite o acesso às variáveis definidas em .DATA 
    MOV AX,@DATA
    MOV DS,AX

    ; Exibe na tela a string MSG1 (“Digite um caractere: ”)
    MOV AH,9
    LEA DX,MSG1
    INT 21h

    ; Lê um caractere do teclado e salva o caractere lido em AL
    MOV AH,1
    INT 21h

    ; Copia o caractere lido para BL
    MOV BL,AL

   ; Compara o caractere em BL com o valor 48 (código ASCII do caracter “0”)
    CMP BL,48

    ; ; Se o caractere em BL for menor que 48 (“0”), salta para o rótulo NAOENUMERO
    JB DESCONHECIDO

    ; Compara o caractere em BL com o valor 57 (código ASCII do caracter “9”)
    CMP BL,57

    ; Se o caractere em BL for maior que 57 (“9”), salta para o rótulo NAOENUMERO
    JA NAOENUMERO

     ; Se chegou até aqui, exibe na tela dizendo que o caracter é um número 
    MOV AH,9
    MOV DX,OFFSET MSG2
    INT 21h

    ; Salta para o rótulo FIM
    JMP FIM 

    ; Define o rótulo NAOENUMERO
    NAOENUMERO:

    ; Compara o caractere em BL com o valor 65 (código ASCII do caracter “A”)
    CMP BL,65

    ; ; Se o caractere em BL for menor que 65 (“A"), salta para o rótulo NAOELETRA
    JB DESCONHECIDO

    ; Compara o caractere em BL com o valor 90 (código ASCII do caracter “Z”)
    CMP BL,90

    ; ; Se o caractere em BL for maior que 90 (“Z"), salta para o rótulo NAOELETRA
    JA NAOELETRAM

    ; Se chegou até aqui, exibe na tela dizendo que o caracter é um número 
    MOV AH,9
    MOV DX,OFFSET MSG3
    INT 21h

    ; Salta para o rótulo FIM
    JMP FIM 

    ; Define o rótulo NAOELETRA
    NAOELETRAM:

    ; Compara o caractere em BL com o valor 97 (código ASCII do caracter “a”)
    CMP BL,97

    ; ; Se o caractere em BL for menor que 97 (“a"), salta para o rótulo NAOELETRA
    JB DESCONHECIDO

    ; Compara o caractere em BL com o valor 122 (código ASCII do caracter “z”)
    CMP BL,122

    ; ; Se o caractere em BL for menor que 122 (“z"), salta para o rótulo NAOELETRA
    JA DESCONHECIDO

    ; Se chegou até aqui, exibe na tela dizendo que o caracter é uma letra
    MOV AH,9
    MOV DX,OFFSET MSG3
    INT 21h

    ; Salta para o rótulo FIM
    JMP FIM 

    ; Define o rótulo DESCONHECIDO
    DESCONHECIDO:

    ; Exibe na tela a string MSG4 (“"O caractere digitado e um caractere desconhecido”)
    MOV AH,9
    LEA DX,MSG4
    INT 21h

    ; Define o rótulo FIM
    FIM:

    ; Finaliza o programa
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN
    




