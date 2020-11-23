; Dit is de ASM file voor interrupts.
; Het is een sjabloon met een minimale invulling. Pas aan om de beoogde
; werking te bekomen.
;
; gebruik dit sjabloon voor de drie opgaven van les 8!
;
; Geschreven door Roggemans M. (MGM) v0 op 09-09-2015
looplicht equ 20h
mscounter equ 71h
lscounter equ 70h
		org	0000h			;start adres van het programma
		ljmp	main			;spring over vectoren

		org	000bh			;elke interrupt routine moet op een
						;specifiek adres komen, afhankelijk
						;van de interrupt bron
		ljmp	introutxyz		;omdat er meerdere vectoren kunnen zijn
						;en de plaats ertussen beperkt is
						;zetten we de eigenlijke routine ergens anders

;		org	****			;eventueel andere routine
;		ljmp	....


main:	mov	sp,#7fh			;stackpointer initialiseren
        lcall inits

lus:
    jb p2_data.3,lus
    setb tr0
    ;mov p3_data,#00h

timer:
    jnb tf0,druk
    mov r0,lscounter
    mov r1,mscounter
    mov r2,#01h
    mov r3,#00h
    lcall add16
    mov lscounter,r0
    mov mscounter,r1
    clr tf0

druk:
    jnb p2_data.2,timeroff
    mov r0,lscounter ; om te zien hoeveel seconden teller heeft getelt.
    mov r1,mscounter 
    mov r2,#b7h ;
    mov r3,#00h ;
    lcall div16 ;
    mov lscounter,r2
    mov mscounter,r3
    mov a,#080h
    lcall lcdoutchar
    mov a,mscounter
    lcall lcdoutbyte
    mov a,lscounter
    lcall lcdoutbyte
    ljmp timer
    

timeroff:
    ljmp lus


inits:
    lcall initlcd
    lcall initleds
    lcall initftoetsen
    lcall initdipswitch
    mov looplicht,#11111110b
    mov IEN0,#00000010b
    mov TMOD,00000001b
    mov lscounter,#00h
    mov mscounter,#00h
    setb EA
    ret


		; doe hier eerst de nodige initialisaties (o.a. interrupt bron
		; en toelaten interrupts op niveau CPU

		;hier komt dan de code van het hoofdprogramma

		ljmp main			;het hoofdprogramma is steeds een lus


; Na de lus van het hoofdprogramma komen de subroutines ,interrupt routines en tabellen

; Dit is de algemene vorm van een interrupt routine.

introutxyz:
        push	acc
		push	psw
	    mov a,looplicht
        rr a
        mov looplicht,a
        mov p3_data,a
		pop	psw
		pop	acc
		reti



#include	"c:\xcez1.inc"
