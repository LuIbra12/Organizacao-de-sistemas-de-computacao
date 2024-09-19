TITLE letras QUATRO
.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    
          MOV  AH,2      ;Exibe a na tela
          MOV  CX,26     ;26 para o contador cx pois sao 26 leras do alfabeto
          MOV  DL,"a"    ;1a letra para dl
          MOV  BH,4      ;contador de letras por linha (4)
    LINHA:
          INT  21H       ; executa funcao 2
          INC  DL        ;Incrementa em DL, para passar para a proxima letra
          DEC  BH        ;Decrementa em BH, para saber quantas letras ainda faltam
          JNZ  SALTA     ;se bh nao for igual a zero ele vai pro loop e recomeca
          MOV  BH,4      ;se for igual a 0, volta o contador de letras por linha (4)
          MOV  BL,DL     ;passar o valor de DL para BL
          MOV  DL,10     ; pular linha
          INT  21H       ;imprime o pula linha
          MOV  DL,BL     ;volta o valor de DL

    SALTA:
          LOOP LINHA     ; loop para linha

          MOV  AH,4CH    ;finaliza o programa
          INT  21H

MAIN ENDP
END MAIN
