START:
MOV AX, 0xB800
MOV ES, AX
XOR DI, DI

CALL WRMEM
HANG:
JMP HANG

WRMEM:
mov si, msg
mov cx, 23 ; len of msg
mov ah, 07h ; color attr

write:
lodsb ; get char from msg and inc si
stosw ; write char and attr
loop write ; while there's text
ret

msg db 'Oi sou o Kernel'

TIMES 510 - ($ - $$) db 0 ;Fill the rest of sector with 0