; Dit programma gebruikt T13 om een PWM te genereren op p3.7.
; Het programma gaat er van uit dat de PWM 16 bit is, en op maximale snelheid loopt
; (prescalers op minimale waarde (of uitgeschakeld)).
; De stand van de schakelaars wordt elke 0,5 seconden ingelezen en gebruikt als
; 8 MSB's van de vergelijkingswaarde.
;
; Het programma bevat initialisaties die niet nodig zijn omdat de default waarde
; (=inhoud van het register na reset) voldoet aan de behoefte.
;
; OPDRACHT(en):
; Overloop de datasheet van T13 in CCU6, en vervang de *** in de code door de juiste waarde
; Maak van de 16 bit PWM een 8 bit PWM met een 100% regelbereik
;
; Geschreven door Roggemans M (MGM) op 20-11-2011

		org	0000h				;start adres programma
		mov	sp,#7fh			;stack klaar zetten voor gebruik
		lcall	initdipswitch
		lcall	initleds
		lcall	initt13
lus:		lcall	pasaan
		ljmp	lus

initt13:	mov	port_page,#***		;alternatievefuncties p3.7 aanpassen
		mov	p3_altsel0,#10000000b
		mov	p3_altsel1,#00000000b
		mov	port_page,#***		;terug naar basis pagina wijzen
		mov	ccu6_page,#***		;moeten periode t13 instellen
		mov	ccu6_t13prl,#ffh		;=maximale telwaarde t13 voor reset
		mov	ccu6_t13prh,#ffh
		***
		mov	ccu6_tctr0h,#***
		***
		mov	ccu6_page,#***		;moeten compare output enabelen
		mov	ccu6_modctrh,#10000000b
		mov	ccu6_page,#***
		mov	ccu6_tctr4h,#01000010b	;starten en shadow transfer toelaten
		ret

pasaan:	
; Er zit een bug in de chip. De mov	ccu6_cc63srh,p4_data werkt niet.
		mov	a,p4_data
		mov	ccu6_cc63srh,a		;schakelaars naar schaduwregister
		mov	ccu6_tctr4h,#********b	;shadow transfer toelaten
		mov	a,***				;halve seconde wachten
		lcall	delaya0k05s
		cpl	p3_data.0
		ret


#include	"c:\xcez1.inc"
