; Dit is de ASM file voor oefening 8.
; Het is een sjabloon om snel aan de slag te kunnen gaan.
; Pas het aan om de beoogde werking te bekomen.
; Het programma is knight rider met instelbare tijdsvertraging
;
; Geschreven door Roggemans M. (MGM) v0 op 09-09-2015

		org	0000h			;start adres van het programma

		lcall	initdipswitch		;I/O klaar zetten voor inlezen schakelaars
		lcall	initleds		;I/O klaar zetten om LED's aan te sturen

; Het effet bekom je door beurtelings:
; 01111111b
; 10111111b
; 11011111b
;...
; 11111110b
; 11111101b
;...
; naar de LED's te sturen. Je kaan het ook bekomen door de waarde 01111111b een aantal
; keer naar rechts te schuiven, daarna een aantal keer naar links en zo verder.
; het tellen hoe dikwijls een programmalus wordt doorlopen doe je met de djnz instructie.

		mov	a,#**			;startwaarde in accu laden

lus:		mov	p3_data,**		;LED's activeren

; je hebt de accu nodig voor de tijdsvertraging. Hij bevat ook de looplicht info.
; Die mag niet verloren gaan

		**				;schakelaars gebruiken voor instelbare tijdsvertraging
		**				;tijdsvertraging oproepen

; Bevat deaccu de juiste data?

		rr	a			;schuiven kan enkel in de accu
		ljmp	lus			;blijf alles herhalen vanaf lus tot hier

#include	"c:\xcez1.inc"
