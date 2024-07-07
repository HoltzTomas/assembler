

swapMemo: Push BC
          ld B, (IX); Me guardo el valor de la direccion IX
          ld C, (IY); Me guardo el valor de la direccion IY
          ld (IX), C; Guardo el valor de C en IX
          ld (IY), B; Guardo el valor que estaba en IX en IY

          Pop BC; Restauro los registros BC
          ret; retorno
