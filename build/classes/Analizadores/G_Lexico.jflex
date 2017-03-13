/*------------------------- 1era Area: Codigo Usuario --------------------------*/
//--------- Área de paquetes e importaciones

package Analizadores;
import java_cup.runtime.*;

/*-------------------- 2da Area: Opciones y Declaraciones --------------------------*/

%%
%{
    //----- codigo de usuario en sintaxis java
    
%}

    //-----directivas 
%public            //indicar que la clase generada sera publica
%class GLexico     //indicamos el nombre de la clase que generara
%cupsym GSimbolos  //indicamos el nombre de la clase simbolos
%cup               //esto es porque trabajamos con cup
%char              //para que nos acepte los caracteres
%full
%ignorecase        //sensible a mayusculas y minusculas
%column            //determinar la columna si hubiera error
%line              //determinar la linea si hubiera error
%unicode 

//-------------declaracion de exp regulares
numero = [0-9]+


//------------



%%

/*------------------------- 3era Area: Reglas Lexicas --------------------------*/
