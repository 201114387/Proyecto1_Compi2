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
caracter = [:jletter:]

identificador = [:jletter:] [:jletterdigit:]+


%%
/* ----------------------------- 3era seccion: Reglas Lexicas ------------------------------------- */
    //------------ Simbolos

<YYINITIAL> "$"                    {System.out.println("Reconocio " + yytext() + " $"); return new Symbol(HSimbolos.Dolar, yycolumn, yyline, yytext());}
<YYINITIAL> "="                    {System.out.println("Reconocio " + yytext() + " ="); return new Symbol(HSimbolos.Igual, yycolumn, yyline, yytext());}
<YYINITIAL> "["                    {System.out.println("Reconocio " + yytext() + " ["); return new Symbol(HSimbolos.CorAbre, yycolumn, yyline, yytext());}
<YYINITIAL> "]"                    {System.out.println("Reconocio " + yytext() + " ]"); return new Symbol(HSimbolos.CorCierra, yycolumn, yyline, yytext());}
<YYINITIAL> "{"                    {System.out.println("Reconocio " + yytext() + " {"); return new Symbol(HSimbolos.LlaveAbre, yycolumn, yyline, yytext());}
<YYINITIAL> "}"                    {System.out.println("Reconocio " + yytext() + " }"); return new Symbol(HSimbolos.LlaveCierra, yycolumn, yyline, yytext());}
<YYINITIAL> "\""                   {System.out.println("Reconocio " + yytext() + " \""); return new Symbol(HSimbolos.Comillas, yycolumn, yyline, yytext());}
<YYINITIAL> "\'"                   {System.out.println("Reconocio " + yytext() + " '"); return new Symbol(HSimbolos.Comilla, yycolumn, yyline, yytext());}
<YYINITIAL> ","                    {System.out.println("Reconocio " + yytext() + " ,"); return new Symbol(HSimbolos.Coma, yycolumn, yyline, yytext());}
<YYINITIAL> "%"                    {System.out.println("Reconocio " + yytext() + " %"); return new Symbol(HSimbolos.Porcentaje, yycolumn, yyline, yytext());}
<YYINITIAL> "+"                    {System.out.println("Reconocio " + yytext() + " +"); return new Symbol(HSimbolos.SignoMas, yycolumn, yyline, yytext());}
<YYINITIAL> "-"                    {System.out.println("Reconocio " + yytext() + " -"); return new Symbol(HSimbolos.SignoMenos, yycolumn, yyline, yytext());}
<YYINITIAL> "*"                    {System.out.println("Reconocio " + yytext() + " *"); return new Symbol(HSimbolos.SignoPor, yycolumn, yyline, yytext());}
<YYINITIAL> "/"                    {System.out.println("Reconocio " + yytext() + " /"); return new Symbol(HSimbolos.SignoDiv, yycolumn, yyline, yytext());}
<YYINITIAL> "mod"                  {System.out.println("Reconocio " + yytext() + " mod"); return new Symbol(HSimbolos.Mod, yycolumn, yyline, yytext());}
<YYINITIAL> "sqrt"                 {System.out.println("Reconocio " + yytext() + " raiz"); return new Symbol(HSimbolos.Raiz, yycolumn, yyline, yytext());}
<YYINITIAL> "pot"                  {System.out.println("Reconocio " + yytext() + " potencia"); return new Symbol(HSimbolos.Potencia, yycolumn, yyline, yytext());}
<YYINITIAL> "!!"                   {System.out.println("Reconocio " + yytext() + " !!"); return new Symbol(HSimbolos.AdmiDoble, yycolumn, yyline, yytext());}
<YYINITIAL> "||"                   {System.out.println("Reconocio " + yytext() + " ||"); return new Symbol(HSimbolos.OR, yycolumn, yyline, yytext());}
<YYINITIAL> "&&"                   {System.out.println("Reconocio " + yytext() + " &&"); return new Symbol(HSimbolos.AND, yycolumn, yyline, yytext());}
<YYINITIAL> "<"                    {System.out.println("Reconocio " + yytext() + " <"); return new Symbol(HSimbolos.MenorQue, yycolumn, yyline, yytext());}
<YYINITIAL> ">"                    {System.out.println("Reconocio " + yytext() + " >"); return new Symbol(HSimbolos.MayorQue, yycolumn, yyline, yytext());}
<YYINITIAL> "<="                   {System.out.println("Reconocio " + yytext() + " <="); return new Symbol(HSimbolos.MenorIgual, yycolumn, yyline, yytext());}
<YYINITIAL> ">="                   {System.out.println("Reconocio " + yytext() + " >="); return new Symbol(HSimbolos.MayorIgual, yycolumn, yyline, yytext());}
<YYINITIAL> "=="                   {System.out.println("Reconocio " + yytext() + " =="); return new Symbol(HSimbolos.IgualDoble, yycolumn, yyline, yytext());}
<YYINITIAL> "!="                   {System.out.println("Reconocio " + yytext() + " !="); return new Symbol(HSimbolos.Diferente, yycolumn, yyline, yytext());}
<YYINITIAL> ":"                    {System.out.println("Reconocio " + yytext() + " :"); return new Symbol(HSimbolos.DosPuntos, yycolumn, yyline, yytext());}
<YYINITIAL> ";"                    {System.out.println("Reconocio " + yytext() + " ;"); return new Symbol(HSimbolos.PuntoYComa, yycolumn, yyline, yytext());}

    //------------ palabras reservadas
