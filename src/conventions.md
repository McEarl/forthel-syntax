# Conventions

This syntax reference is written in [NBNF][nbnf], an extension of [BNF][bnf],
where the following conventions are adopted.

--------------------------------------------------------------------------------
Pattern                                      Meaning
-------------------------------------------  -----------------------------------
`pattern | pattern | ... | pattern`          Choice

`[ pattern ]`                                Option

`( pattern )`                                Grouping

`{ pattern }`                                Zero or more repetitions

`pattern pattern ... pattern`                Concatenation

`"string"`                                   Case-sensitive string

`'string'`                                   Case-insensitive string

`<identifier>`                               Non-terminal

`<<identifier>>`                             Alphabet

`<<identifier>> \ (expr_1, ..., expr_n)`     An arbitrary string which matches
                                             the alphabet `<<identifier>>`, but
                                             none of the expressions `expr_1`,
                                             ..., `expr_n`, where these
                                             expressions can either be
                                             case- sensitive or case-insensitive
                                             characters (i.e. strings which
                                             consist of only one character).

`<<identifier>>* \ (expr_1, ..., expr_n)`    All words over all strings which
                                             accepted by the alphabet
                                             `<<identifier>>`, but none of the
                                             expressions `expr_1`, ...,
                                             `expr_n`, where these expressions
                                             can either be case-sensitive or
                                             case-insensitive strings.

`<<identifier>>+ \ (expr_1, ..., expr_n)`    All non-empty words over all
                                             strings which accepted by the
                                             alphabet `<<identifier>>`, but none
                                             of the expressions `expr_1`, ...,
                                             `expr_n`, where these expressions
                                             can either be case-sensitive or
                                             case-insensitive strings.
--------------------------------------------------------------------------------

An alphabet is a non-terminal where the right-hand side of its definition must
consist of an expression of the form `expr_1 | expr_2 | ... expr_n`, where
`expr_1`, ..., `expr_n` can be case-sensitive characters or so-called
_character lists_, i.e. expressions of the form `"char_1" | ... | "char_2"`,
where `char_1` and `char_2` are arbitrary characters. Such a character list
accepts all characters in the Unicode table from the code point of `char_1` to
the code point of `char_2`.

To avoid parentheses, we assume that choice has a lower precedence than
concatenation.

Within a string the following characters have to be escaped by prepending a
backslash to them: `\`, `"`, `'`. Any special characters can be represented by
the pattern `\U+XXXX;`, where `XXXX` is its hexadecimal Unicode code point.

Moreover, identifiers of (proper and restricted) non-terminals are only allowed
to contain the letters "a" - "z", "A" - "Z", the digits "0" - "9", spaces and
the characters "-" and "_".


[nbnf]: <https://github.com/McEarl/nbnf/tree/master/README.md> "enriched Backus-Naur form"
[bnf]: <https://en.wikipedia.org/wiki/Backus%E2%80%93Naur_form> "Backus-Naur form"
