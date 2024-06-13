aseg
    org 3000h

comienzo: ld A, (valor) ;3000 3A 08 30
          add A, A; 3003 87, es 7 porque es el registro A y eso significa que 
          ld (valor), A; 3004  32 08 30
          rst 38h; 3007 FF

valor: dw 1500; 3008 05 DC       0000 0101 1101 1100 = 05DCh
    end comienzo; 1024 ;28

;Tabla de valores
; comienzo | 3000h
; valor | 05DCh

;Compilacion
; 3A 08 30 87 32 08 30 FF DC 05

;Suma, al ser A un registro de 8 bits toma solo el primero (DC)
; DC + DC = 1B8 (En A seria B8)

;Compilacion
; 3A 08 30 87 32 08 30 FF B8 05