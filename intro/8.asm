;---------------------------------------------------------------------
; Tenemos un vector de M elementos
; Queremos duplicar sus elementos en otro vector
;---------------------------------------------------------------------
          aseg
          org 3000h


start:    ld   IX, vecFuente  ; Carga dir. inicial de vecFuente
          ld   IY, vecDestino + cantElemen -1 ; Carga dir. inicial de vecDestino
          ld   B, cantElemen  ; B tiene la dimensión

ciclo:    ld   A, (IX)        ; Carga un elemento de vecFuente
          ld   (IY), A        ; Lo deja en vecDestino
          inc  IX             ; Avanza hacia el próximo
                              ; elemento en vecFuente
          dec  IY             ; Avanza hacia el próximo
                              ; elemento en vecDestino
          djnz     ciclo      ; Si hay valores, sigue
          rst  38h            ; Fin del programa


vecFuente: db   10, -2, 8, -5, 6
cantElemen: equ     $ - vecFuente  ; dim. de vecFuente
vecDestino: ds  cantElemen         ; Reserva para vecDestino la misma
                                   ; cant. de bytes que para vecFuente
          end  start

;b

 aseg
          org 3000h


start:    ld     IX, vecFuente     ; Carga dir. inicial de vecFuente
          ld   IY, vecDestino    ; Carga dir. inicial de vecDestino


          ld   B, cantImpares
ciclo:    ld  A, (IX)       ; Carga un elemento de vecFuente
          ld   (IY), A    ; Se deja en vecDestino
          inc  IX    ; Saltear el elemento par
          inc  IX
          inc  IY        ; Avanzar hacia el próximo en vecDestino
          djnz ciclo      ; Si hay valores, sigue
          ; Ahora se copian los elementos pares
          ld   IX, vecFuente + 1
          ld   B, cantElemen - cantImpares + 1
          jp   finCicloPar       ; por si había un solo valor
cicloPar: ld     A, (IX)
          ld   (IY), A
          inc  IX
          inc  IX
          inc  IY
finCicloPar: djnz   cicloPar
          rst 38h     ; Fin del programa


vecFuente:  db     10, -2, 8, -5, 6
cantElemen: equ    $ - vecFuente        ; dim. de vecFuente
cantImpares: equ    ( cantElemen + 1 ) / 2 ;Cantidad de elementos impares
vecDestino: ds     cantElemen        ; Reserva para vecDestino la misma
; cantidad de elementos que para vecFuente
             end start




