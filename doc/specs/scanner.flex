package compiler.lexical;
import compiler.syntax.sym;
import compiler.lexical.Token;
import es.uned.lsi.compiler.lexical.ScannerIF;
import es.uned.lsi.compiler.lexical.LexicalError;
import es.uned.lsi.compiler.lexical.LexicalErrorManager;

//Produced by MV tools 2019-11-07 10:52:06
// incluir aqui, si es necesario otras importaciones

%%

%public
%class Scanner
%char
%line
%column
%cup
%ignorecase


%implements ScannerIF
%scanerror LexicalError

// incluir aqui, si es necesario otras directivas
%{
 LexicalErrorManager lexicalErrorManager = new LexicalErrorManager ();
 private int commentCount = 0;
 int linecom=0;
 int columncom=0;
 int contadorstring=0;


 //Funcion para crear tokens

 Token createToken (int x)	{
 	Token token = new Token (x);
 	 token.setLine (yyline + 1);
 	 token.setColumn (yycolumn + 1);
 	 token.setLexema (yytext ());
 	 return token;
}

 LexicalError createError(String mensaje){
	LexicalError error = new LexicalError (mensaje);
	error.setLine (yyline + 1);
	error.setColumn (yycolumn + 1);
	error.setLexema (yytext ());
	lexicalErrorManager.lexicalError (mensaje);
	 return error;
}
%}  


//Declaracion de expresiones:

ESPACIO      = [\ \t\b\f]
FIN_DE_LINEA = \r\n
DIGITO       = [0-9]
CARACTER     = [A-Za-z]
COMENTARIO   = #.*{FIN_DE_LINEA}
INT       	 = {DIGITO}+
STRING       = \".*\"
ID           = {CARACTER}({CARACTER}|{DIGITO})*

//FIN Declaracion de expresiones:



%%

<YYINITIAL> 
{


//Declaracion de tokens:

	"booleano"  		{return createToken (sym.BOOLEANO);}
	"cierto"  			{return createToken (sym.CIERTO);}
	"comienzo"  		{return createToken (sym.COMIENZO);}
	"constantes"  		{return createToken (sym.CONSTANTES);}
	"de"  				{return createToken (sym.DE);}
	"en"  				{return createToken (sym.EN);}
	"devolver"  		{return createToken (sym.DEVOLVER);}
	"entero"  			{return createToken (sym.ENTERO);}
	"entonces"  		{return createToken (sym.ENTONCES);}
	"escribir" 			{return createToken (sym.ESCRIBIR);}
	"falso"  			{return createToken (sym.FALSO);}
	"fin"  				{return createToken (sym.FIN);}
	"funcion"  			{return createToken (sym.FUNCION);}
	"no"  				{return createToken (sym.NO);}
	"para"  			{return createToken (sym.PARA);}
	"procedimiento"		{return createToken (sym.PROCEDIMIENTO);}
	"programa"  		{return createToken (sym.PROGRAMA);}
	"si"  				{return createToken (sym.SI);}
	"sino"  			{return createToken (sym.SINO);}
	"subprogramas"  	{return createToken (sym.SUBPROGRAMAS);}
	"tipos"  			{return createToken (sym.TIPOS);}
	"var"  				{return createToken (sym.VAR);}
	"variables"  		{return createToken (sym.VARIABLES);}
	"vector"  			{return createToken (sym.VECTOR);}
	"y"  				{return createToken (sym.Y);}
	"("  				{return createToken (sym.PARENTESIS_IZQ);}
	")"  				{return createToken (sym.PARENTESIS_DER);}
	"["  				{return createToken (sym.CORCHETE_IZQ);}
	"]"  				{return createToken (sym.CORCHETE_DER);}
	","  				{return createToken (sym.COMA);}
	";"  				{return createToken (sym.PUNTO_COMA);}
	":"  				{return createToken (sym.DOS_PUNTOS);}
	".."  				{return createToken (sym.RANGO);}
	"."  				{return createToken (sym.PUNTO);}
	"+"  				{return createToken (sym.SUMA);}
	"*"  				{return createToken (sym.PRODUCTO);}
	"<"  				{return createToken (sym.MENOR_QUE);}
	"=="  				{return createToken (sym.IGUAL_QUE);}
	"="  				{return createToken (sym.ASIGNACION);}
	{COMENTARIO}		{}
	{INT}				{return createToken (sym.INT);}
	{STRING}			{return createToken (sym.STRING);}
	{ID}				{return createToken (sym.ID);}
	{ESPACIO}			{}
	{FIN_DE_LINEA}		{}
	
//FIN Declaracion de tokens:

	






//Declaracion de errores:

[^] {
		LexicalError error = new LexicalError ();
		error.setLine (yyline + 1);
		error.setColumn (yycolumn + 1);
		error.setLexema (yytext ());
		lexicalErrorManager.lexicalError (error);
	}

//FIN Declaracion de errores:




 }
