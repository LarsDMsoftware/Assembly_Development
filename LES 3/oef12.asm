; Dit is de ASM file voor oefening 12.
; Het is een sjabloon om snel aan de slag te kunnen gaan.
; Pas het aan om de beoogde werking te bekomen.
; Het programma is toepassing op het schrijven naar de LCD
;
; We laten een 4 tellers zien (2 hex, 2 dec, +1 en -1)
; Het programma geeft foutieve resultaten. Verklaar waarom!!
;
; Pas het programma aan om volgende 3 andere programma's te bekomen:
;
; -Met de CJNE instructie kan je dit vermijden. Hoe?
;
; -Maak van de 8 bit tellers 16 bit tellers (per variabele heb je 2 geheugenplaatsen nodig)
;
; -Bij dit laatste programma vervang je + en - 1 door + en - de schakelaars
;
; Geschreven door Roggemans M. (MGM) v0 op 09-09-2015

		org	0000h			;start adres van het programma

		lcall	initdipswitch		;I/O klaar zetten voor inlezen schakelaars
		lcall	initleds		;I/O klaar zetten om LED's aan te sturen
		lcall	initlcd		;we gaan ook het LCD scherm gebruiken
		mov	r0,#000h		;wordt gebruikt als getal om bij te tellen
		mov	r1,#000h		;wordt gebruikt als getal om te verminderen

; Hier staan de adressen van de karakters op het LCD scherm (hex waarde)
; De eerste lijn is de plaats van een karakter op een lijn
;  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20

; 80 81 82 83 84 85 86 87 88 89 8a 8b 8c 8d 8e 8f 90 91 92 93
; c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 ca cb cc cd ce cf d0 d1 d2 d3
; 94 95 96 97 98 99 9a 9b 9c 9d 9e 9f a0 a1 a2 a3 a4 a5 a6 a7
; d4 d5 d6 d7 d8 d9 da db dc dd de df e0 e1 e2 e3 e4 e5 e6 e7

lus:		mov	a,#080h		;zet cursor op eerste lijn
		lcall	lcdoutchar		;is een ascii code
		mov	a,r0			;drukken r0 af
		lcall	lcdoutbyte		;is een getal
		mov	a,#			;zet de cursor op de tweede lijn
		lcall	lcdoutchar		;is een ascii code

; nu moeten we de hexadecimale waarde van r0 omrekeken naar een decimale waarde.
; hiervoor gebruiken we een routine uit xcez1.inc hexbcd8. Hieronder staat de header
; van de routine afgebeeld. Ga na of wat je doet steeds correct is.

; hexbcd8     zet een 8 bit hex getal om in een 8 bit bcd getal
; input       a (maximale waarde = 63h)
; output      a

		mov	a,r0			;waarde uit r0 gaan we omzetten
		lcall	hexbcd8
		lcall	lcdoutbyte

		;idem hex voor r1 op derde lijn
		
		;idem decimaal r1 op vierde lijn

		inc	r0			;r0 plus 1
		dec	r1			;r1 min 1
		ljmp	lus			;blijf dit herhalen

#include	"c:\xcez1.inc"
