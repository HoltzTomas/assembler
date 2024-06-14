aseg                       ;0000
org 2000h                  ;2000

start:  ld HL, mensaje     ;2000  21 XX XX 
        ld B, longitud     ;2003  06 X 

ciclo:  ld A, (HL)         ;2005  7E
        add A, 'a'-'A'     ;2006  C6 20
        ld (HL), A         ;2008  77
        inc HL             ;2009  23
        djnz ciclo         ;200A  10 F9

fin:    rst 38h            ; 200C FF

mensaje: defm 'BIENVENIDOS' ; 200D 42 49 45 4E 56 45 4E 49 44 4F 53
longitud equ $ - mensaje    ;
end start

;Tabla de valores
;2000| Start
;2005| ciclo
;200C| fin
;mensaje| 200D
;longitud| 000B

;Compilacion
;21 0D 20 06 0B
