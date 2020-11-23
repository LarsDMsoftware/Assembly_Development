; Voor opgave 23 is er geen voorbeeld uitgewerkt.
; Je moet gebruik maken van timer 0 of 1 (zie dat je beide kan gebruiken).
; In de xcez1 file zijn geen routines beschikbaar voor deze timer.
; Lees in de user manual hoe de timer klaar gezet moet worden.
; De registers die je nodig hebt zijn TCON en TMOD. TCON is bit adresseerbaar
; zodat de TRx bit met bitinstructies manipuleerbaar is. Overflows van de timer kan
; je detecteren via de TFx bit. Die komt na een overflow op 1 te staan.
; Wanneer je geen interrupts gebruikt moet je de bit wel softwarematig op 0 zetten.

mscounter equ 71h
lscounter equ 70h

    org 0000h
    mov sp,#7fh
    lcall inits

lus:
    jb p2_data.3,lus
    setb tr0
    mov p3_data,#00h

timer:
    jnb tf0,druk
    mov r0,lscounter
    mov r1,mscounter
    mov r2,#01h
    mov r3,#00h
    lcall add16
    mov lscounter,r0
    mov mscounter,r1
    clr tf0

druk:
    jnb p2_data.2,timeroff
    mov r0,lscounter ; om te zien hoeveel seconden teller heeft getelt.
    mov r1,mscounter ;
    mov r2,#b7h ;
    mov r3,#00h ;
    lcall div16 ;
    mov lscounter,r2
    mov mscounter,r3
    mov a,#080h
    lcall lcdoutchar
    mov a,mscounter
    lcall lcdoutbyte
    mov a,lscounter
    lcall lcdoutbyte
    ljmp timer
    

timeroff:
    ljmp lus


inits:
    lcall initlcd
    lcall initleds
    lcall initftoetsen
    mov TMOD,00000001b
    mov lscounter,#00h
    mov mscounter,#00h
    ret



#include	"c:\xcez1.inc"
   
    

