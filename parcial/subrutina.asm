

sumar: Pop DE; Guardo la direccion de retorno
       Pop IX; Direccion de la cadena null terminated
       Pop IY; Direccion de la respuesta
       Push DE;
       ld C, 0; Inicializo el acumulador

ciclo: ld B, (IX); Guardo en B el primer caracter de la cadena
       cp 0; Si es null terminated, termina
       jp Z, fin;
       ld A, B; Cargo el valor del caracter en A (No puedo usar Add con otro registro)
       add A, C; Sumo el valor del primer caracter de la cadena a C (El ejercicio nos asegura que es un valor numerico)
       ld C, A; Cargo ese valor de la suma de nuevo al contador
       inc IX; Paso al siguiente elemento de la cadena
       jr ciclo;

fin: ld (IX), C;
     ret; 
       