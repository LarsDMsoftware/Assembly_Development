delaykek equ 21h  
lus equ 20h    

        org	0000h			;start adres van het programma
		
main0:   
        mov SP,#7fh
        lcall init

main:
    mov	dptr,#tabel  		;startadres tabel in dptr laden
    mov b,#4
    mov lus,#125
    
luslinks:
    mov	a,#00h		    ;noodzakelijk goede werking volgende instructie
    movc a,@a+dptr	    ;lees waarde uit tabel
    mov p3_data,a
    mov a,#01
    lcall delay
    inc dptr
    djnz b,luslinks
    djnz luslinks,luslinks

    
    
    mov lus,#125
lusrechts:
    mov	a,#00h		    ;noodzakelijk goede werking volgende instructie
    movc a,@a+dptr	    ;lees waarde uit tabel
    mov p3_data,a
    mov a,#01
    lcall delay
    inc dptr
    djnz b,lusrechts
    djnz luslinks,lusrechts
 
delay:
    push acc
    mov delaykek,#5

delaylol:
        lcall delay1ms
        djnz delaykek,delaylol
        pop acc
ret



init:   
        lcall initleds
        lcall initlcd
        lcall initdipswitch
        ret

tabel:  db	11111110b
        db	11111011b
		db	11111101b
		db	11110111b

tabel2: db	11110111b
        db	11111101b
        db	11111011b	
        db	11111110b


    ;mov a,#01
    ;mov p3_data,#11111100b
    ;lcall delaya0k05s
    ;mov p3_data,#11110110b
    ;lcall delaya0k05s
    ;mov p3_data,#11110011b
    ;lcall delaya0k05s
    ;mov p3_data,#11111001b
    ;lcall delaya0k05s

    ;ljmp main



    #include	"c:\xcez1.inc"
