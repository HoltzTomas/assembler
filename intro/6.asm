;Se tiene almacenado a partir de la dirección 2000h un string “NULL terminated”,
;esto es, una cadena de caracteres cuyo indicador de fin es el número cero, que no forma parte de la cadena,
;sólo indica el final de la misma. No confundir número cero con el carácter ASCII ‘0’. 
;Escribir los siguientes programas (independientes uno de otros): 

;Calcular la longitud del string y almacenar el resultado en el registro B .

;Necesito saber la direccion del strinh
    ld B, 0 ;Contador de string
    ld IX, 2000h ;Direccion del string

;Necesito correr un ciclo donde analice la la primer direccion en memoria
ciclo: ld A, (IX)
        ;Necesito saber que sea un texto
        cp 0
        jp Z, fin
        inc B
        inc IX

fin:    rst 38h

;Contar cuántos espacios hay en el string y almacenar el resultado en el registro C.

    ld C, 0; Inicializo contador
    ld IX, 2000h ;Direccion del string

ciclo: ld A, (IX)
        cp 0
        jp Z, fin
        cp " "
        jp NZ, no_es_espacio
        inc C

no_es_espacio: inc IX
                jp ciclo

fin: rst 38h ;

;Asumiendo que hay otro string “NULL terminated” en la dirección 2100h.
;S i ambos son iguales dejar encendido el flag de carry (80h + 80h: enciende el carry).
;Caso contrario dejarlo apagado (X + 0 apaga el flag de carry). 

