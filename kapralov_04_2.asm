include console.inc

.data
x dw 60000;32101;		for a
y dw 60000;25732;		for a
z dd 0;
;zw dw 0;		supply word
yl db 0;
yh db 0;
x1 dw 0

.code
start:
   
   ;z0
   mov bx, x;				
   mov cx, y;				
   xor eax, eax;			clean eax
   mov al, cl;				move cl (1st byte) part of number to al
   mul bl;					Z0:= bl * cl
   mov word ptr z, ax;		move Z0 to stack
   ;outintln z,, 'z0='
   
   ;z1
   ;xor eax, eax;			clean eax
   mov al, ch;				move cl (1st byte) part of number to al
   mul bl;					Z1:= bl * ch
   mov dx, word ptr z + 1;	take 2nd and 3rd bytes from z
   add dx, ax;				collect z1 in dx
   xor bl, bl;				prepare bl for CF
   adc bl, 0;				bl:= 0 + CF
   ;mov bl, al
   ;outintln z,, 'z+z1='
   
   ;z2
   xor eax, eax;			clean eax
   mov al, cl;				move cl (1st byte) part of number to al
   mul bh;					Z2:= cl * bh
   add dx, ax;				collect z2 in dx
   mov word ptr z + 1, dx;	move z1+z2 to 2nd and 3rd byte of z
   adc bl, 0;				bl:= bl + CF
   mov byte ptr z + 3, bl;	move bl to 4th byte of z
   ;outintln z,, 'z+z2='
   
   
   ;z3
   xor eax, eax;			clean eax
   mov al, ch;				move cl (1st byte) part of number to al
   mul bh;					Z3:= ch * bh
   mov dx, word ptr z + 2;	move 3rd and 4th bytes of z to dx
   add ax, dx;				z3:= z3 + dx
   mov word ptr z + 2, ax;	move z3 to 3rd and 4th bytes of z

   outstrln 'a)'
   outwordln z,, 'z='
   
   mov ax, word ptr z;			prepare eax for division
   mov dx, word ptr [z + 2];			prepare eax for division
   mov bx, y;
   
   outwordln bx,, 'divider='
   div bx
   mov x1, ax

   ;outstrln 'b)'
   ;outintln bx,, 'Y='
   outwordln x1,, 'x1='
   
   pause 'press any button to continue'
   exit
end start