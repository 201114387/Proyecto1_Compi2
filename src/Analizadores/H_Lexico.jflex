/* ----------------------------- 1era seccion:Codigo de Usuario------------------------------------- */
//--- area de paquetes e importaciones

package Analizadores;
import java_cup.runtime.*;
import java.util.LinkedList;

/* ----------------------------- 2da seccion:Opcines y declaraciones ------------------------------------- */

%%
%{
    //codigo de usuario que ira dentro de la sintaxis de java
    public static LinkedList<THError> TablaHErL = new LinkedList<THError>();
%}

    //----- directivas 

%public            //indicar que la clase generada sera publica
%class Haskel_Lexico     //indicamos el nombre de la clase que generara
%char              //para que nos acepte los caracteres
%full
%ignorecase        //sensible a mayusculas y minusculas
%column            //determinar la columna si hubiera error
%line              //determinar la linea si hubiera error
%unicode 
%cupsym HSimbolos
%cup


    //--------- declaraciones de expresiones regulares

num = [0-9]+
decimal = {num}+ ("."{num}+)?   

%%
/* ----------------------------- 3era seccion: Reglas Lexicas ------------------------------------- */
    //------------ simbolos
<YYINITIAL> "+"                    {System.out.println("Reconocio " + yytext() + " mas"); return new Symbol(HSimbolos.mas, yycolumn, yyline, yytext());}




[\t\r\n\f]                         { /*espacios en blanco se ignoran*/}

    //------ errores lexico
.                                  {System.out.println("Error Lexico " + yytext() + " Linea " + yyline + " Columna " + yycolumn);
                                   THError datos = new THError(yytext(), yyline, yycolumn, "Error lexico", "simbolo no existe en el lenguaje");
                                   TablaHErL.add(datos);}








