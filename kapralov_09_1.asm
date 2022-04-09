include console.inc

.data
time struc
   h db ?; hour 0-23
   m db ?; minute 0-59
   s db ?; second 0-59
time ends

t time <10,20,30>
t1 time <>

.code
;start:
   mov t.h, 23
   mov t.m, 59
   mov t.s, 58
@@:
   outstrln 'Hours should be between 0-23'   
start:
   inint al,'enter hours:'
   cmp al, 23
   jg @b
   mov t.h, al
   ;outwordln al,02, 'h='
   cmp al,al
   je @f

mins:
   outstrln 'Minuts should be between 0-59'   

@@:
   inint al,'enter minutes:'
   cmp al, 59
   jg mins
   mov t.m, al
   ;outwordln al,02, 'm='
   cmp al,al
   je @f

secs:
   outstrln 'Seconds should be between 0-59'   

@@:
   inint al,'enter seconds:'
   cmp al, 59
   jg secs
   mov t.s, al

   outword t.h,02, 't='
   outword t.m,02, ':'
   outwordln t.s,02, ':'

   ;checking seconds
   mov al, t.s
   add al, 1
   cmp al, 60
   jb @f
   sub al, al;				put 0 to seconds
@@:
   mov t1.s, al

   ;checking minutes
   mov ah, t.m
   jb @f;					if seconds <60, then skip minutes
   ;if seconds =60, then minutes +1
   add ah, 1;
   cmp ah, 60
   jb @f;					if minutes <60, then next
   sub ah, ah;				put 0 to seconds
@@:
   mov t1.m, ah
   
   ;checking hours
   mov bl, t.h
   jb @f;					if seconds or minutes <60, then skip hours
   ;if minutes =60, then hours +1
   add bl, 1
   cmp bl, 24
   jb @f;					if hours <24, then next
   sub bl, bl;				put 0 to seconds
@@:
   mov t1.h, bl
   
   outword t1.h,02, 't1='
   outword t1.m,02, ':'
   outwordln t1.s,02, ':'


   pause 'press any button to continue'
   exit
end start