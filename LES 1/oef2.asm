; Dit is de ASM file voor oefening 2.
; Het is een sjabloon om snel aan de slag te kunnen gaan.
; Pas het aan om de beoogde werking te bekomen.
; Het programma is een knipperlicht zonder tijdsvertraging
; Verklaar wat je ziet op de LED's!!!
;
; Geschreven door Roggemans M. (MGM) v0 op 09-09-2015

		org	0000h			;start adres van het programma

		lcall	initleds		;I/O klaar zetten om LED's aan te sturen

; Het is de bedoeling om de LED's beurtelings aan en uit te doen.
; De LED's zitten op p3_data. Je laat ze branden met een 0, doven doe je met een 1

lus:		mov	p3_data,#1               ;LED's geven licht
            mov p3_data,#0               ;LED's geven geen licht

; hier moet nog een instructie komen om de LED's te doven

		ljmp	lus			;blijf alles herhalen vanaf lus tot hier

#include	"c:\xcez1.inc"
