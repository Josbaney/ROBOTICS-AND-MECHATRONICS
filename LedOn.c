/*************************************************************************** */
/* ledon.c                                                                   */
/*---------------------------------------------------------------------------*/
/* ENTRADA/SALIDA DIGITAL: PUERTO B                                          */
/*---------------------------------------------------------------------------*/
/* Ejemplo para la tarjeta SKYPIC                                            */
/*---------------------------------------------------------------------------*/
/* Poner a 1 el bit 1 (RB1) del puerto B. Se enciende el led de la Skypic    */
/*---------------------------------------------------------------------------*/
/*  LICENCIA GPL                                                             */
/*****************************************************************************/

#include <pic16f876a.h>

void main(void)
{
  //-- Configurar el bit 1 del puerto B para Salida
  TRISB1 = 0;

  //-- Activar el bit 1 del puerto B. El led se enciende
  RB1 = 1;

  //-- Bucle infinito
  while(1);
}

