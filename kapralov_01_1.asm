include console.inc

.data
X dd 0	;comment
Y dd 0	;comment

.code
start:
   
   inintln X, 'first number:'
   inintln Y, 'second number:'
   
   mov eax, X
   mov ebx, Y
   add eax, ebx
   outword eax,, 'sum nosign='
   outintln eax,, ', sum with sign='

   mov eax, X
   sub eax, ebx
   outword eax,, 'sub nosign='
   outintln eax,, ', sub with sign='
   
   pause 'press any button to continue'
   exit
end start