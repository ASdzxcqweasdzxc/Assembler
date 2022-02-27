include console.inc

.data
X1 db 0		;comment
X2 db 0		;comment
X3 db 0		;comment
Sum dw ?	;comment
Dif dw ?	;comment

.code
start:
   
   inintln X1, 'first number:'
   inintln X2, 'second number:'
   inintln X3, 'third number:'
   
   mov eax, 0
   mov ebx, 0
   
   ;-------------------------------------------------------------------------
   ;X1:= X1 + X2
   mov al, X1
   mov bl, X2
   add al, bl
   adc ah, 0
   
   ;X1:= X1 + X3
   mov ebx, 0
   mov bl, X3
   add al, bl
   adc ah, 0
   mov byte ptr[Sum], al
   mov byte ptr[Sum + 1], ah
   outintln Sum,, 'Int Sum='
   outwordln Sum,, 'Word Sum='
   
   ;-------------------------------------------------------------------------
   ;making 16 bit registers
   xor eax, eax
   xor ebx, ebx
   movsx ax, X1
   movsx bx, X2
   add ax, bx
   xor ebx, ebx
   movsx bx, X3
   add ax, bx
   outintln Sum,, '16-th sum='
   
   ;-------------------------------------------------------------------------
   ;erasing registers
   mov eax, 0
   mov ebx, 0
   
   ;now goes sub algorithm
   ;X1:= X1 - X2
   mov al, X1
   mov bl, X2
   sub al, bl
   sbb ah, 0
   
   ;X1:= X1 - X3
   mov ebx, 0
   mov bl, X3
   sub al, bl
   sbb ah, 0
   mov byte ptr[Dif], al
   mov byte ptr[Dif + 1], ah
   outintln Dif,, 'Int Dif='
   outwordln Dif,, 'Word Dif='

   ;-------------------------------------------------------------------------
   ;making 32 bit registers
   xor eax, eax
   xor ebx, ebx
   movsx eax, X1
   movsx ebx, X2
   sub eax, ebx
   xor ebx, ebx
   movsx ebx, X3
   sub eax, ebx
   outintln eax,, '32-nd sum='
   
   pause 'press any button to continue'
   exit
end start