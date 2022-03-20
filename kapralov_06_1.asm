include console.inc

.data
n dw 0		;number 0 < n < 2^16
k db -1		;power result
x db 3		;working number

.code
bad_number:
   outstrln 'bad number. try again'
start:
   inintln n, 'Enter any positive x:'
   mov eax,2;			
   cmp n, ax
   je bad_number
   mov eax,0
   cmp n, ax
   jle bad_number

   mov dx, 0;			prepare for div dx:ax
   mov ax, n;			move x value to ax
   movzx bx, x
   mov cl, k

main_div:
   add cl, 1;			k:= k + 1
   div bx;				n_low(al):= n div 3, n_high(ah):= n mod 3
   cmp dx, 0;			if n_high = 0 then ZF:= 1
   jz main_div;			if n_high = 0 then goto main_div
   cmp ax, 0;			if n_low = 0 then
   jz pech;				division done => goto pech
   
   ;if x is not power of n => k:=-1
   mov cl, -1;


pech:
   mov k, cl
   ;outintln al,, 'div='
   ;outintln ah,, 'mod='
   outintln k,, 'k='
   
   pause 'press any button to continue'
   exit
end start