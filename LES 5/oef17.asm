; Dit programma (oef17) laat toe om uit 4 looplichten te kiezen met de 4 functietoetsen.
; De keuze moet aangepast kunnen worden, ook als reeds een looplicht gekozen is.
; Het programma houdt geen rekening met contactdender.
;
; Er zijn 2 manieren om dit op te lossen. Dit is de uitwerking van de tweede methode
; (overname register i.p.v. meerdere testen).
;
; Geschreven door Roggemans M. (MGM) V0 op 09-09-2015
;
 
overname	equ	70h			;wordt gebruikt om te onthouden welke schakelaar ingedrukt was

		org				;startadres programa
		mov	sp,#7fh			;stackpointer initialiseren
		lcall	inits			;alles klaar zetten
main:	jnb	p2_data.0,main1		;als p2_data.0 niet ingedrukt volgende schakelaar testen
main0:	mov	overname,#01h		;aangeven welke schakelaar ingedrukt was
		lcall	looplicht1		;functie oproepen die looplicht1 laat zien (1 cyclus)
		ljmp	main			;terug naar testen schakelaars

main1:		jnb	p2_data.1,main2

; verder aanvullen

main2:		jnb	p2_data.2,main3

; verder aanvullen

main3:		jnb	p2_data.3,main4

; verder aanvullen

main4:		mov	a,overname		;waarde uit overnameregister in accu
		cjne	a,#01h,main5		;was schakelaar p2_data.3 ingedrukt?
		ljmp	main0			;zo ja bijhorende plaats springen
main5:		cjne	a,#02h,main6

; verder aanvullen

main6:		cjne	a,#03h,main7

; verder aanvullen

main7:		cjne	a,#04,main8

; verder aanvullen

main8:		ljmp	main

; inits	zet alles klaar voor het programma van start gaat
inits:
		ret

; looplicht1	is het programma dat een cyclus van het looplicht laat zien.
; looplicht1 laat een looplicht zien van links naar rechts
looplicht1:	mov	b,#08h			;lusteller
		mov	a,#11111110b		;waarde die op de LED's moet komen
looplicht11:	mov	p3_data,a		;laten zien
		mov	a,p0			;schakelaars inlezen
		lcall	delaya0k05s		;instelbare tijdsvertraging
		mov	a,p3_data		;waarde LED's terug lezen
		rl	a			;1 plaats opschuiven
		djnz	b,looplicht11		;8 keer herhalen
		ret				;na 8 keer is 1 cyclus voorbij, dus stoppen

looplicht2:
; verder aanvullen
		ret

looplicht3:
; verder aanvullen
		ret
looplicht4:
; verder aanvullen
		ret

#include	"c:\xcez1.inc"
