;****************************************************************************
;*  ledon.asm                                                               *
;*--------------------------------------------------------------------------*
; Ejemplo para la Skypic                                                    *
;---------------------------------------------------------------------------*
; Ejemplo "Hola mundo" para encender el led conectado a RB1                  *
;---------------------------------------------------------------------------*
;  LICENCIA GPL                                                             *
;****************************************************************************

 
; --- Especificar el PIC a emplear
  INCLUDE "p16f876a.inc"

; -- Comienzo del programa
  ORG 0

; -- Poner el bit RB1 como salida
  BSF STATUS,RP0    ; Acceder al banco 1
  BCF TRISB,1       ; Poner RB1 como salida

; -- Activar RB1 para encender el led
  BCF STATUS,RP0    ; Acceder al banco 0
  BSF PORTB,1       ; Sacar un '1' por RB1

fin GOTO fin        ; Bucle infinito

  END


