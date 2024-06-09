; ¿Cuál es el valor del registro A al finalizar la ejecución? \
; A= 0FFh = 255 en decimal = 1111 1111 en binario
; 3h = 3 en decimal = 0000 0011 en binario

;   Sumamos en binario
;   1111 1111
;   0000 0011
;   ---------
; 1 0000 0010 (Desdoblamiento) (Se almacenan solo los ultimos 8 bits) = 2 en decimal = 0000 0010 en binario = 2h en hexadecimal

; Podriamos haber sumado directamente en hexa abreviado
;   0FF
; + 003
;   ---
;   102 = 0001 0000 0010 (Hay desdoblabiento, se almacenan los ultimos 8 bits) = 02h en hexadecimal

; ¿Qué instrucciones tienen direccionamiento inmediato en uno de sus operandos?
; La instruccion add A, 3h y ld A, 0FFh

; ¿Qué instrucciones tienen direccionamiento implícito en uno de sus operandos?
; add, por mas que lo escribamos es siempre A

; ¿Por qué hay que colocar un cero antes del valor FFh? 
; Porque si no el compilador lo confunde con una etiqueta, sigue teniendo la misma cantidad de bits que si no tuviese ese cero
; Se usa como estandar para diferenciarlo de un rotulo

aseg
        org 2000h


start:  ld     A, 0FFh ; carga registro A con el valor 0FFh, equivalente a 255 en decimal


          add  A, 3h ; incremento en 3
          rst  38h ; Termina el programa
          end  start


