; Comentar cada línea para poder indicar que hace cada una de ellas.
; Indicar cual es el resultado en la zona de memoria respuesta una vez que se corrió el programa.

aseg
           org 2000h ; Dirección de inicio del programa, la cual es 2000h o el equivalente a 8192 en decimal


start:     LD IX, numero1  ;Cargo e IX la direccion del numero 1
           LD A, (numero2) ;Cargo en A el valor de numero 2
           ADD A, (IX)  ;Le sumo a A el valor que hay en la direccion (IX)
           LD (respuesta), A ;Cargo el valor de A en la direccion de memoria reservada
           rst 38h

numero1:    db 7  ; Guarda en memoria un byte con valor 7
numero2:    db 8  ; Guarda en memoria un byte con valor 8 
respuesta:  ds 1  ; Reserva un byte en memoria para guardar el resultado

           end start

; El valor de respuesta es 15