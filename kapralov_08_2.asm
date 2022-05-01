include console.inc

.data
n equ 10
x db n dup (0); array of n bites
x1 db n dup (0); array of n bites
k dw 9; 0<k<n
n1 dw 10

.code
aboveBelow:
   outstrln 'Size of array must be 1 to 100!'
start:
;array length entry************************************
   sub ecx, ecx
   inintln n1, 'Enter size of array (1 to 100):'; n1
   mov cx, n1
   cmp ecx, n
   ja aboveBelow
   cmp ecx, 0
   jbe aboveBelow
;******************************************************
   
;left shift entry**************************************
   mov ebx, ecx
   dec ebx
   sub edx, edx
   jmp kEntry
kError:
   outstrln 'Incorrect k entered!'
kEntry:
   outstr 'Enter k from 1 to '
   outword ebx,,
   inintln k, ':'
   mov dx, k
   cmp dx, n1
   jae kError
   cmp dx, 0
   jbe kError
;******************************************************

   mov edx, ecx;						edx:= n1
   ;outwordln edx,, 'edx='
   sub ecx, ecx;						start from x[0]
   ;outstr 'x ='

;fill array 0 to n*************************************
fillArray:
   outword ecx,, 'enter x['
   outstr ']:'
   inintln bl
   mov x[ecx], bl
   ;outword x[ecx],, ' '
   inc ecx
   cmp cx, n1; 						ecx < n
   jb fillArray
outstrln ' '
   
;start point for x1************************************
   mov cx, k
   sub ebx, ebx
   mov esi, ecx;						esi:= k, xMax for future
   jmp @f
   
secondPart:
   cmp edx, esi;						first time edx:= n1, esi:= k
   je print
   mov edx, esi;						edx:= k
   sub ecx, ecx;						to go from x[0]

@@:
   mov al, x[ecx];					eax:= x[k]
   ;outwordln eax,, 'ecx='
   mov x1[ebx], al;						x1[i]:= x[k]
   ;outwordln x1[0],, 'ebx='
   inc ebx;								for x1
   inc ecx;								for x
   cmp ecx, edx;						edx:= n
   jb @b;								if ecx < n then repeat
   je secondPart
;*****************************************************

print:
outstr 'x1='
   mov dx, n1
   sub ecx, ecx;						start from x1[0]
@@:
   outword x1[ecx],, ' '
   inc ecx
   cmp ecx, edx; 						ecx < n
   jb @b
outstrln ' '

   pause 'press any button to continue'
   exit
end start