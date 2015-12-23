grammar MiniJava;

goal: mainClass (classDeclaration)* EOF ;

mainClass: 'class' IDENTIFIER '{' 'public' 'static' 'void' 'main' '(' 'String[]' IDENTIFIER ')' '{' statement '}' '}' ;

classDeclaration: 'class' IDENTIFIER ('extends' IDENTIFIER)? '{' (varDeclaration)* (methodDeclaration)* '}' ;

varDeclaration:	type IDENTIFIER ';' ;

methodDeclaration: 'public' type IDENTIFIER '(' (type IDENTIFIER (',' type IDENTIFIER)*)? ')' '{' (varDeclaration)* (statement)* 'return' expression ';' '}' ;

type: 'int[]'
    | 'boolean'
    | 'int'
    | IDENTIFIER ;

statement: '{' (statement)* '}'
    | 'if' '(' expression ')' statement 'else' statement
    | 'while' '(' expression ')' statement
    | 'System.out.println' '(' expression ')' ';'
    | IDENTIFIER '=' expression ';'
    | IDENTIFIER '[' expression ']' '=' expression ';' ;

expression: expression ('&&' | '<' | '+' | '-' | '*') expression
    | expression '[' expression ']'
    | expression '.' 'length'
    | expression '.' IDENTIFIER '(' (expression (',' expression)*)? ')'
    | INTEGER
    | BOOLEAN
    | IDENTIFIER
    | 'this'
    | 'new' 'int' '[' expression ']'
    | 'new' IDENTIFIER '(' ')'
    | '!' expression
    | '(' expression ')' ;


IDENTIFIER: [a-zA-Z_] [a-zA-Z0-9_]* ;

BOOLEAN: 'true'
    | 'false' ;

INTEGER: [1-9][0-9]*
    | '0' ;

WS: [ \t\n\r]+ -> skip ;
LINE_COMMENT: '//' .*? '\n' -> skip ;
COMMENT : '/*' .*? '*/' -> skip ;
