%{
    #include <stdlib.h>
    #include <stdio.h>
    #include <math.h>
    #include <string.h>

    FILE *f_instr, *f_data;

    char *itob(int x, int w);
    void eval_opernd(char *va, int is_const);
    void eval_label(char *va);
    int find_var(char *var);
    int find_label(char *var);

    int pp;
    int state;
    int ninst = 0;

    int v_count = 0;
    char v_name[100][64];
    int v_val [100];

    int l_count = 0;
    char l_name[100][64];
    int l_val [100];

%}

CONST [-+}?[0-9]+
VARIA [a-zA-Z][a-zA-Z0-9_]*
LABEL @[a-zA-Z][a-zA-Z0-9_]*


%%

"NOP"  {state = 0; if (pp==0) fprintf(f_instr, "00000");}
"LD"   {state = 0; if (pp==0) fprintf(f_instr, "00001");}
"SET"  {state = 0; if (pp==0) fprintf(f_instr, "00010");}
"ADD"  {state = 0; if (pp==0) fprintf(f_instr, "00011");}
"SUB"  {state = 0; if (pp==0) fprintf(f_instr, "00100");}
"MLT"  {state = 0; if (pp==0) fprintf(f_instr, "00101");}
"DIV"  {state = 0; if (pp==0) fprintf(f_instr, "00110");}
"EQU"  {state = 0; if (pp==0) fprintf(f_instr, "00111");}
"GRT"  {state = 0; if (pp==0) fprintf(f_instr, "01000");}
"SMT"  {state = 0; if (pp==0) fprintf(f_instr, "01001");}
"JMP"  {state = 1; if (pp==0) fprintf(f_instr, "01010");}
"JZ"   {state = 1; if (pp==0) fprintf(f_instr, "01011");}
"JNZ"  {state = 1; if (pp==0) fprintf(f_instr, "01100");}
"IN"   {state = 0; if (pp==0) fprintf(f_instr, "01101");}
"SR"   {state = 0; if (pp==0) fprintf(f_instr, "01110");}
"AND"   {state = 0; if (pp==0) fprintf(f_instr, "01111");}
"OUT"   {state = 0; if (pp==0) fprintf(f_instr, "10000");}

{CONST} {eval_opernd(yytext, 1);}
{VARIA} {eval_opernd(yytext, 0);}
{LABEL} {eval_label (yytext+1 );}

%%

int find_var(char *var)
{
    int i, ind = -1;

    for(i=0;i<v_count;i++)
    {
        if (strcmp(var,v_name[i]) == 0)
        {
            ind = i;
            break;
        }
    }
    return ind;
}


int find_label(char *var)
{
    int i, ind = -1;

    for(i=0;i<l_count;i++)
    {
        if (strcmp(var,l_name[i]) == 0)
        {
            ind = i;
            break;
        }
    }
    return ind;
}


void eval_opernd(char *va, int is_const)
{
    int val;
    int p_vez = 0;

    if (state == 0)
    {
        if (find_var(va) == -1)
        {
            p_vez = 1;
            val = (is_const) ? atoi(va) : 0;
            strcpy(v_name[v_count], va);
            v_val[v_count] = val;
            v_count++;
        }
    }

    if (pp == 0)
    {
        int addr;

        if (state == 0)
            addr = find_var(va);
        else
            addr = find_label(va);

        fprintf(f_instr, "%s\n", itob(l_val[addr],8));
    }
    else ninst++;

    if (pp == 1 && state == 0 && p_vez == 1)
    {
        fprintf(f_data, "%s\n", itob(v_val[find_var(va)],16));
    }
}


void eval_label(char *va)
{
    if (pp == 1)
    {
        strcpy(l_name[l_count], va);
        l_val[l_count] = ninst;
        l_count++;
    }
}

char *itob(int x, int w)
{
    int z;
    char *b = (char *) malloc(w+1);
    b[0] = '\0';

    int s = (w >31) ? 31 : w;
    if (w > 31)
    for (z = 0; z < w-31; z++)
        if (x < 0) strcat(b, "1"); else strcat(b, "0");
    for(z = pow(2,s-1); z > 0; z >>= 1)
        strcat(b, ((x&z)==z) ? "1" : "0");

        return b;
}

int main (int argc, char *argv[])
{
    pp = 1;
    yyin = fopen(argv[1],"r");
    f_instr = fopen("rom.mif", "w");
    f_data = fopen("ram.mif", "w");

    yylex();
    fclose(yyin);

    yyin = fopen(argv[1],"r");
    pp = 0;
    yylex();

    fclose(yyin);
    fclose(f_instr);
    fclose(f_data);

    return 0;
}



