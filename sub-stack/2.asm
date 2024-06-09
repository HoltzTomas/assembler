aseg
    org 1200h ; Dirección de inicio del programa

inicio: 
        ld IX, Resto
        ld IY, Cociente
        ; Ahora voy a cargar divisor y dividendo en BC asi lo pusheo en el stack
        ld A, Divisor 
        ld B, A
        ld A, Dividendo
        ld C, A

        ;Pusheo los parametros y llamo a la funcion dividir
        Push IX ;Pusheo la dir para escribir el resto
        Push IY ;Pusheo la dir para escribir el cociente
        Push BC ;Pusheo el dividendo en parte alta (C) y el divisor en parte baja (B) (Recordemos que se guardaran al reves por little endian)
        call dividir ; Recordemos que esto hara un push con la direccion en memoria en la que estamos para que luego el ret retorne a este lugar

dividir:
        Pop DE; Aprovecho que no estoy usando este registro para nada y guardo la direccion de retorno aca (backup)
        Pop BC ; Dado que el ultimo dato que pusheamos fue el dividendo y divisor, sera el primero que recuperamos (Last in first out) y lo guardamos en BC
        Pop IY; Siguiendo la misma linea, recuperamos la direccion de memoria en la que queremos escribir el cociente y la guardamos en IY
        Pop IX; Por ultimo recuperamos la direccion de memoria en la que queremos escribir el resto y la guardamos en IX

        ;Dado que ya sacamos la informacion que necesitamos del stack, pusheamos la direccion de retorno para que pueda utilizarla el ret mas adelante
        Push DE

        ;Dado que el acumulador y los flags tenian un estado antes de que la funcion sea llamada
        ;vamos a guardar ese estado en el stack y al finalizar la funcion lo vamos a restaurar para que parezca que no paso nada
        Push AF ;Guardamos lo que esta en AF (Acumulador y flags) en el stack

        ;Ahora seguimos con la division
        ;Primero que nada necesito el dividendo en A para poder restarle el divisor
        ld A, B ; Como guarde al dividendo en C (parte alta), cuando lo pusheo al stack se guarda en la parte baja por little endian
        ld D,0; Dado que ya pushee DE, puedo usar D tranquilamente pisando el valor anterior

ciclo: inc D ;Incremento el contador
       sub C ;Resto el divisor al dividendo
       jp m, fin ;Si la resta da negativa freno
       jp ciclo ;Si no da negativa continuo el ciclo

fin : add D ;Sumo uno al contador
      inc C ;Le sumo el divisor al dividendo para encontrar el resto (queda guardado en A)
      ld (IX), ;Cargo ese valor de A en esta direccion donde habia guardado la direccion de memoria para escribir el resto
      ld A, D ;Paso a A el contador del cociente
      ld (IY), A ;Cargo el cociente en la direccion de memoria que habia guardado para escribir el cociente
      Pop AF ;Restauro el estado del acumulador y los flags
      ret ;Al haber hecho el Pop, la direccion de retorno es la siguiente en el Stack y el ret puede utilizarla correctamente para volver al lugar donde fue llamado

Dividendo: equ 34 ;Define una constante llamada Dividendo que equivale a 34
Divisor: equ 5 ;Define una constante llamada Divisor que equivale a 5
Resto: db 0;
Cociente: db 0;
    end inicio