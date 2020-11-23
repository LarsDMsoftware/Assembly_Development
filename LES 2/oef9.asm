; Dit is de ASM file voor oefening 9.
; Het programma laat toe de intensiteit van de LED's in te stellen
; door de stand van de dipswitches te veranderen.
;
; Geschreven door Roggemans M. (MGM) v0 op 09-09-2015

tellerZ	equ	70h			;geheugenplaats 70 kan gebruikt worden om de lengte van de periode te tellen
tellerL	equ	71h			;geheugenplaats 71 kan gebruikt worden om de aan-tijd te bepalen van de LED's

		org	0000h			;start adres van het programma

		lcall	initdipswitch		;I/O klaar zetten voor inlezen schakelaars
		lcall	initleds		;I/O klaar zetten om LED's aan te sturen

lus0:   mov tellerZ,#00h
        mov tellerL,p4_data
        mov p3_data,#00h

lus:    djnz tellerl,verder
        mov p3_data,#ffh

verder:
        djnz tellerZ,lus
        ljmp lus0

#include	"c:\xcez1.inc"
