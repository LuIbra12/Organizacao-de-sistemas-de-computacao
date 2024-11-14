TITLE CONVERSÃO
.MODEL SMALL
.STACK 100H

PULALINHA MACRO
              PUSH AX
              PUSH DX
              MOV  AH,02
              MOV  DL,10
              INT  21H
              MOV  AH,02
              MOV  DL,13
              INT  21H
              POP  DX
              POP  AX
ENDM

.DATA
    MSG1 DB "ESCOLHA A BASE DE ENTRADA:$"
    MSG2 DB "DIGITE O NUMERO : $"
    MSG3 DB "ESCOLHA A BASE DE SAIDA :$"
    MSG4 DB "A CONVERSAO E: $"

.CODE
MAIN PROC
                   MOV       AX,@DATA
                   MOV       DS,AX

                   MOV       AH,09
                   LEA       DX,MSG1
                   INT       21H

                   MOV       AH,01
                   INT       21H

                   CMP       AL,"D"
                   JE        ENTRAD
                   CMP       AL,"H"
                   JE        ENTRAH
                   CMP       AL,"B"
                   JE        ENTRAB

ENTRAD:        
                   CALL      ENTRADADECIMAL
                   JMP       SAIDA
ENTRAH:        
                   CALL      ENTRADAHEXA
                   JMP       SAIDA
ENTRAB:        
                   CALL      ENTRADABINARIO
    
SAIDA:        
                   PUSH      AX
                   MOV       AH,09
                   LEA       DX,MSG3
                   INT       21H

                   MOV       AH,01
                   INT       21H

                   CMP       AL,"D"
                   JE        SAIDED
                   CMP       AL,'H'
                   JE        SAIDEH
                   CMP       AL,'B'
                   JE        SAIDEB

SAIDED:         
                   POP       AX
                   CALL      SAIDADECIMAL
                   JMP       FIM
SAIDEH:          
                   POP       AX
                   CALL      SAINDAHEXA
                   JMP       FIM
SAIDEB:          
                   POP       AX
                   CALL      SAIDABINARIO

FIM:           
                   MOV       AH,4CH
                   INT       21H
MAIN ENDP

ENTRADADECIMAL PROC
                   PUSH      BX
                   PUSH      CX
                   PUSH      DX
A:             
                   PULALINHA
                   MOV       AH,09
                   LEA       DX,MSG2
                   INT       21H

                   XOR       BX,BX
                   XOR       CX,CX

                   MOV       AH,1
                   INT       21H
                   CMP       AL,'-'
                   JE        NEGATIVO
                   CMP       AL,'+'
                   JE        POSITIVO
                   JMP       PULA

NEGATIVO:      
                   MOV       CX,1
POSITIVO:      
                   INT       21H

PULA:          
                   CMP       AL,'0'
                   JNGE      ILEGAL
                   CMP       AL,'9'
                   JNLE      ILEGAL

                   AND       AX,000FH
                   PUSH      AX

                   MOV       AX,10
                   MUL       BX
                   POP       BX
                   ADD       BX,AX

                   MOV       AH,1
                   INT       21H
                   CMP       AL,13
                   JNE       PULA

                   MOV       AX,BX
                   OR        CX,CX
                   JE        SAID

                   NEG       AX
                   JMP       SAID

ILEGAL:        
                   MOV       AH,2
                   MOV       DL,0DH
                   INT       21H
                   MOV       DL,0AH
                   INT       21H
                   JMP       A

SAID:          
                   POP       DX
                   POP       CX
                   POP       BX
                   RET

ENTRADADECIMAL ENDP

ENTRADABINARIO PROC
                   XOR       BX,BX
                   MOV       CX,16
                   MOV       AH,01
ENTRADA:       
                   INT       21H
                   CMP       AL,13
                   JE        FIMBB
                   AND       AL,0FH
                   SHL       BX,1
                   OR        BL,AL
                   LOOP      ENTRADA

FIMBB:
                   MOV       AX,BX
                   RET
ENTRADABINARIO ENDP

ENTRADAHEXA PROC
                   PULALINHA
                   MOV       AH,09
                   LEA       DX,MSG2
                   INT       21H

                   XOR       BX,BX
                   MOV       CX,4
                   MOV       AH,01
QU:       
                   INT       21H
                   CMP       AL,13
                   JE        SAI
                   CMP       AL,39H
                   JG        E_LETRA
                   AND       AL,0FH
                   JMP       CONVERTE

E_LETRA:        
                   SUB       AL,37H
CONVERTE:      
                   SHL       BX,4
                   OR        BL,AL
                   LOOP      QU

SAI:           
                   MOV       AX,BX
                   RET

ENTRADAHEXA ENDP

SAIDADECIMAL PROC
                   PUSH      AX
                   PUSH      BX
                   PUSH      CX
                   PUSH      DX

                   PULALINHA
                   PUSH      AX
                   MOV       AH,09
                   LEA       DX,MSG4
                   INT       21H
                   POP       AX

                   OR        AX,AX
                   JGE       @END_IF1

                   PUSH      AX
                   MOV       DL, '-'
                   MOV       AH,2
                   INT       21H
                   POP       AX
                   NEG       AX

@END_IF1:
                   XOR       CX,CX
                   MOV       BX,10
@REP1:
                   XOR       DX,DX
                   DIV       BX
                   PUSH      DX
                   INC       CX
                   OR        AX,AX
                   JNE       @REP1

                   MOV       AH,2
@IMP_LOOP:
                   POP       DX
                   OR        DL,30H
                   INT       21H
                   LOOP      @IMP_LOOP

                   POP       DX
                   POP       CX
                   POP       BX
                   POP       AX
                   RET
SAIDADECIMAL ENDP

SAIDABINARIO PROC
                   PUSH AX
                   PULALINHA
                   MOV AH,09
                   LEA DX,MSG4
                   INT 21H
                   POP AX

                   MOV       BX,AX
P0:            
                   MOV       CX,16
                   MOV       AH,02H

P1:            
                   ROL       BX,1
                   JNC       P2
                   MOV       DL,31H
                   INT       21H
                   JMP       P3
P2:            
                   MOV       DL,30H
                   INT       21H

P3:            
                   LOOP      P1
                   RET
SAIDABINARIO ENDP

SAINDAHEXA PROC
                   PULALINHA
                   PUSH      AX
                   MOV       AH,09
                   LEA       DX,MSG4
                   INT       21H
                   POP       AX

                   MOV       BX,AX
                   MOV       CH,4
                   MOV       CL,4
                   MOV       AH,02
P11:            
                   MOV       DL,BH
                   SHR       DL,CL
                   CMP       DL,10
                   JAE       HELETRA
                   ADD       DL,30H
                   JMP       P22

HELETRA:       
                   ADD       DL,37H
P22:            
                   INT       21H
                   ROL       BX,CL
                   DEC       CH
                   JNZ       P11

                   RET
SAINDAHEXA ENDP
END MAIN
