; Dit is de ASM file voor oefening 11.
;
; Het programma is toepassing op het uitlezen van een tabel uit het FLASH geheugen
;
; We laten een looplicht zien waarvan de waarden in een tabel zitten.
; Zorg dat het programma werkt door aan te vulen.
;
; Gebruik een "verboden" code aan het einde van de tabel. Hierdoor wordt
; een teller overbodig. Pas het onderstaande programma aan om dit te bekomen.
;
; Geschreven door Roggemans M. (MGM) v0 op 09-09-2015

		org	0000h			;start adres van het programma

		lcall	initdipswitch		;I/O klaar zetten voor inlezen schakelaars
		lcall	initleds		;I/O klaar zetten om LED's aan te sturen

; het tellen hoe dikwijls een programmalus wordt doorlopen doe je met de djnz instructie.
; De waarde in b is afhankelijk van de lengte van je tabel

lus0:		mov	b,#06h			;gebruiken het b register als lusteller
		mov	dptr,#tabel		;startadres tabel in dptr laden
lus:		mov	a,#000h		;noodzakelijk goede werking volgende instructie
		mov	a,@a+dptr		;lees waarde uit tabl
		
		; laat waarde op LED's zien
		mov p3_data,a
		; voeg een instelbare tijdsvertraging toe
        mov r0,a
        mov a, p4_data
        lcall delaya0k05s
		mov a,r0
		; verhoog de pointer met 1
        inc dptr
		; herhaal even veel keer als de waarde in b
        djnz b,lus
		; start het programma opnieuw op
        ljmp lus0


; Hier staat de tabel in het geheugen. Het db directief laat toe constanten op te nemen in het programma.
; Je mag de waarden ook achter elkaar schrijven, gescheiden met een ,   maar dit doen we voor visuele
; redenen niet in dit programma.

tabel:	db	01111110b
		db	10111101b
		db	11011011b
		db	11100111b
		db	11111111b
		db	00000000b	; verboden code. Vervang de ******** door een bitpatroon dat in de tabel niet voorkomt.

#include	"c:\xcez1.inc"
