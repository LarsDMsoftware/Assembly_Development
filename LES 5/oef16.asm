; Dit programma (oef16) laat toe om uit 4 looplichten te kiezen met de 4 functietoetsen.
; De keuze moet aangepast kunnen worden, ook als reeds een looplicht gekozen is.
; Het programma houdt geen rekening met contactdender.
;
; Er zijn 2 manieren om dit op te lossen. Dit is de uitwerking van de eerste methode
; waarbij enkel schakelaars getest worden.
;
; Geschreven door Roggemans M. (MGM) V0 op 09-09-2015
;
 org 0000h
 mov SP,#7fh
 lcall initdipswitch
 lcall initftoetsen
 lcall initleds
main:
		jnb	p2_data.0,licht1		;zal springen als de schakelaar is ingedrukt (bit=0, anders rechtdoor
        jnb	p2_data.1,licht2
        jnb	p2_data.2,licht3
        jnb	p2_data.3,licht4
        mov p3_data,#ffh
        ljmp main
		
licht1:
mov b,#06h
mov dptr,#tabel
lus:
mov a,000h
mov a,@a+dptr
mov p3_data,a
mov r0,a
mov a,p4_data
lcall delaya0k05s
mov a,r0
inc dptr
djnz b,lus
ljmp licht11

licht11:
mov a,p2_data
anl a,#00001110b
cjne a,#00001110b,main
ljmp licht1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
licht2:
mov p3_data,#02h

mov a,p2_data
anl a,#00001101b
cjne a,#00001101b,main
ljmp licht2
licht3:
mov p3_data,#03h

mov a,p2_data
anl a,#00001011b
cjne a,#00001011b,main
ljmp licht3

licht4:
mov p3_data,#04h

mov a,p2_data
anl a,#00000111b
cjne a,#00000111b,main
ljmp licht4



#include	"c:\xcez1.inc"
