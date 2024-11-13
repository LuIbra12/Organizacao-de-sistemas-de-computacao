TITLE REPEAT
.MODEL SMALL
.STACK 100H

.CODE
MAIN PROC

    xor cx,cx        ; Reseta o contador para 0
    MOV AH, 1        ; funcao para input do usuario
LOOP_1:
             
    INT 21H                 ; Executa a funcao
    INC cx                  ; Incrementa o contador
    CMP AL, 0DH             ; Compara com CR 
    JNE LOOP_1              ; Se não for CR, continua o loop
   
    MOV AH, 02              ;funcao para output do sistema
    MOV DL, '*'        
IMPRIMIR_LOOP:
        
    INT 21H                 ; Executa a funcao
    LOOP IMPRIMIR_LOOP      ; Decrementa CL e continua se CL não for zero

    MOV AH, 4CH             ; Funcao para terminar o programa
    INT 21H
MAIN ENDP
END MAIN