include console.inc

.data
a equ 48271
m equ 2147483647
n equ 10
arr dd n dup (0); array for 26 letters
arr1 dd 1,2,3,4,5,6,7,8,9,10
x1 dd 1;							arr[0]:= 1
xMax dd 9;							M


.code

getRnd proc
   push ebp
   mov ebp, esp
   
   mov ebx, [ebp+20];				ebx:= ^arr
   mov edi, [ebp+16];				edi:= M
   sub ecx, ecx
   ;outwordln edi,, 'ecx0='

@@:
   mov eax, [ebx+ecx*4];			eax:= arr[i]
   mov esi, [ebp+12];				esi:= a
   mul esi;							arr[i]:= arr[i] * a
   mov esi, [ebp+8];				esi:= m
   div esi;							edx:= edx:eax mod m
   mov [ebx+ecx*4+4], edx;			arr1[i+1]:= edx
   inc ecx;							i:= i+1
   cmp ecx, edi;					i<M ?
   jb @b;							if yes, then again


   pop ebp
   ret 16
getRnd endp

start:
   ;algorithm assembled for positive numbers
   inint x1, 'Please enter first number: '
   mov eax, x1;						x1:= ?
   mov arr, eax;					arr[0]:= x1
   lea eax, arr;					pointer to arr				1
   push eax;						1'st in (pointer to arr)
   ;now arr has x1 as first element
@@:
   inint xMax, 'Enter xMax: '
   mov eax, xMax;					M							2
   mov ecx, n;						n equ 10
   cmp eax, ecx;					if M<=n
   ja @b
   dec xMax
   
   push eax;						2'nd in (xMax)
   mov eax, a;						a							3
   push eax;						3'rd in (a)
   mov eax, m;						m							4
   push eax;						4'th in (m)

   sub ecx, ecx;					element coefficient
   
   call getRnd
   

   sub ecx, ecx;					clear ecx
   mov eax, xMax
print:
   outwordln arr[ecx*4],, 'arr='
   inc ecx;							i:= i+1
   cmp ecx, eax;					i<M ?
   jbe print;							if yes, then again
   
   pause 'press any button to continue'
   exit
end start