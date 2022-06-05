%{
%}
letter [A-Za-z]
digit [0-9]
identifier {letter}({letter}|{digit})*
number {digit}+
punctuation [;,''#(){}]
operators "+"|"-"|"*"|"="|">"|"<"
keyword "if"|"else"|"for"|"int"|"while"|"do"|"void"
literal \".*\"
comment "//".*
headerfile "#".*
multicomment "/*".*"*/"
%%
{keyword} {printf("keyword %s is found",yytext);}
{identifier} {printf("identifier %s is found",yytext);}
{number} {printf("number %s is found",yytext);}
{punctuation} {printf("punctuation %s is found",yytext);}
%%
int main(){
yylex();
}
int yywrap(){
return 1;
}
