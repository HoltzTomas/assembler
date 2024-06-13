aseg
    org 3000h

comienzo: ld A, (valor) ;3000 3A 08 30
          add A, A; 3003 87, es 7 porque es el registro A y eso significa que 
          ld (valor), A; 3004  32 08 30
          rst 38h; 3007 FF
            
valor db 10h; 3008 10
    end comienzo 

;Tabla de valores
; comienzo | 3000h
; valor | 10h

;Compilacion
; 3A 08 30 87 32 08 30 FF 10

;Post
; 3A 08 30 87 32 08 30 FF 20
