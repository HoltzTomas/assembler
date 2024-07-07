Aseg
          org 150h
start:    LD B, 0Ah; 150 06 0A
          LD C, 07h; 152 0E 07
 
          MLT BC; 154 ED 4C
 
          LD HL, 0;156 21 00 00
          ADD HL, BC;159 09
 
          LD A, B;160 78
          SUB 80h;161 D6 80
 
          LD A, 10h;163 3E 10
          OR A; 165 B7
 
          end start

;Compilacion
;150h
;06 0A 0E 07 ED 4C 21 00 00 09 78 D6 80 3E 10 B7