[BITS 16] 
[ORG 0x7C00]

START:
MOV AX, 0xB8A3
MOV ES, AX
XOR DI, DI

CALL ESCREVEMEM
HANG:
JMP HANG

ESCREVEMEM:
mov si, msg
mov cx, 30 ; tamanho da ensagem
mov ah, 04h ; cor attr

escreve:
lodsb ;  acrecenta caractere no SI
stosw ;ecreve caractere e attr
loop escreve ; loop
ret

msg db 'Lucas Teles e Rodrigo Mendonca'

TIMES 510 - ($ - $$) db 0 
DW 0xAA55     