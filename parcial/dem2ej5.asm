;Necesito recorrer un vector de $total elementos y contar cuantos de ellos son mayores 
;o iguales a "tope" y cuantos son menores

aseg
    org 100h

start: ld IX, numeros
       ld IY, respuesta 
       ld C, tope
       ld D, 0 ;Contador de mayores o iguales
       ld E, 0; Contador de menores
       ld B, total; Total de elementos
       inc B; Incremento B para comenzar el ciclo chequeando si con djnz y ver si la cantidad de elementos era nula
       jp siguiente; Salto a siguiente

ciclo: ld A, (IX); Cargo el enesimo elemento en A
       cp C ; Comparo con tope
       jp M, incMenor; Si es menor, salto a inc menor
       inc D; Si no es menor, entonces es mayor o igual, incremento dicho contador
       inc IX; Paso al siguiente elemento
       jp siguiente; Si no hago este salto se incrementa D

incMenor: inc E
          inc IX ;Paso al siguiente elemento (No hago un jp porque el codigo ya sigue en siguiente)

siguiente: djnz ciclo; Empezar por aca me permite cubrir el caso donde el vector tiene 0 elementos
           ld (IY), E; Se envia a memoria la cantidad de mayores o iguales
           ld (IY + 1), E; Se envia a memoria la cantidad de menores
           rst 38h
