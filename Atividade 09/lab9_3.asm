TITLE PROGRAMA DE INVERSAO DE VETORES
.MODEL SMALL
.STACK 100H
.DATA

    VETOR DB 1, 2, 3, 4, 5, 6, 7  ; Valores iniciais do vetor

.CODE
MAIN PROC
    MOV AX, @DATA  ; Acessa @data
    MOV DS, AX

    ; Chama a rotina para inverter o vetor
    CALL INVERTE

    ; Imprime o vetor invertido
    CALL IMPRIME

    ; Finaliza o programa
    MOV AH, 4CH
    INT 21H
MAIN ENDP

INVERTE PROC
    MOV CX,3    ; numero de trocas a serem feitas  
    XOR BX,BX   ; bx para o 1o elemento do vetor
    MOV SI,6    ; si aponta pra o ultimo elemento

TROCA:
    MOV AL, VETOR[BX]   ; move o primeiro elemento para al
    XCHG AL, VETOR[SI]  ;troca al (primeiro elemento) com SI (ultimo elemento)
    MOV VETOR[BX],AL    ; move o que estava em SI para BX
    INC BX              ; incrementa bx para ir ao proximo elemento
    DEC SI              ; decrementa SI para ir ao elemento anterior
    LOOP TROCA          ; se nao fez 3 trocas ele vai para troca

    RET                    ; volta para a proxima linha após o call inverte
INVERTE ENDP

IMPRIME PROC
    MOV BX, 0          ; BX será o índice do vetor

IMPRIMINDO:
    MOV AL, VETOR[BX]  ; Carrega o valor do vetor
    ADD AL, 30H        ; Converte para caractere ASCII
    MOV DL, AL         ; Prepara DL para imprimir
    MOV AH, 02H        ; Função de impressão
    INT 21H            ; Chama a interrupção

    INC BX             ; Incrementa o índice
    CMP BX, 7          ; Compara BX com o número de elementos
    JL IMPRIMINDO      ; Se BX < 7, continua imprimindo

    RET
IMPRIME ENDP

END MAIN
