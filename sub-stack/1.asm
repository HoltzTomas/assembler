;Escribir un programa que realice la división entera de dos números positivos.
;El programa deberá tener definidas las zonas de memoria Dividendo y Divisor, Cociente y  Resto para utilizar como parámetros de entrada y salida según corresponda.
;Como ejemplo utilice la cuenta 34/5.

aseg
    org 1200h ; Dirección de inicio del programa

inicio: ld A, (Divisor)
        ld C, A ;Me guardo a divisor en C
        ld A, (Dividendo) ;me guardo al divisor en A
        ld D, 0 ;Inicializo contador para el cociente

;El ciclo no lo que hara sera restarle 5 a 34, si el resultado es negativo salgo
ciclo:  sub C ;Resto el divisor al dividendo
        inc D ;Incremento el contador
        jp m, fin ;Si el resultado es negativo salgo
        jp ciclo ;Vuelvo a restar

;En fin debo tomar ese valor negativo y sumarle 5 para saber que resto tengo
fin: add C
     dec D
     ld (Resto), A ;Guardo el resto
     ld A, D
     ld (Cociente), A ;Guardo el cociente
     rst 38h ;Fin del programa

Dividendo: equ 34 ;Define una constante llamada Dividendo que equivale a 34
Divisor: equ 5 ;Define una constante llamada Divisor que equivale a 5
Resto: db 0;
Cociente: db 0;
    end inicio