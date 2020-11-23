; Dit is de ASM file voor oefening 3.
; Het is een sjabloon om snel aan de slag te kunnen gaan.
; Pas het aan om de beoogde werking te bekomen.
; Het programma is een knipperlicht met tijdsvertraging
;
; Geschreven door Roggemans M. (MGM) v0 op 09-09-2015

		org	0000h			;start adres van het programma

		lcall	initleds		;I/O klaar zetten om LED's aan te sturen
		
; Het is de bedoeling om de LED's beurtelings aan en uit te doen.
; De LED's zitten op p3_data. Je laat ze branden met een 0, doven doe je met een 1

lus:		mov	p3_data,#000h		;LED's activeren
;hier instructie toevoegen om de duur van de tijdsvertraging te bepalen
		lcall	delaya0k05s		;dit is een tijdsvertragings-routine
						;de waarde in de accu x0,05s is de tijdsvertraging
		mov	p3_data,#0ffh		;LED's doven
        lcall   delaya0k05s

; hier moet terug een tijdsvertraging komen, vergeet niet de duurtijd te bepalen met de juiste parameter


		ljmp	lus			;blijf alles herhalen vanaf lus tot hier

#include	"c:\xcez1.inc"
