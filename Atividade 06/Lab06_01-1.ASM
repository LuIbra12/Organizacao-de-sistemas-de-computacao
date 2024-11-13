TITLE WHILE
.MODEL SMALL
.STACK 100H
.DATA
    CONTADOR DB 0           ; Contador de caracteres

.CODE
MAIN PROC
    MOV AX, @DATA           ; Inicializa o segmento de dados
    MOV DS, AX

    MOV AH, 1               ; Funcao para ler um caractere
LOOP_1:
    INT 21H                 ; Executa a funcao
    CMP AL, 0DH             ; Compara com CR
    JE CONTA                ; Se for CR, pula para imprimir
    INC CONTADOR            ; Incrementa o contador
    JMP LOOP_1              ; Volta para o loop de leitura

CONTA:
   
    MOV AL, CONTADOR        ; Carrega o valor do contador em AL
    MOV CL, AL             ; Move para CL (parte baixa do CX)

    MOV AH, 02              ; Funcao para imprimir caractere
    MOV DL, '*'  

IMPRIMIR_LOOP:
    INT 21H                 ; Executa a funcao
    LOOP IMPRIMIR_LOOP      ; Decrementa CL e continua se CL não for zero

   
    MOV AH, 4CH             ; Funcao para terminar o programa
    INT 21H
MAIN ENDP
END MAIN
