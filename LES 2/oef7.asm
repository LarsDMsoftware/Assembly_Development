; Dit is de ASM file voor oefening 6.
; Het is een sjabloon om snel aan de slag te kunnen gaan.
; Pas het aan om de beoogde werking te bekomen.
; Het programma is toepassing van de djnz instructie
;
; Kan je het programma zo aanpassen dat je een Knipperlicht (LED's) bekomt dat:
; 3 keer kort aan en kort uit, daarna 3 keer lang aan en lang uit, opnieuw van 
; begin starten. Aan en uit tijden instelbaar via schakelaars, kort=lang/2 (RR A)
; Let op voor de stand van de schakelaars bij het opstarten!
;
;
; Geschreven door Roggemans M. (MGM) v0 op 09-09-2015

		org	0000h			;start adres van het programma

		lcall	?		;I/O klaar zetten voor inlezen schakelaars
		lcall	?		;I/O klaar zetten om LED's aan te sturen

; het tellen hoe dikwijls een programmalus wordt doorlopen doe je met de djnz instructie.
; We gaan in dit programma de LED's 3 kort laten oplichten, 3 keer lang, 3 keer kort etc

lus0:		mov	b,#			;gebruiken het b register als lusteller
lus:		mov	p3_data,#		;LED's activeren

; korte tijdsvertraging 

		mov	p3_data,#		;LED's doven

; korte tijdsvertraging 

		djnz	b,lus			;herhaal b keer


		mov	b,#			;gebruiken het b register als lusteller
lus1:		mov	p3_data,#		;LED's activeren

; lange tijdsvertraging 

		mov	p3_data,#		;LED's doven

; lange tijdsvertraging 

		djnz	b,lus1			;herhaal b keer
		ljmp	lus0			;herneem programma

#include	"c:\xcez1.inc"
