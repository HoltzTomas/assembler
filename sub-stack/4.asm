

swap: push DE ;Guardo el valor original de DE
      ld D, A
      ld A, C
      ld C, D
      Pop DE
      ret