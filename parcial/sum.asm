

sumar: 
    Pop DE ;Guardo la direccion de retorno
    Pop IX; Guardo la direccion de la cadena null terminated
    Pop IY; Guardo la direccion en la que guardare la respuesta


    ld C, 0 ;Inicializo el contador

ciclo: LD A, (IX)
       CP 0
       JP Z, fin
       ADD A, C
       LD C, A
       INC IX
       JP ciclo

    Push DE
    ret