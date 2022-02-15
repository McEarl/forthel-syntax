# Conventions

This syntax reference is written in [NBNF][nbnf], an extension of [BNF][bnf],
where the following conventions are adopted.

--------------------------------------------------------------------------------
Pattern                               Meaning
------------------------------------  ------------------------------------------
`pattern₁ | pattern₂ | … | patternₙ`   Choice

`[ pattern ]`                         Option

`( pattern )`                         Grouping

`{ pattern }`                         Zero or more repetitions

`pattern₁ pattern₂ … patternₙ`        Concatenation

`"string"`                            Case-sensitive string

`'string'`                            Case-insensitive string

`⟨identifier⟩`                        Non-terminal

`⟪identifier⟫`                        Alphabet (see below)

`⟪identifier⟫ \ (expr₁, …, exprₙ)`    A character (i.e. single-character string)
                                      that matches the alphabet `⟪identifier⟫`,
                                      but none of the expressions
                                      `expr₁`, …, `exprₙ` which can either be
                                      case-sensitive or case-insensitive
                                      characters.

`⟪identifier⟫* \ (expr₁, …, exprₙ)`   All words over the alphabet `⟪identifier⟫`
                                      that do not match any of the expressions
                                      `expr₁`, …, `exprₙ` which can either be
                                      case-sensitive or case-insensitive
                                      strings.

`⟪identifier⟫+ \ (expr₁, …, exprₙ)`   All non-empty words over the alphabet
                                      `⟪identifier⟫` that do not match any of
                                      the expressions `expr₁`, …, `exprₙ` which
                                      can either be case-sensitive or
                                      case-insensitive strings.
--------------------------------------------------------------------------------

An alphabet is a non-terminal, where the right-hand side of its definition must
consist of an expression of the form `expr₁ | expr₂ | … | exprₙ`, where
`exprₙ`, …, `exprₙ` can be single case-sensitive characters or so-called
_character lists_, i.e. expressions of the form `"char₁" | ... | "char₂"`
(here the `...` are part of the syntax), where `char₁` and `char₂` are
arbitrary characters. Such a character list accepts all characters in the
Unicode table from the code point of `char₁` to the code point of `char₂`.

To avoid parentheses, we assume that choice has a lower precedence than
concatenation.

Within a string the following characters have to be escaped by prepending a
backslash to them: `\`, `"`, `'`. Any special characters can be represented by
the pattern `\U+XXXX;`, where `XXXX` is its hexadecimal Unicode code point.

Moreover, identifiers of non-terminals and alphabets are only allowed to contain
the letters "a" - "z", "A" - "Z", the digits "0" - "9", spaces and the
characters "-" and "_".


[nbnf]: <https://github.com/McEarl/nbnf-tools/blob/master/docs/nbnf-desctiption.md> "enriched Backus-Naur form"
[bnf]: <https://en.wikipedia.org/wiki/Backus%E2%80%93Naur_form> "Backus-Naur form"
