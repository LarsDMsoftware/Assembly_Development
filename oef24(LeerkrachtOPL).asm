teller equ 20h
loopicht equ 21h
div200 equ 22h
div240 equ 23h

	org 0000h
	ljmp main
	
	org 000bh
	ljmp introut0
	
	org 0023h
	ljmp introutsio
	
main:	mov sp,#7fh
		lcall inits
lus:	lcall printteller
		ljmp lus
		
inits:	mov	div200,#200
		mov div240,#240
		mov	tmod,#00000010b
		mov t1,#06h
		mov th0,#06h
		setb tr0
		mov looplicht,#11111110b
		lcall initsio
		lcall initlcd
		lcall lcdlighton
		lcall initleds
		setb ea
		setb et0
		setb es
		
printteller: mov a,#80h
lcall lcdoutchar
mov a,teller
lcall lcdoutbyte
ret

introut0:
djnz div200,intend
mov div200,#200
djnz div240,intend
mov div240,#240
push acc
mov a,looplicht
rr a
mov looplicht,a
mov p3_data,a
pop acc
intend: reti


introutsio: jbc t1,siointend
clr ri
push acc
mov a,sbuf
mov sbuf,a
inc teller
pop acc

siointend: reti

#include	"c:\xcez1.inc"