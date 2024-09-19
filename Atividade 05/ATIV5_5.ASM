TITLE letras QUATRO
.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB, 10,13, "Digite os numeros para a soma: $."
    MSG2 DB, 10,13, "A soma = $."

.CODE
MAIN PROC
LOOP_1:
    MOV AX,@DATA ;obter acesso ao .data
    MOV DS,AX ;mover os dados de .data para DS

    MOV AH,9 ;imprime uma string 
    LEA DX,MSG1 ; seleciona a string
    INT 21H ; executa a funcao 9

    MOV AH,1 ; pega o input do usuario
    INT 21H ; executa a funcao 1
    CMP AL,13 ; compara o input com o "13" (enter)
    JE FIM ; se for igual ao "13" vai pra fim
    
    SUB BL,'0' ;transforma em numero para somar
    ADD BL,AL ; soma
    CMP BL,9 ;compara o valor da soma com 9
    JGE FIM ;se for maior ou igual a 9 ele vai para fim
    
    JMP LOOP_1 ;volta para a pessoa fazer outro input de numero

FIM:
    MOV AH,9 ;imprime uma string 
    LEA DX,MSG2 ; seleciona a string 2
    INT 21H ; executa a funcao 9

    ADD BL, '0'          ; Converte de valor numérico para ASCII
    MOV DL, BL           ; Move a soma para DL
    MOV AH, 2            ; Preparar para exibir um caractere
    INT 21H              ; Exibe o resultado

    MOV AH,4CH ;finaliza o programa
    INT 21H ;executa a funcao 4ch
MAIN ENDP
END MAIN