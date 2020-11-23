; Dit is de ASM file voor oefening 4.
; Het is een sjabloon om snel aan de slag te kunnen gaan.
; Pas het aan om de beoogde werking te bekomen.
; Het programma is een knipperlicht met variabele tijdsvertraging
; Wat gebeurt er als alle schakelaars op ON staan?
;
; Geschreven door Roggemans M. (MGM) v0 op 09-09-2015

		org	0000h			;start adres van het programma

		lcall	initdipswitch		;I/O klaar zetten voor inlezen schakelaars
		lcall	initleds		;I/O klaar zetten om LED's aan te sturen

; Het is de bedoeling om de LED's beurtelings aan en uit te doen.
; De LED's zitten op p3_data. Je laat ze branden met een 0, doven doe je met een 1

lus:		mov	p3_data,#000h		;LED's activeren
            mov a,p4_data;hier instructie toevoegen om de duurtijd van de vertraging te bepalen (aanpasbaar via schakelaars)
;het bitpatroon dat je met de schakelaars aan de poort aanlegt, kan je in het bijhorende register lezen.
		lcall	delaya0k05s		;dit is een tijdsvertragings-routine
						;de waarde in de accu x0,05s is de tijdsvertraging
		mov	p3_data,#0ffh		;LED's doven

		; hier moet terug een tijdsvertraging komen


		ljmp	lus			;blijf alles herhalen vanaf lus tot hier

#include	"c:\xcez1.inc"
