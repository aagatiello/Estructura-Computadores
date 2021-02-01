# Prácticas Estructura de Computadores 

El objetivo es aprender aspectos generales de la programación en lenguaje ensamblador RISC-V utilizando el entorno de simulación Ripes.

Los datos se almacenan en memoria en tres zonas:
- Zona de instrucciones (“Text”): El sistema almacena las instrucciones del programa a ejecutar.
- Zona de datos estáticos (“Static data”): Se almacenan los datos estáticos del programa
(constantes y variables).
- Zona de pila (“Stack”): Aquí se guardan datos dinámicos, indexados mediante el puntero de
pila (sp).

Los programas empiezan con la declaración de la zona de datos estáticos, mediante el uso de la expresión “.data”, seguida de la sección de instrucciones identificada con “.text”. 
