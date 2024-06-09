;Dado el siguiente código indicar como quedan los flags después de ejecutar la instrucción ADD.
aseg
           org 2500h


start:     ld A, 72
           ld B, 120


           add A, B
           rst 38h


           end start

;S=0
;Z=0
;H=1
;V=0
;N=0
;C=0 lo cual significa que no hubo acarreo