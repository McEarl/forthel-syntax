# FTL-TeX tokenizing

This chapter describes a specification of a lexer for the content of `forthel`
environments within an FTL-TeX document. This means a parser for the grammar
described in this chapter is intended to accept any arbitrary string of
characters from Unicode's _Basic Latin_ code block and split it into
_FTL-TeX lexemes_. (Note that we use the word _token_ as a synonym for _lexeme_
in the following to match the usage of the word _token_ in the referenced
literature.)


```nbnf
<ftl-tex tokens> = { <alphanumeric token> | <symbolic token> | <backslashed token> | <white token> }
```


## Tokens

```nbnf
<white token> = <<Horizontal space>>
              | <<Vertical space>>
              | "$"
              | "\\\\"
              | "\\["
              | "\\]"
              | <comment>
```

```nbnf
<comment> = "%" { <<Visible Character>> | <<Horizontal Space>> } <<Vertical Space>>
```

```nbnf
<alphanumeric token> = <<Alphanum>> { <<Alphanum>> }
```

```nbnf
<symbolic token> = <<Symbol>> \ { "%", "\\" }
```

```nbnf
<backslashed token> = "\\" ( <<Alphanum>> { <<Alphanum>> } | <<Symbol>> \ { "\\", "[", "]" } )
```

The following rules are only needed to specify certain special tokens in the
next paragraphs.

```nbnf
<alphabetic token> = <<Letter>> { <<Letter>> }
```

```nbnf
<numeric token> = <<Digit>> { <<Digit>> }
```


## Special symbols

```nbnf
<greek letter> = <lower greek letter>
               | <upper greek letter>
               | <varied greek letter>
```

```nbnf
<lower greek letter> = "\\alpha"
                     | "\\beta"
                     | "\\gamma"
                     | "\\delta"
                     | "\\epsilon"
                     | "\\zeta"
                     | "\\eta"
                     | "\\theta"
                     | "\\iota"
                     | "\\kappa"
                     | "\\lambda"
                     | "\\mu"
                     | "\\nu"
                     | "\\xi"
                     | "\\pi"
                     | "\\rho"
                     | "\\sigma"
                     | "\\tau"
                     | "\\upsilon"
                     | "\\phi"
                     | "\\omicron"
                     | "\\chi"
                     | "\\psi"
                     | "\\omega"
```

```nbnf
<upper greek letter> = "\\Gamma"
                     | "\\Delta"
                     | "\\Theta"
                     | "\\Lambda"
                     | "\\Xi"
                     | "\\Pi"
                     | "\\Sigma"
                     | "\\Upsilon"
                     | "\\Phi"
                     | "\\Psi"
                     | "\\Omega"
```

```nbnf
<varied greek letter> = "\\varbeta"
                      | "\\varepsilon"
                      | "\\vartheta"
                      | "\\varkappa"
                      | "\\varpi"
                      | "\\varvarpi"
                      | "\\varrho"
                      | "\\varvarrho"
                      | "\\varsigma"
                      | "\\varphi"
```

```nbnf
<argument symbol> = <alphanumeric character>
                  | <<Symbol>> \ { "%", "]" }
```

## Special tokens

```nbnf
<regular token> = <regular alphanumeric token>
                | <regular symbolic token>
```

```nbnf
<regular alphabetic token> = <<Letter>>+ \ { 'the', 'a', 'an', 'is', 'are', 'be' }
```

```nbnf
<regular alphanumeric token> = <<Alphanum>>+ \ { 'the', 'a', 'an', 'is', 'are', 'be' }
```

```nbnf
<regular symbolic token> = <<Symbol>> \ { "%", "." }
```

```nbnf
<label token> = <alphanumeric token>
              | "_"
```

```nbnf
<variable token> = <<Letter>> { <<Alphanum>> }
```

```nbnf
<var token> = <alphabetic token>
```

```nbnf
<argument token> = <alphanumeric token>
                 | <<Symbol>> \ { "#", "]" }
```

```nbnf
<environment name token> = <alphanumeric token>
                         | <<Symbol>> \ { "#", "]" }
```


## Alphabets


```nbnf
<<Alphanum>> = "0" | ... | "9"
             | "A" | ... | "Z"
             | "a" | ... | "z"
```

```nbnf
<<Letter>> = "A" | ... | "Z"
           | "a" | ... | "z"
```

```nbnf
<<Digit>> = "0" | ... | "9"
```

```nbnf
<<Symbol>> = "\U+0021;" | ... | "\U+002F;"
           | "\U+003A;" | ... | "\U+0040;"
           | "\U+005B;" | ... | "\U+0060;"
           | "\U+007B;" | ... | "\U+007E;"
```

Horizontal tab or space:

```nbnf
<<Horizontal Space>> = "\U+0009;"
                     | "\U+0020;"
```

Line feed, vertical tab, form feed or chrriage return:

```nbnf
<<Vertical Space>> = "\U+000A;"
                   | "\U+000B;"
                   | "\U+000C;"
                   | "\U+000D;"
```

```nbnf
<<Visible Character>> = "\U+0021;" | ... | "\U+007E;"
```