<YYINITIAL> "let"                  {System.out.println("Reconocio " + yytext() + " let"); return new Symbol(HSimbolos.let, yycolumn, yyline, yytext());}
<YYINITIAL> "Calcular"             {System.out.println("Reconocio " + yytext() + " calcular"); return new Symbol(HSimbolos.calcular, yycolumn, yyline, yytext());}
<YYINITIAL> "Succ"                 {System.out.println("Reconocio " + yytext() + " succ"); return new Symbol(HSimbolos.succ, yycolumn, yyline, yytext());}
<YYINITIAL> "Decc"                 {System.out.println("Reconocio " + yytext() + " Decc"); return new Symbol(HSimbolos.decc, yycolumn, yyline, yytext());}
<YYINITIAL> "Min"                  {System.out.println("Reconocio " + yytext() + " Min"); return new Symbol(HSimbolos.min, yycolumn, yyline, yytext());}
<YYINITIAL> "Max"                  {System.out.println("Reconocio " + yytext() + " Max"); return new Symbol(HSimbolos.max, yycolumn, yyline, yytext());}
<YYINITIAL> "sum"                  {System.out.println("Reconocio " + yytext() + " sum"); return new Symbol(HSimbolos.sum, yycolumn, yyline, yytext());}
<YYINITIAL> "product"              {System.out.println("Reconocio " + yytext() + " product"); return new Symbol(HSimbolos.product, yycolumn, yyline, yytext());}
<YYINITIAL> "length"               {System.out.println("Reconocio " + yytext() + " length"); return new Symbol(HSimbolos.length, yycolumn, yyline, yytext());}
<YYINITIAL> "revers"               {System.out.println("Reconocio " + yytext() + " revers"); return new Symbol(HSimbolos.revers, yycolumn, yyline, yytext());}
<YYINITIAL> "impr"                 {System.out.println("Reconocio " + yytext() + " impr"); return new Symbol(HSimbolos.impr, yycolumn, yyline, yytext());}
<YYINITIAL> "par"                  {System.out.println("Reconocio " + yytext() + " par"); return new Symbol(HSimbolos.par, yycolumn, yyline, yytext());}
<YYINITIAL> "asc"                  {System.out.println("Reconocio " + yytext() + " asc"); return new Symbol(HSimbolos.asc, yycolumn, yyline, yytext());}
<YYINITIAL> "desc"                 {System.out.println("Reconocio " + yytext() + " desc"); return new Symbol(HSimbolos.desc, yycolumn, yyline, yytext());}
<YYINITIAL> "if"                   {System.out.println("Reconocio " + yytext() + " if"); return new Symbol(HSimbolos.Sent_If, yycolumn, yyline, yytext());}
<YYINITIAL> "then"                 {System.out.println("Reconocio " + yytext() + " then"); return new Symbol(HSimbolos.then, yycolumn, yyline, yytext());}
<YYINITIAL> "else"                 {System.out.println("Reconocio " + yytext() + " else"); return new Symbol(HSimbolos.Sent_Else, yycolumn, yyline, yytext());}
<YYINITIAL> "end"                  {System.out.println("Reconocio " + yytext() + " end"); return new Symbol(HSimbolos.end, yycolumn, yyline, yytext());}
<YYINITIAL> "Case"                 {System.out.println("Reconocio " + yytext() + " case"); return new Symbol(HSimbolos.Sent_Case, yycolumn, yyline, yytext());}

    //-------------- palabras no reservadas ---------------

<YYINITIAL> {num}                   {System.out.println("Reconocio " + yytext() + " num"); return new Symbol(HSimbolos.num, yycolumn, yyline, yytext());}
<YYINITIAL> {decimal}               {System.out.println("Reconocio " + yytext() + " decimal"); return new Symbol(HSimbolos.decimal, yycolumn, yyline, yytext());}
<YYINITIAL> {caracter}              {System.out.println("Reconocio " + yytext() + " Caracter"); return new Symbol(HSimbolos.Caracter, yycolumn, yyline, yytext());}
<YYINITIAL> {identificador}         {System.out.println("Reconocio " + yytext() + " ID"); return new Symbol(HSimbolos.ID, yycolumn, yyline, yytext());}

[\t\r\n\f]                         { /*espacios en blanco se ignoran*/}

    //------ errores lexico
.                                  {System.out.println("Error Lexico " + yytext() + " Linea " + yyline + " Columna " + yycolumn);
                                   THError datos = new THError(yytext(), yyline, yycolumn, "Error lexico", "simbolo no existe en el lenguaje");
                                   TablaHErL.add(datos);}








