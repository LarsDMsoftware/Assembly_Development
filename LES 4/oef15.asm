; Dit is de ASM file voor oefening 13.
; Pas het aan om de beoogde werking te bekomen.
; Het programma is toepassing op het schrijven naar de LCD
;
; Het is de bedoeling een uurwerk in uren:minuten:seconden op het LCD scherm te laten zien.
; We gebruiken een software delay voor het afpassen van de seconde. Het uurwerk zal niet 
; juist lopen, omdat we geen rekening houden met de uitvoeringstijd van het programma.
; De starttijd is instelbaar via de seriele verbinding. Om die te kunnen gebruiken moet je ze initialiseren.
; De beschikbare functies kan je terugvinden in de xcez1.inc file. Daar zijn ook functies
; beschikbaar voor omzetting van ascii naar binair (afhankelijk hoe je inleest)
; De eenvoudigste manier is het gebruik van inbufa en de ascii2 functies
;
; Geschreven door Roggemans M. (MGM) v0 op 09-09-2015

; Het EQU directief laat toe een naam gelijk te stellen aan een getal. Hierdoor kunnen
; we in ons programma namen gebruiken i.p.v. getallen. Hierdoor neemt de leesbaarheid toe.

uren		equ	70h			;adres waar we de ueren opslaan
minuten	equ	71h			;idem minuten
seconden	equ	72h			;idem seconden

		org	0000h			;start adres van het programma
		mov	sp,#7fh

		lcall	initlcd		;we gaan ook het LCD scherm gebruiken
		lcall	initsio
		
		lcall	inbufa			;lees een string in van de PC (werkt alleen wanneer tera term actief is
		mov	r0,#strtbuf		;startadres buffer laden (daar zitten gegevens in tabel)
		lcall	ascii2			;zet eerste 2 ascii codes om in hex getal (staan daar wel decimaal)
		lcall	bcdhex8		;controller kan enkel rekenen op hex getallen
		mov	uren,a			;klaar

; herhalen voor minuten en seconden, let wel op hoe je de data hebt ingegeven uu:mm:ss of uummss?


; Hier staan de adressen van de karakters op het LCD scherm (hex waarde)
; De eerste lijn is de plaats van een karakter op een lijn
;  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20

; 80 81 82 83 84 85 86 87 88 89 8a 8b 8c 8d 8e 8f 90 91 92 93
; c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 ca cb cc cd ce cf d0 d1 d2 d3
; 94 95 96 97 98 99 9a 9b 9c 9d 9e 9f a0 a1 a2 a3 a4 a5 a6 a7
; d4 d5 d6 d7 d8 d9 da db dc dd de df e0 e1 e2 e3 e4 e5 e6 e7

lus:		mov	a,#080h		;zet cursor op eerste lijn
		lcall	lcdoutchar		;is een ascii code
		mov	a,uren			;drukken uren af
		lcall	hexbcd8		;moet decimaal gebeuren
		lcall	lcdoutbyte
		mov	a,#':'			;ascii code : in accu laden
		lcall	lcdoutchar		;afdrukken

; op een gelijkaardige manier moeten de minuten en de seconden afgedrukt worden.


; Nu gaan we het uurwerk aanpassen (berekenen).

		inc	seconden		;eerst de seconden aanpassen
		mov	a,seconden		;testen of 60 bereikt
		cjne	a,#60,verder		;indien niet 60, dan verder gaan

; de seconden zijn 60. Dat mag niet

		mov	seconden,#00h		;seconden terug op 0 zetten

; Nu de minuten aanpassen, en indien nodig ook de uren

verder:	;nu moet er een tijdsvertraging van 1 seconde komen
		
		ljmp	lus			;blijf dit herhalen

#include	"c:\xcez1.inc"
