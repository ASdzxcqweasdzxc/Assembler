include console.inc

.data
alph equ 26
arr1 db alph dup (0); array for 26 letters
arr2 db 'axabxbcxc.'; letters sequence
x db 97

.code
start:
   sub esi, esi; counter for arr2
   sub ecx, ecx; counter for arr1

@@:
   ;outwordln arr2[esi],, 'arr1:'
   cmp arr2[esi], 46
   je @f
   sub arr2[esi], 97;				calculating letter pos for arr1 a=97
   sub ebx, ebx
   mov bl, arr2[esi];				pos number for arr1
   ;outwordln bl
   inc arr1[ebx]; 					inc pos in arr1 where letter from arr2 lays
   ;outwordln arr1[ebx],, 'arrrr:'   
   inc esi
   jne @b

;new cicle for display arr1
@@:
   mov x, 97
   add x, cl
   ;outwordln x,, 'x='
   
   ;if there is no letter in arr1
   ;then goto next letter
   cmp arr1[ecx], 0
   je next
   
   ;print letter from arr1
   outchar x
   ;then print its counter from arr1
   outwordln arr1[ecx],, ': '
next:
   inc ecx
   cmp ecx, 26;						if anything in this place for arr1
   jb @b

   pause 'press any button to continue'
   exit
end start