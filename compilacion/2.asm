aseg
    org 1000h

start: ld A, 70h; 1000 3E 70;

       add A, incremento; 1002 C6 50;
       rst 38h; 1004 FF;

incremento: equ 50h; 
       end start;

; Tabla de valores de la tabla de simbolos
; start | 1000h
; incremento | 0050h

; Compilacion
; 3E 70 C6 50 FF 

;Valor del registro A al finalizar
;70 en binario es 01110000
;50 en binario es 01010000
;La suma da 1100 0000 = C0h, el cual es un numero negativo
; Se prende el flag de overflow porque una suma de positivos dio negativo
;Se prende el flag de signo porque el resultado es negativo