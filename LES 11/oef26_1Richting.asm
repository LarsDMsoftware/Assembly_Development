teller	equ	71h		
pwm bit p3_data.6
org 0000h
ljmp main0

org 000bh
push acc
push b
push psw
inc teller
lcall adcpotmeter
cjne a,teller,intnext

intnext: mov pwm,c
pop psw
pop b
pop acc
reti

main0:  mov SP,#7fh
        lcall init   
        
main:       mov a,#11001111b
            mov p3_data,a
            ljmp $
              
init:   
        lcall initleds
        lcall initlcd
        lcall initdipswitch
        mov IEN0,#00000010b
        setb EA
        ret

    #include  "c:\xcez1.inc"