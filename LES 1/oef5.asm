; Dit is de ASM file voor oefening 5.
; Het is een sjabloon om snel aan de slag te kunnen gaan.
; Pas het aan om de beoogde werking te bekomen.
; Het programma is een looplicht met variabele tijdsvertraging.
; Je kan de RR A  of de RL A instructie gebruiken om de inhoud van de accu te verschuiven.
;
; Geschreven door Roggemans M. (MGM) v0 op 09-09-2015

		org	0000h			;start adres van het programma

		lcall	initdipswitch		;I/O klaar zetten voor inlezen schakelaars
		lcall	initleds		;I/O klaar zetten om LED's aan te sturen

; een looplicht bekom je door beurtelings 01111111b, 10111111b, 1101111b, ... op de
; LED's te laten zien. Dat kan je doen door opeenvolgende mov instructies of door
; een rotate instructie te gebruiken. In dit voorbeeld gebruiken we de rr a

		mov	a,#00000000b			;startwaarde in accu laden

lus:		mov	p3_data,a		;LED's activeren met waarde uit accu

; je hebt de accu nodig voor de tijdsvertraging. Hij bevat ook de looplicht info.
; Die mag niet verloren gaan. Je zal de accu even ergens anders moeten opslaan.

;accu tijdelijk opslaan

;schakelaars gebruiken voor instelbare tijdsvertraging (waarde naar accu lezen)

;tijdsvertraging oproepen

; Bevat deaccu de juiste data? (accu herstellen met oorspronkelijke waarde)

		rr	a			;schuiven kan enkel in de accu
		ljmp	lus			;blijf alles herhalen vanaf lus tot hier

#include	"c:\xcez1.inc"
