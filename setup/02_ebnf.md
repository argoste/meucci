# Extended BNF

Extended Backus Naur Form as in _ISO/IEC 14977 : 1996(E)_, defines a notation for specifying the syntax  of a linear sequence of symbols.

Definitions

+ _Sequence_ is a ordered list of zero or more items.
+ _Terminal symbol_ (i.e. a terminal character) is a sequence of characters forming an irreducible element of the language.
+ _Non-terminal symbol_  is a syntactic part of the language being defined.
+ _meta-identifier_ is the name of a Non-terminal symbol.

Conventions

+ Terminal symbols are quoted.
+ A meta-identifier is made of word joined together by a symbol (here it is the hyphen).
+ The terminator-symbol is `;`.
+ First quote symbol is single quote `'`, second quote symbol is double quote `"`
+ Parenthesis `()` group items together.
+ Concatenate symbol is comma `,`.
+ Square brackets `[]` contain optional symbols.
+ Curly brackets `{}` indicate repetition. Repetition symbol is star `*`.
+ Except symbol is minus `-`.
+ Explicit number of items.
+ Defining-symbol is `:=`
+ Definition-separator-symbol is `|`.
+ Comments within `(*` and `*)`.

The syntax of a language consist of one or more syntax-rules.

A syntax-rule consist of a meta-identifier followed by a defining-symbol, followed by definition-list followed by a terminator-symbol.

A definition-list consist of an ordered list of one or more single-definitions separated from each other by a definition-separator-symbol.

A single-definition consist of one or more syntactic terms separated from each other by a concatenate-symbol.

A syntactic term consist of either a syntatic factor or a syntactic factor followed by an except-symbol followed by a syntactic-exception.

<!--TODO
syntactic-exception
syntactic-factor
Integer
syntactic-primary
optional-sequence
repeated sequence
grouped sequence
meta-identifier
meta-identifier-character
terminal-string
first-terminal-character
second-terminal-character
special-sequence
special-sequence-character
empty-sequence
-->


### An example: ASCII defined using EBNF

```bash

ASCII_char 	:= 	printable_character | control_character ;

printable_char := 	letter | digit | other_printable ;

letter 		:= 	lowercase | uppercase ;

lowercase 	:=  	'a' | 'b' | 'c' | 'd' | 'e' | 'f' | 'g' | 'h' | 'i' | 'j'
    | 'k' | 'l' | 'm' | 'n' | 'o' | 'p' | 'q' | 'r' | 's' | 't' | 'u' | 'v'
    | 'w' | 'y' | 'x' | 'z' ;

uppercase 	:=  	'A' | 'B' | 'C' | 'D' | 'E' | 'F' | 'G' | 'H' | 'I' | 'J'
    | 'K' | 'L' | 'M' | 'N' | 'O' | 'P' | 'Q' | 'R' | 'S' | 'T' | 'U' | 'V'
    | 'W' | 'Y' | 'X' | 'Z' ;

digit 		:=		'0'|'1'|'2'|'3'|'4'|'5'|'6'|'7'|'8'|'9' ;

other_printable := space |	'!' | '"' | '#' | '$' | '%' | '&' | "'" | '(' | ')'
    | '*' | '+' | ',' | '-' | '.' | '/' | ':' | ';' | '<' | '=' | '>' | '?'
    | '@' | '[' | '\' | ']' | '^' | '_' | '`' | '{' | '|' | '}' | '~';

space		:=	' ' ;

control_character := 	NUL | SOH | STX | ETX | EOT | ENQ | ACK | BEL | BS | HT
    | LF | VT | FF | CR | SO | SI | DLE | DC1 | DC2 | DC3 | DC4 | NAK | SYN
    | ETB | CAN | EM | SUB | ESC | FS | GS | RS | US | DEL ;

```


