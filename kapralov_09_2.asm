include console.inc

.data
date record d:5, m:4, y:7;		date dd.mm.yy
date1 RECORD y1:7, m1:4, d1:5;	date yy.mm.dd
a date <11,6,97>;				simple date for calculation
a1 date1 <>;					target date
.code
start:
   
   ;a to ax
   mov ax, a

   ;prepare day for a1
   mov bx, ax
   and bx, mask d
   shr bx, d;					moving d to lower byte for print
   outword bx,, 'date='
   add a1, bx;					adding d1 to a1

   ;prepare month for a1
   mov bx, ax
   and bx, mask m
   shr bx, m;					moving m to lower byte for print
   outword bx,02, '.'
   shl bx, m1;					moving m to m1 place in a1
   add a1, bx;					adding m1 to a1

   mov bx, ax
   and bx, mask y
   outwordln bx,, '.'
   shl bx, y1;					moving y to y1 place in a1
   add a1, bx
   
   ;print a1 in format yy.mm.dd
   ;print y1 from a1
   mov ax, a1
   mov bx, ax
   and bx, mask y1
   shr bx, y1;					moving y1 to lower byte for print
   outword bx,, 'date1='

   ;print m1 from a1
   mov bx, ax
   and bx, mask m1
   shr bx, m1;					moving m1 to lower byte for print
   outword bx,02, '.'

   ;print d1 from a1
   mov ax, a1
   mov bx, ax
   and bx, mask d1   
   outwordln bx,, '.'

   pause 'press any button to continue'
   exit
end start