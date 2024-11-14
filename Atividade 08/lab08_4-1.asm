TITLE IMPRIMIRH
.MODEL SMALL
.STACK 100H
.DATA
    conversao db 30h,31h,32h,33h,34h,35h,36h,37h,38h,39h,41h,42h,43h,44h,45h,46hS                            
    MSG1 DB "O numero hexa e: $"

.CODE
MAIN PROC
    MOV AX,@DATA   ; acesso ao .data
    MOV DS,AX

    MOV AH,9    ; imprimir a msg1
    LEA DX,MSG1
    INT 21h

    MOV CX,4  ; aciona 4 no contador cx

CONTA:
    
    MOV DL,BH 
    SHL DL,4  ; Desloca Dl à esquerda 4 bits
    AND DL,0FH  ; trasnforma os 4 bits menos significativos
    push BX ; bx vai pro topo da pilha
    push ax ; ax vai pro topo da pilha
    lea bx, conversao ;chama o vetor conversao
    mov al,DL ;dl vai para al para fazer o xlat
    xlat ;pega o valor hexa
    mov dl,al ;volta para dl para impirimir
    pop ax  ;pega ax (anterior) e tira da pilha
    pop bx  ;pega bx (anterior) e tira da pilha
   

IMPRIMIR:
    MOV AH,2
    INT 21h  ; Imprime o caractere

    LOOP CONTA

    MOV AX,4Ch
    INT 21h
MAIN ENDP
END MAIN
