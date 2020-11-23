lus equ 20h
delaycnt equ 21h
org 0000h
ljmp main0
main0:
        mov SP,#7Fh
        lcall inits
main:
;;left
        mov lus,#125
leftloop:
        mov dptr,#tabel
        mov b,#4
loop1:
        mov a,#00h
        movc a,@a+dptr
        mov p3_data,a
        mov a,#01h
        lcall   delay
        inc dptr
        djnz b,loop1
        djnz lus,leftloop
;;left
;;right
        mov lus,#125
rightloop:
        mov dptr,#tabel2
        mov b,#4
loop2:
        mov a,#00h
        movc a,@a+dptr
        mov p3_data,a
        mov a,#01h
        lcall   delay
        inc dptr
        djnz b,loop2
        djnz lus,rightloop
;;right
niks:
ljmp niks
ljmp main
;;;;;;;;;;;
inits:
        lcall   initleds
        lcall   initlcd
        lcall   initftoetsen
        lcall   initdipswitch
ret
delay:
        push acc
        mov delaycnt,#15
delaylp:
        lcall delay1ms
        djnz delaycnt,delaylp
        pop acc
ret


tabel:  db	11111110b
        db	11111011b
		db	11111101b
		db	11110111b

tabel2: db	11110111b
        db	11111101b
        db	11111011b	
        db	11111110b
;tabel:  db 11111100b
;        db 11110101b
;        db 11110011b
;        db 11111001b
;tabel2: db 11111001b
;        db 11110011b
;        db 11110101b
;        db 11111100b

#include	"c:\xcez1.inc"