include console.inc

.data
x dw 128		;comment
y dw 100		;comment

.code
start:
   
   ;got two words bx (bh-bl), cx (ch-cl) 
   mov bx, x
   mov cx, y
   xor eax, eax

   mov al, cl
   mul bl
   ;outintln al,, '16?='
   push eax
   xor eax, eax
   ;got 1st result at stack
   mov ah, ch
   mul bl
   push eax
   xor eax, eax
   ;got 2nd result at stack
   mov al, cl
   mul bh
   push eax
   xor eax, eax
   ;got 3rd result at stack
   mov ah, ch
   mul bh
   push eax
   xor eax, eax
   ;got 4th result at stack
   
   xor ebx, ebx
   pop ebx
   add eax, ebx
   xor ebx, ebx
   pop ebx
   add eax, ebx
   xor ebx, ebx
   pop ebx
   add eax, ebx
   xor ebx, ebx
   pop ebx
   add eax, ebx
   
   
   outintln al,, 'al='
   outintln ah,, 'ah='
   outintln eax,, 'eax='
   
   pause 'press any button to continue'
   exit
end start