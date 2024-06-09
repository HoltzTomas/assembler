;--------------------------------------------------------------------
; Calcula la sumatoria de los elementos de un vector y deja el 
; resultado en ''sumatoria''. Si el vector no tiene elementos, 
; la suma es cero.
;--------------------------------------------------------------------
          aseg
          org 3000h


start:    ld   B, dimension      ; Cargar tama~no del vector
          xor  A        ; Blanquear el acumulador A
          ld   HL, vector        ; Cargar la dirección de
                     ; comienzo del vector
          jp   calculo       ; Comenzar a procesar números
ciclo:    ld   C, (HL)       ; Tomar valor apuntado por HL
          add  A, C         ; Acumularlo sobre A
          inc  HL           ; Ir al próximo elemento
calculo:  djnz     ciclo        ; Si se llegó a cero, seguir
          ld   (sumatoria), A     ; Almacenar el resultado
fin:      rst  38h          ; Fin
vector:   db   ...          ; Vector de bytes inicializado
dimension: equ  $ - vector        ; Cantidad de elementos
sumatoria: ds   1        ; Aquí queda el resultado
           end start
