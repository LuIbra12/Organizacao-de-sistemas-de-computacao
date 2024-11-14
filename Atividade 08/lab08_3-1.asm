TITLE HEXA
.MODEL SMALL
.DATA
    MSG1 DB "Entre com 4 caracteres '0' a '9' ou 'A' a 'F': $"

.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS, AX

    MOV CX,4          ; Contador para 4 caracteres
    XOR BX, BX        ; Zera BX

    MOV AH,9
    LEA DX,MSG1
    INT 21h           ; Exibe a mensagem

    MOV AH,1
LEITURA:
    INT 21h

    CMP AL,13         ; Verifica se é Enter
    JE FIM

    CMP AL,'0'
    JB LETRA          ; Se menor que '0', é letra
    CMP AL,'9'
    JA LETRA          ; Se maior que '9', é letra
    SUB AL,'0'        ; Converte para valor numérico
    JMP INSERE

LETRA:
    
    CMP AL,'A'
    JB INVALIDO       ; Se menor que 'A', é inválido
    CMP AL,'F'
    JA INVALIDO       ; Se maior que 'F', é inválido
    SUB AL,'A'        ; Converte para A=10
    ADD AL,10         

INSERE:
    
    SHL BX,4          ; Desloca BX 4 bits para a esquerda
    OR BL,AL          ; Insere o valor no 4 bits inferiores
    LOOP LEITURA      ; Repete para o próximo caractere

INVALIDO:
    
    JMP LEITURA

FIM:

    MOV AX,4CH      ; Termina o programa
    INT 21h 

MAIN ENDP
END MAIN