%{
#include<stdlib.h>
#include<stdio.h>
int yylex();
int yyerror();
%}
%token VERB ADVERB ADJECTIVE PREPOSITION CONJUNCTION PRONOUN NOUN COMMA NL;
%%

sentence: simplesentence NL {printf("parsed a simple sentence. \n");exit(0);}
	| compoundsentence NL {printf("parsed a compound sentence. \n");exit(0);}
	;
simplesentence: subject verb object
	| subject verb object prepphrase
	;
compoundsentence: simplesentence CONJUNCTION simplesentence
	| compoundsentence CONJUNCTION simplesentence
	;
subject: NOUN
	|PRONOUN
	|ADJECTIVE subject
	;
verb: VERB
	|ADVERB VERB
	|verb VERB
	;
object: NOUN
	|ADJECTIVE object
	;
prepphrase: PREPOSITION NOUN
	;
%%
int main(){
yyparse();
}
int yyerror(){
printf("Invalid Statement");
}
int yywrap(){
return 1;
}
