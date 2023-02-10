grammar main;

start : include statements EOF;

include : IMPORT ':' ':' LEFT_PARENTHESES library
    ',' (all_class | class_name) RIGHT_PARENTHESES '.' ';' ';'  | include include;

object_oriented : ACCESS? variable_name CLASS inherited?
    implements? BEGIN statements END ';'? ;

function : ACCESS? STATIC?
    FUNC function_name LEFT_PARENTHESES
    function_input? RIGHT_PARENTHESES
    RETURNS datatype '{' statements
    (RETURN LEFT_PARENTHESES variable_name? RIGHT_PARENTHESES ';')?
     '}' ';'? ;

ravie_ha : ACCESS?  STATIC?
    PROC ALPHABET
    LEFT_PARENTHESES statements RIGHT_PARENTHESES ';' ;

for_loop : (FOR LEFT_PARENTHESES ACCESS?
    VAR variable_name ':' datatype ('=' initial_value)?
    (';' condition)? (';' loop_creament)?
    RIGHT_PARENTHESES ('{' statements '}' | statements) ';'?)
    |
    FOR EVERY ACCESS? VAR variable_name
    IN variable_name DO
    statements UNTIL END ';'?;

while_loop : WHILE LEFT_PARENTHESES condition
    RIGHT_PARENTHESES BEGIN statements END;

do_while : DO statements AS_LONG_AS condition ';';

if_statement : IF '{' condition '}' THEN statements
    (ELIF LEFT_PARENTHESES condition RIGHT_PARENTHESES DO statements END)?
    (ELSE DO AS FOLLOW statements STOP)? ';'?
    |
    condition '?' statements ':' statements ';'? ;

switch_case : SWITCH variable_name
    MATCH case deafult? END;

try_catch : TRY '{' '{' statements '}' '}'
    CATCH LEFT_PARENTHESES error? RIGHT_PARENTHESES
    BEGIN statements END;

array_define : ACCESS?  CONSTANT? VAR '['
    ('0' ':' integer)?
    ']'variable_name ':'
    datatype ('=' '{' '[' initial_value ']' '}')? ';'? ;

variable_define : ACCESS?
    CONSTANT? VAR variable_name ':' datatype
    ('=' initial_value)? ';'? ;

reference : (ACCESS | )  class_name reference_name '->'
    (NEW class_name ('[' '0' ':' INTEGER_TYPE ']')?
    LEFT_PARENTHESES parameter RIGHT_PARENTHESES | NULL) ';'? ;

assingment : variable_name '<-' value ';'?;






creament : variable_name (MUL_ASSIGN | DIV_ASSIGN | PLUS_ASSIGN | MINUS_ASSIGN) (variable_name | initial_value)|
    variable_name CREAMENT | CREAMENT (variable_name | initial_value);
loop_creament : variable_name CREAMENT | CREAMENT variable_name;
library : ALPHABET;
class_name : ALPHABET | class_name ',' class_name;
all_class : '*';
reference_name : ALPHABET;
inherited : INHERITED FROM parent_class_name;
implements : IMPLEMENTS interface;
function_input : function_input function_input |
    variable_name datatype ';' | VAR variable_name ':' datatype ';';
parent_class_name : ALPHABET | parent_class_name ',' parent_class_name;
statements :  statements statements | function | variable_define
    | do_while | for_loop | assingment
    | ravie_ha | while_loop
    | object_oriented | creament
    | try_catch | switch_case | if_statement | reference
    | print | array_define;
print : 'print' LEFT_PARENTHESES (variable_name | initial_value) RIGHT_PARENTHESES;
error : error_class_name error_name | error ',' error;
error_class_name : ALPHABET;
error_name : ALPHABET;
variable_name : ALPHABET;
case : CASE value ':' statements? (BREAK ';')?  | case case;
deafult : DEAFULT value ':' statements? (BREAK ';')?;
interface : ALPHABET | interface ',' interface;
condition : condition ANDAND condition | condition OROR condition |
    condition OR condition | condition AND condition |
    (variable_name | initial_value) 
    (EQL | NEQ | LSQ | GRQ | LSS | GRT) 
    (variable_name | initial_value) | BOOLEAN_TYPE;

parameter : parameter ',' parameter | ALPHABET | initial_value | ;
datatype : INTEGER | FLOAT | STRING | CHAR;
value : ALPHABET | value ',' value | INTEGER_TYPE | value PLUS value |
    value MIUNS value | value MUL value | value DIV value
    | value POWER LEFT_PARENTHESES (INTEGER_TYPE | FLOAT_TYPE) RIGHT_PARENTHESES |
    initial_value;
