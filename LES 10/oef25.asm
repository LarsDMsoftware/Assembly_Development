        

        org	0000h			;start adres van het programma
		
main0:   
        mov SP,#7fh
        lcall init

main:
    mov	dptr,#tabel		;startadres tabel in dptr laden
    mov b,#4
    
lus:
    mov	a,#00h		    ;noodzakelijk goede werking volgende instructie
    movc a,@a+dptr	    ;lees waarde uit tabl
    mov p3_data,a
    mov a,#01
    lcall delaya0k05s
    inc dptr
    

    djnz b,lus

init:   
        lcall initleds
        lcall initlcd
        lcall initdipswitch
        ret

tabel:  db	11111100b
		db	11110110b
		db	11110011b
		db	11111001b
	

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
