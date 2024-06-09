aseg
           org 2500h


start:     ld IX, vector  ;Carga en el registro IX la direccon del vector (Direccion del primer elemento)
           ld A, inicial  ;Carga en A el valor de la constante inicial
           ld B, cantidad ;Carga en B la cantindad de elementos del vector


ciclo:     sub A, (IX) ;Le resta a A el valor almacenado en la direccion IX
           inc IX ; Incrementa el valor de la direccion almacenada en IX en uno
           djnz ciclo ;Decrementa B en uno y si B no es cero salta a la etiqueta ciclo
           ld (respuesta), A 
           rst 38h


inicial:   equ 60 ;Define una constante llamada inicial que equivale a 60
vector:    db 10, 20, 5, 3, 2  ;Define 5 espacios en memoria con los valores 10, 20, 5, 3 y 2
                                ;NOTA: La direccion (vector) sera la del primer elemento del vector
cantidad:  equ $ - vector ; Define una constante llamada cantidad que equivale a la cantidad de elementos en el vector
respuesta: ds 1 ;Reserva un byte de memoria para almacenar la respuesta mas adelante


           end start

           ;El codigo toma el valor inicial, el cual es 60, y le resta 10, 20, 5, 3 y 2
           ;Asigna ese resultado a respuesta
           ;El resultado es 20
