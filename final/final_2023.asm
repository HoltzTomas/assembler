

contar_excesos: pop DE ; Guardo la dir de retorno
                pop IX; Direccion a un primer vector de numeros
                pop IY; Direccion a un segundo vector de numeros
                pop BC; Tope en B, Cantidad de elementos de los vectores en C
                pop HL; Dire de respuesta

                push DE; Devuelvo la dire de retorno al stack

                ld E, 0; Inicializo el contador

ciclo: ld A, (IX); Cargo el valor del primer elemento del vector en A
       ld D, (IY); Cargo el elemento del primer elemento del segundo vector en D
       
       Sub D; Le resto D a A
       cp B; Comparo el valor actual de A con el tope
       jp N, noInc; Si el valor es negativo no incremento
       jp Z, noInc; Si el valor es cero no incremento
       inc E;

noInc: inc IX;
       inc IY;
       dec C; decremento la cantidad de elementos del vector
       jp nz, ciclo; Si no salta sigue a fin

fin: ld (HL), E; Guardo la respuesta en la direccion que se me pidio
     ret;
