%{ 
// modify or add more rules between %% (line 29) and %% (the last line) 

#include "tokens.h"
# undef yywrap
# define yywrap() 1



#undef YY_DECL
#define YY_DECL int yylex()
YY_DECL;


// Code run each time a pattern is matched.
#undef  YY_USER_ACTION  
# define YY_USER_ACTION  {}



%}

%option yylineno
%option noyywrap 

DIGIT [0-9] 
ALPHA [a-zA-Z]

%%

\/\/.*$   
[ \t]+            
[\n]+              

";"      { 
           return ';'; 
         }

"+"      { 
            return OP_ADD;
         }

"-"     {
            return OP_SUB;
        }

"*"      {
            return OP_MUL;
         }

"/"       {
            return OP_DIV;
          }

"="      { 
            return OP_ASSIGN; 
         }

"<"      {
            return OP_LT;
         }

">"       {
            return OP_GT;
          }

"~="      {
            return OP_DIFF;
          }

"=="      {
            return OP_EQ;
          }

"+="     { 
           return OP_ADDINC; 
         }

"++"     { 
           return OP_PLUSPLUS; 
         }

"<="     { 
           return OP_LEQ; 
         }

">="     { 
           return OP_GEQ; 
         }




"MAIN"   { 
           return K_MAIN; 
         }

{DIGIT}+ { 
           return L_INTEGER;
         }

// Identifiers
^@[a-z](([a-z])|([0-9])|(_))*$ { 
  
           return T_ID;
         }

// Floating-point number
^(|\+|-)[0-9]+.[0-9]+$ { 
  
           return L_FLOAT;
         }

<<EOF>>  { return T_EOF ; }
.        { printf ("Unexpected character\n"); exit (1); }


%%