function_name : ALPHABET;
initial_value : integer | string | char | float
    | boolean | initial_value ',' initial_value;
integer : INTEGER_TYPE | '0';
float : FLOAT_TYPE;
string : STRING_TYPE;
char : CHAR_TYPE;
boolean : BOOLEAN_TYPE;



fragment A: 'a' | 'A';
fragment B: 'b' | 'B';
fragment C: 'c' | 'C';
fragment D: 'd' | 'D';
fragment E: 'e' | 'E';
fragment F: 'f' | 'F';
fragment G: 'g' | 'G';
fragment H: 'h' | 'H';
fragment I: 'i' | 'I';
fragment J: 'j' | 'J';
fragment K: 'k' | 'K';
fragment L: 'l' | 'L';
fragment M: 'm' | 'M';
fragment N: 'n' | 'N';
fragment O: 'o' | 'O';
fragment P: 'p' | 'P';
fragment Q: 'q' | 'Q';
fragment R: 'r' | 'R';
fragment S: 's' | 'S';
fragment T: 't' | 'T';
fragment U: 'u' | 'U';
fragment V: 'v' | 'V';
fragment W: 'w' | 'W';
fragment X: 'x' | 'X';
fragment Y: 'y' | 'Y';
fragment Z: 'z' | 'Z';


INTEGER_TYPE : '-'? (BINARY | DECIMAL | HEXADECIMAL);
DECIMAL : ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9')+;
HEXADECIMAL : '0' X ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' | A | B | C | D | E | F)+;
BINARY : ('0' | '1')+ B;
FLOAT_TYPE : ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9')
    '.' DECIMAL 'e'? '-'? DECIMAL;
BOOLEAN_TYPE : TRUE | FALSE;


ACCESS : DIRECTACCESS | INDIRECTACCESS | RESTRICTED;


INHERITED : I N H E R I T E D;
FROM : F R O M;
IMPORT : I M P O R T;
CLASS : C L A S S;
STATIC : S T A T I C;
FUNC : F U N C;
BEGIN : B E G I N;
END : E N D;
RETURNS : R E T U R N S;
RETURN : R E T U R N ;
PROC : P R O C;
CONSTANT : C O N S T A N T;
NEW : N E W;
VAR : V A R;
IMPLEMENTS : I M P L E M E N T S;
FOR : F O R;
WHILE : W H I L E;
AS_LONG_AS : A S '_' L O N G '_' A S;
EVERY : E V E R Y;
IF : I F;
THEN : T H E N;
ELSE : E L S E;
SWITCH : S W I T C H;
CHAR : C H A R;
STRING : S T R I N G;
BOOLEAN : B O O L E A N;
ELIF : E L I F;
AS : A S;
STOP : S T O P;
FOLLOW : F O L L O W;
TRUE : T R U E;
FALSE : F A L S E;
BREAK : B R E A K;
TRY : T R Y;
CATCH : C A T C H;
INTEGER : I N T E G E R;
CASE : C A S E;
MATCH : M A T C H;
DEAFULT : D E A F U L T;
IN : I N;
DO : D O;
UNTIL : U N T I L;
FLOAT : F L O A T;
DIRECTACCESS : D I R E C T A C C E S S;
INDIRECTACCESS : I N D I R E C T A C C E S S;
RESTRICTED : R E S T R I C T E D;



ALPHABET : [a-zA-Z]+;
SMALL_LETER : [a-z]+;
CAPITAL_LETER : [A-Z]+;
STRING_TYPE: '"'.*? '"';
CHAR_TYPE: '\'' . '\'';
NULL_TYPE : 'null';
NULL : N U L L;

POWER : '^';
LEFT_PARENTHESES :  '(' ;
RIGHT_PARENTHESES :  ')' ;
PWR :  '^' ;
CREAMENT: '++' | '--';
UNARY_MINUS: '-' ALPHABET;
SHIFT: '>>' | '<<';
MUL :  '*' ;
DIV :  '/' ;
DIVDIV: '//';
RIMINDER: '%';
PLUS :  '+' ;
MIUNS :  '-' ;
EQL :  '==' ;
NEQ :  '!=' ;
LSQ :  '<=' ;
GRQ :  '>=' ;
LSS :  '<'  ;
GRT :  '>'  ;
ANDAND : '&&' ;
AND : '&' | 'and' ;
OROR :  '||' ;
OR: 'or' | '|' ;
PLUS_ASSIGN: '+=';
MINUS_ASSIGN: '-=';
DIV_ASSIGN: '/=';
MUL_ASSIGN: '*=';

S1 : [ \r\n\t] -> skip;
S2 : '--' ~[\r\n]* -> skip;
COMMENT: '!#' .*? '!#' -> skip;



