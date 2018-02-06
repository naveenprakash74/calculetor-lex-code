%{
#include<stdio.h>
#include<math.h>
int op=0,i;
int a,b;
%}

digit [0-9]+|([0-9]*)"."([0-9]+)
add "+"
sub "-"
mul "*"
div "/"
ln \n


%%
{digit} {dig();} 
{add} {op=1;}
{sub} {op=2;}
{mul} {op=3;}
{div} {op=4;}

{ln} {printf("\n the result :%d\n\n",a);}

%%


int dig()
{
   if(op==0)
       {a=atoi(yytext); }
   else
    {
       b=atoi(yytext);
       switch(op)
        {
         case 1:a=a+b;
               break;
         case 2:a=a-b;
               break;
         case 3:a=a*b;
               break;
         case 4:a=a/b;
               break;
         
     }
        op=0;
     }
}
void main()
{
yylex();
}
/*int yywrap()
{
return -1;
}*/
