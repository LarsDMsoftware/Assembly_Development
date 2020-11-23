; Dit programma (oef18) meet de spanning op de potmeter op analoge input.
; Druk de meetwaarde af op het LCD scherm in hexadecimale vorm. De potmeter is 
; aangesloten op analoge input 4.
; Voor de initialisatie en het lezen van de analoge input zijn drivers beschikbaar.
; Consulteer de xcez1.inc file!!
;
; Pas de oefening daarna aan zodat:
; -oef19: de uitlezing decimaal is (0000-->1024) (gebruik hexbcd16)
; -oef20: de uitlezing binair is (0000000000-1111111111)
; -oef21: de uitlezing een voltmeter is tussen 0,000v-->4,995v (regel van 3)
; -oef22: de temperatuursensor gelezen wordt (zie driver). Druk af als een temperatuur in
;         graden Celcius. De sensor geeft 10mV/Kelvin. 273Kelvin=0 graden Celcius.
;         Testen kan door de potmeter te gebruiken.
;
; Dit programma bevat de aanloop naar oefening 18. Voor de andere oefeningen
; zal dit grondig aangepast moeten worden.
;
; Geschreven door Roggemans M. (MGM) V0 op 09-09-2015
;
 
		org				;startadres programma
		mov	*,#*			;initialisatie van de stackpointer
		lcall	inits			;alles initialiseren
lus:		lcall	meet			;meet het ingestelde kanaal
		lcall	drukaf			;druk uitkomst af
		ljmp	lus			;blijf dit herhalen

; inits moet alles klaar zetten voor gebruik:
; -lcd scherm (eventueel cursor uit en achtergrondverlichting aan)
; -klaar zetten van de adc
; -? (eventueel afdrukken boodschap op LCD om te zeggen wat je doet)
inits:		...
		lcall	initadc
		ret

; zal een meting uitvoeren. LET OP!!!! De meetresultaten staan in 2 registers,
; slechts 10 bit is betekenisvol!!
meet:		lcall	adcpotmeter

;hier zal je de inhoud van de 2 resultaatregisters moeten manipuleren om het resultaat
; te krijgen dat je nodig hebt (meestal 10 bit, maar minder kan ook voldoende zijn,
; afhankelijk van de toepassing)

		ret

drukaf:	;zet de cursor vooraan de eerste lijn
		
		;druk af op lcd volgens gewenste formaat
		ret

#include	"c:\xcez1.inc"
