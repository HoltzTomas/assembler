

sumatoriaMatriz: Pop IY; Me guardo la direccion de retorno
                 Pop IX; Direccion de inicio de la matriz
                 Pop DE; D=filas E=columnas
                 Pop HL; Direccion de la respuesta\
                 Push IX; Devuelvo la dir de retorno

                 ld A, 0; Inicializo contador

fila: ld B, D