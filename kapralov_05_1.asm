include console.inc

.data
x dw 10		;first number
y dw 0		;final number

.code
start:
   
   ;inintln x, 'Enter any positive x:'
   outintln x,, 'x='
   xor  eax, eax;			cleaning eax
   mov ax, x;				move x value to ax
   ;outintln eax,, 'before='
   shl eax, 2;				xb:= x * 4
   mov ebx, eax;			move xb to ebx
   ;outintln eax,, 'x*4='
   xor  eax, eax;			cleaning eax
   mov ax, x;				move x value to ax
   shr eax, 3;				xa:= x div 8
   ;outintln eax,, 'x div 8='
   sub ebx, eax;			xb:= xb - xa
   xor  eax, eax;			cleaning eax
   mov ax, x;				move x value to ax
   shr eax, 4;				xc:= x div 16
   shl eax, 4;				xc:= x * 16
   ;outintln eax,, 'x div 16='
   mov ecx, eax;			move xc to ecx
   xor  eax, eax;			cleaning eax
   mov ax, x;				move x value to ax
   sub eax, ecx;			xm:= x - xc
   ;outintln eax,, 'x mod 16='
   add eax, ebx;			y:= xm + xb
   mov y, ax
   
   outstrln 'a) y:= 4 * x - x div 8 + x mod 16'
   outintln y,, 'y='
   outstrln ' '
   
   ;second part of task 05_1 **********************
   xor eax, eax;			clean eax
   xor ebx, ebx;			clean ebx
   mov ax, x;				move x to ax
   mov bx, x;				move x to bx
   shl eax, 2;				xa:= x * 4
   sub eax, ebx;			xa:= xa - x  := (x * 3)
   ;outintln eax,, 'x * 3='
   xor ebx, ebx;			clean ebx
   mov bx, x;				move x to bx
   shl ebx, 5;				xb:= x * 32
   ;outintln ebx,, 'x * 32='
   add eax, ebx;			y:= xa + xb
   mov y, ax
   
   outstrln 'b) y:= 35x'
   outintln y,, 'x='
   
   pause 'press any button to continue'
   exit
end start