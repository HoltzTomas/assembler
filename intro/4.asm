;El siguiente programa intenta pasar a minúsculas un cartel que 
;comienza en la dirección 1000h y termina en la dirección 1020h inclusive. 

;a)Indicar las instrucciones que tengan direccionamiento directo en uno de sus operandos. 
;b)Encontrar ejemplos de carteles en los cuales el programa funcione correctamente. 

start:  ld  HL, 1000h ;a) destino
        ld C, 1020h - 1000h ;a) destino ;Calcula la cantidad de bytes a procesar (32)

ciclo:  ld     A, (HL) ;a) destino
        add    A, 'f'-'F' ;a) destino
        ld     (HL), A ;a) A
        inc    HL ;a) HL
        dec    C ;a)
        jr     NZ, ciclo
        rst    38h
        end start

;Va a funcionar para todos los programas que tengan solo letras mayusculas

;Para que el programa funcione siempre hacemos lo siguiente

start: ld HL, 1000h
       ld C, 1020h - 1000h ;Mismo procedimiento que antes

ciclo: ld A, (HL)
        ;Ahora me aseguro de que el valor en A sea una letra mayuscula
        cp 'A'; El valor de tabla ascii de lo que este en HL es menor a A si no es mayuscula
        JP M, sigo
        cp "Z" + 1
        JP M, sigo

        ;Si llegamos hasta aca es porque es mayuscula
        add    A, 'f'-'F'
        ld   (HL), A

sigo:   inc HL
        dec C
        jr NZ, ciclo
        rst 38h
        end start