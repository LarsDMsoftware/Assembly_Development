; Dit is de ASM file voor oefening 1.
; Het is een sjabloon om snel aan de slag te kunnen gaan.
; Pas het aan om de beoogde werking te bekomen.
; Alles wat na ; staat wordt aanzien als commentaar
;
; Geschreven door Roggemans M. (MGM) v0 op 09-09-2015

		org	0000h			;start adres van het programma

; Bovenstaande lijn is geen instructie voor de CPU, maar een aanwijzing (directief)
; voor de IDE. Hierdoor weet die waar het programma start.

		lcall	initdipswitch		;I/O klaar zetten voor inlezen schakelaars
		lcall	initleds		;I/O klaar zetten om LED's aan te sturen

; beide bovenstaande routines zijn op voorhand geschreven en zitten in de xcez1.inc file
		
; Het is de bedoeling de schakelaars in te lezen (p4_data) en op de LED's te laten zien
; P3_data

lus:		mov	p3_data,p4_data
      


		ljmp	lus			;blijf alles herhalen vanaf lus tot hier
            ; In het programma gebruiken we functies en namen van registers. De IDE kent die niet.
; Door onderstaande lijn wordt een betand mee opgenomen (included) in het asm bestand.
; Hierdoor is de inhoud van dit bestand (functies en declaraties van namen) beschikbaar
; in het programma. Je kan het openen met de ide om te kijken wat er in zit (aanrader).
; Je moet er natuurlijk wel voor zorgen dat het bestand aanwezig is op je harde schijf,
; en op de locatie c:\ . De plaats van het bestand kan je wijzigen, maar dan moet je dat
; ook aanpassen in de #include " " lijn.

#include	"c:\xcez1.inc"
