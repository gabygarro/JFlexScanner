package scanner;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

class Yytoken {
	public int numToken;
    public String token;
    public String tipo;
    public int linea;
    public int columna;

    Yytoken (int numToken,String token, String tipo, int linea, int columna) {
        //Contador para el número de tokens reconocidos
        this.numToken = numToken;
        //String del token reconocido
        this.token = new String(token);
        //Tipo de componente léxico encontrado
        this.tipo = tipo;
        //Número de linea
        this.linea = linea;
        //Columna donde empieza el primer carácter del token
        this.columna = columna;
    }   
    //Metodo que devuelve los datos necesarios que escribiremos en un archive de salida
    public String toString() {
        return "Token #"+numToken+": "+token+" C.Lexico: "+tipo+" ["+linea
        + "," +columna + "]";
    }
}


%%
%function nextToken
%public
%class Scanner
%unicode //Soporte para Unicode

%{
    private int contador;
    private ArrayList<Yytoken> tokens;

	private void writeOutputFile() throws IOException {
		String filename = "file.out";
		BufferedWriter out = new BufferedWriter(
			new FileWriter(filename));
        System.out.println("\nTokens guardados en archivo\n");
		for(Yytoken t: this.tokens){
			System.out.println(t);
			out.write(t + "\n");
		}
		out.close();
	}
%}

//Contador para los tokens
%init{
    contador = 0;
	tokens = new ArrayList<Yytoken>();
%init}

//Cuando se alcanza el fin del archivo de entrada
%eof{
	try{
		this.writeOutputFile();
        System.exit(0);
	}catch(IOException ioe){
		ioe.printStackTrace();
	}
%eof}

%line //Activar el contador de lineas, variable yyline
%column //Activar el contador de columna, variable yycolumn
//Fin de opciones

letra = [A-Za-z]
digito = [0-9]
alfanumerico = {letra}|{digito}
other_id_char = [_]
identificador = {letra}({alfanumerico}|{other_id_char})*
entero = ({digito})+
enteroNegativo = \-{entero}
real = {entero}\.{entero}
realNegativo = \-{real}
espacio = " "
char = '.'
salto = \n|\r|\r\n
whitespace = [ \n\t]

//Reglas léxicas
%%
{entero} {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Número entero",yyline,yycolumn);
    tokens.add(t);
    return t;
}
{real} {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Número real",yyline,yycolumn);
    tokens.add(t);
    return t;
}
{enteroNegativo} {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Número entero negativo",yyline,yycolumn);
    tokens.add(t);
    return t;
}

{realNegativo} {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Número real negativo",yyline,yycolumn);
    tokens.add(t);
    return t;
}
//Palabras reservadas
"and" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada, operador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"array" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"begin" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"boolean" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"byte" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"case" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"char" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"const" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"div" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada, operador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"do" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"downto" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"else" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"end" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"false" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"file" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"for" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"forward" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"function" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"goto" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"if" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"in" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"inline" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"int" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"label" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"longint" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"mod" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada, operador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"nil" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"not" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada, operador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"of" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"or" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada, operador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"packed" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"procedure" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"program" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"read" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"real" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"record" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"repeat" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"set" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"shortint" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"string" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"then" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"to" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"true" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"type" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"until" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"var" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"while" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"with" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"write" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"xor" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Palabra reservada, operador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
//Identificador
{identificador} {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Identificador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
//Operadores
"," {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Operador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
";" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Operador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"++" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Operador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"--" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Operador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
">=" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Operador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
">" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Operador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"<=" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Operador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"<" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Operador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"<>" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Operador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"=" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Operador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"+" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Operador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"-" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Operador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"*" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Operador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"/" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Operador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"(" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Operador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
")" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Operador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"[" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Operador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"]" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Operador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
":=" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Operador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"." {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Operador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
":" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Operador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"+=" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Operador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"-=" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Operador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"*=" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Operador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"/=" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Operador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
">>" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Operador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"<<" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Operador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"<<=" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Operador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
">>=" {
	contador++;
	Yytoken t = new Yytoken(contador,yytext(),"Operador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
//Otros
{espacio} {
 	//ignorar
}
{whitespace} {
	//Ignorar
}
{salto} {
    contador++;
    Yytoken t = new Yytoken(contador,"","fin linea",yyline,yycolumn);
    tokens.add(t);
    return t;
}


/*{whitespace} {}

{letra}({letra}|{digito})* {lexeme=yytext(); 
                                return ID;}
("(-"{digito}+")")|{digito}+ {lexeme=yytext(); 
                                return INT;}
. {return ERROR;}*/
