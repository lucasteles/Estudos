[BITS 16] ;Tells the assembler that its a 16 bit code
[ORG 0x7C00]  ;Origin, tell the assembler that where the code will
  ;be in memory after it is been loaded

xor ax, ax
mov es, ax    ; ES <- 0
mov cx, 1     ; trilha 0, setor 1
mov dx, 0080h ; DH = 0 (cabeça), drive = 80h (0th hard disk)
mov bx, 5000h ; segment offset of the buffer

Erro:
mov ax, 0201h ; AH = 02 (Ler do disco), AL = 01 (number of sectors to write)
int 13h
jc Erro

mov ax,5000h
mov ds,ax
mov es,ax
mov fs,ax
mov gs,ax
mov ss,ax

jmp 5000h

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

msg db 'Oi sou o boot'

TIMES 510 - ($ - $$) db 0 ;Fill the rest of sector with 0
DW 0xAA55     ;Add boot signature at the end of bootloader