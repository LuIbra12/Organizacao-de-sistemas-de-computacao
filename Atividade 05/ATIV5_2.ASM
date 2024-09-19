TITLE Exibir '*' 50 vezes c/looop
.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB '*'    ; Define o caractere a ser impresso

.CODE
MAIN PROC
    ; Configura o segmento de dados
            MOV AX, @DATA
            MOV DS, AX

   
            MOV CX, 0      ; Inicializa o contador
    REPETE1:
            MOV DL, MSG1     ; Carrega o caractere '*' em DL
            MOV AH,2     ; Função de impressão de caractere
            INT 21H          ; Chama a interrupção para imprimir
            CMP CX, 50       ; Compara CL com 50
            LOOP REPETE1

    ; Imprime nova linha
            MOV AH,2
            MOV DL, 10       ; Line feed
            INT 21H

    ; Reinicia o contador para a próxima repetição
            MOV CX, 0
    REPETE2:
            MOV DL, MSG1     ; Carrega novamente o caractere '*'
            MOV AH,2
            INT 21H          ; Imprime o caractere
    ; Imprime nova linha  
            MOV AH,2
            MOV DL, 10       ; Line feed
            INT 21H
       
            CMP CX, 50       ; Compara CL com 50
            LOOP REPETE2

    ; Finaliza o programa
            MOV AX, 4CH    ; Termina o programa
            INT 21H
MAIN ENDP
END MAIN
