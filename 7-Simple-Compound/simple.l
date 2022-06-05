%{
#include<stdio.h>
#include"y.tab.h"
%}
verb play|is|am|are|was|were|be|being|do|does
adverb very|simple|gently|calmly
preposition to|from|above
conjunction if|then|and
adjective their|my|your
pronoun I|you|he|she
noun [a-zA-Z]+

%%
{verb} return VERB;
{adverb} return ADVERB;
{preposition} return PREPOSITION;
{conjunction} return CONJUNCTION;
{adjective} return ADJECTIVE;
{pronoun} return PRONOUN;
{noun} return NOUN;
"," return COMMA;
"\n" return NL;
%%

