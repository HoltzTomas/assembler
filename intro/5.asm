           ld   A, (1000h)
           ld   B, A
           inc  B        ; incrementar B para ¸comenzar"
                            ; el ciclo en la instrucción djnz
           ld   C,0           ; C = 0
           ld   HL, 1001h     ; HL apunta al comienzo del vector
           jp   calculo

           
ciclo:     ld   A, (HL)       ; Tomo valor apuntado por HL
           cp  0
           jp m, siguiente; Si es negativo salto a siguiente 
           add  A, C      ; Acumular sobre A
           ld C, A

siguiente: inc HL

calculo:   djnz ciclo
           ld   (0FFFh), A         ; Almacenar el resultado
           rst  38h       ; Fin
