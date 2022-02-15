include console.inc
.data
X dd 0
Y dd 0

.code
start:
   outstr 'first number:'
   inintln X
   outstr 'second number:'
   inintln Y
   
   mov eax, X
   mov ebx, Y
   add eax, ebx
   outstr 'sum nosign='
   outword eax
   outstr ', sum with sign='
   outnumln eax

   mov eax, X
   mov ebx, Y
   sub eax, ebx
   outstr 'sub nosign='
   outword eax
   outstr ', sub with sign='
   outnumln eax
   pause 'press any button to continue'
   exit
end start