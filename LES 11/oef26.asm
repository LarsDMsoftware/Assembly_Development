tellerZ	equ	70h		
tellerL	equ	71h		

org 0000h
ljmp main0

org 000bh
ljmp int1


main0:  mov SP,#7fh
        lcall init   
        
main: jnb p2_data.1,andere
      jnb p2_data.2,eenrichting
      ljmp main


eenrichting: mov a,#11001111b
             mov p3_data,a
             jnb p2_data.1,andere
             ljmp eenrichting

andere:      mov a,#11001111b
             mov p3_data,a
             jnb p2_data.2,eenrichting
             ljmp andere

int1:   mov p3_data,#0fh
        reti


init:   
        lcall initleds
        lcall initlcd
        lcall initdipswitch
        mov IEN0,#00000010b
        setb EA
        ret

    #include  "c:\xcez1.inc"
