include console.inc

.data
x dw 32101		;for a
y dw 25732		;for a
yh db 0;		for b
yl db 0;		for b
z dd 0;			for b
x1 dd 0;		for b

.code
start:
   
   ;got two words bx (bh-bl), cx (ch-cl) 
   mov bx, x;				
   mov cx, y;				
   xor eax, eax;			clean eax

   mov al, cl;				move cl (1st byte) part of number to al
   mul bl;					Z0:= bl * cl
   ;outintln al,, '16?='
   push eax;				move Z0 to stack
   xor eax, eax;			clean eax
   ;got 1st result at stack
   mov al, ch;				move ch (2nd byte) part of number to ah
   mul bl;					Z1:= bl * ch
   shl eax, 8;				moved Z1 to correct place
   push eax;				move Z1 to stack
   xor eax, eax;			clean eax
   ;got 2nd result at stack
   mov bl, bh;				move bh to lower part
   mov al, cl;				move cl for multiplication
   mul bl;					Z2:= bh * cl
   shl eax, 8;				moved Z1 to correct place
   push eax;				move Z2 to stack
   xor eax, eax;			clean eax
   ;got 3rd result at stack
   mov al, ch
   mul bl;					Z3:= bh * ch
   ;got 4th result at stack
   shl eax, 16;				moved Z3 to correct place
   xor ebx, ebx;			clean ebx

   pop ebx;					take Z2 from stack (Z2:= bh * cl)
   add eax, ebx;			Z:= Z3 + Z2

   pop ebx;					take Z1 from stack (Z1:= bl * ch)
   add eax, ebx;			Z:= Z + Z1
   
   pop ebx;					take Z0 from stack (Z0:= bl * cl)
   add eax, ebx;			Z:= Z + Z0
   
   outstrln 'a)'
   outintln eax,, 'eax='
   
   xor eax, eax;			prepare eax for division
   
   inintln z, 'Please enter positive double word: '
   inintln yl, 'Please enter low part of Y (YL): '
   inintln yh, 'Please enter high part of Y (YH): '
   
   mov ax, word ptr z;		move lower part from z to ax
   mov dx, word ptr z + 2;	move higher part from z to dx
   
   mov bh, yh;				making word from bytes
   mov bl, yl;				making word from bytes
   ;outintln ax,, 'ax='
   ;outintln dx,, 'ax='
   ;outintln bx,, 'bx='
   div bx
   mov x1, eax

   outstrln 'b)'
   outintln bx,, 'Y='
   outintln x1,, 'x1='
   
   pause 'press any button to continue'
   exit
end start