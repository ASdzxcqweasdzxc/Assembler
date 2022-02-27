include console.inc

.data
H db 0		;comment
M db 0		;comment
S db 0		;comment
T dd ?	;comment

.code
start:
   
   inintln T, 'Enter seconds quantity:'
   
   mov ax, word ptr T
   mov dx, word ptr T + 2
   mov bx, 60
   div bx
   mov S, dl
   div bl
   mov M, ah
   mov H, al
   
   outint H,, 'h='
   outint M,, ';m='
   outintln S,, ';s='
   
   pause 'press any button to continue'
   exit
end start