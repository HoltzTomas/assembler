aseg
    org 2000h

start: ld A, 0FFh; 2000 3E FF 
       add A, 3h; 2002 C6 03
       rst 38h; 2004 FF
       end start; 


; Vuelvo en memoria (Compilacion) (Comenzando desde la posicion 2000h)
; 3E FF C6 03 FF

;Tabla de simbolos
; start | 2000h