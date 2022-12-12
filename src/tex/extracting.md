# TEX extraction

This chapter describes a specification of an "extractor" which extracts the
content of `forthel` environments from a TEX document, i.e. everything
enclosed within the tags `\begin{forthel}` and `\begin{forthel}`. This means a
parser for the grammar described in this chapter is intended to accept any
arbitrary string of characters from Unicode's _Basic Latin_ code block and
returns the content of all `forthel` environments it contains.

```nbnf
<tex document> = [ <ignored text> ] { "\\begin{forthel}" <tex text> "\\end{forthel}" [ <ignored text> ] }
```

Text before any occurence of the string `\begin{forthel}` is intended to be
ignored by a ForTheL compiler. Hence it can be arbitrary text not containing
`\begin{forthel}` as a substring.

```nbnf
<ignored text> = ""
               | ( <<Latin>> \ { "\\" } ) <ignored text>
               | "\\" ( <<Latin>> \ { "\\" } ) <ignored text>
               | "\\\\" ( <<Latin>> \ { "b" } ) <ignored text>
               | "\\\\b" ( <<Latin>> \ { "e" } ) <ignored text>
               | "\\\\be" ( <<Latin>> \ { "g" } ) <ignored text>
               | "\\\\beg" ( <<Latin>> \ { "i" } ) <ignored text>
               | "\\\\begi" ( <<Latin>> \ { "n" } ) <ignored text>
               | "\\\\begin" ( <<Latin>> \ { "{" } ) <ignored text>
               | "\\\\begin{" ( <<Latin>> \ { "f" } ) <ignored text>
               | "\\\\begin{f" ( <<Latin>> \ { "o" } ) <ignored text>
               | "\\\\begin{fo" ( <<Latin>> \ { "r" } ) <ignored text>
               | "\\\\begin{for" ( <<Latin>> \ { "t" } ) <ignored text>
               | "\\\\begin{fort" ( <<Latin>> \ { "h" } ) <ignored text>
               | "\\\\begin{forth" ( <<Latin>> \ { "e" } ) <ignored text>
               | "\\\\begin{forthe" ( <<Latin>> \ { "l" } ) <ignored text>
               | "\\\\begin{forthel" ( <<Latin>> \ { "}" } ) <ignored text>
```

A ForTheL text is an arbitrary text which does not contain the string
`\end{forthel}`:

```nbnf
<forthel text> = ""
               | ( <<Latin>> \ { "\\" } ) <forthel text>
               | "\\" ( <<Latin>> \ { "\\" } ) <forthel text>
               | "\\\\" ( <<Latin>> \ { "e" } ) <forthel text>
               | "\\\\e" ( <<Latin>> \ { "n" } ) <forthel text>
               | "\\\\en" ( <<Latin>> \ { "d" } ) <forthel text>
               | "\\\\end" ( <<Latin>> \ { "{" } ) <forthel text>
               | "\\\\end{" ( <<Latin>> \ { "f" } ) <forthel text>
               | "\\\\end{f" ( <<Latin>> \ { "o" } ) <forthel text>
               | "\\\\end{fo" ( <<Latin>> \ { "r" } ) <forthel text>
               | "\\\\end{for" ( <<Latin>> \ { "t" } ) <forthel text>
               | "\\\\end{fort" ( <<Latin>> \ { "h" } ) <forthel text>
               | "\\\\end{forth" ( <<Latin>> \ { "e" } ) <forthel text>
               | "\\\\end{forthe" ( <<Latin>> \ { "l" } ) <forthel text>
               | "\\\\end{forthel" ( <<Latin>> \ { "}" } ) <forthel text>
```

```nbnf
<<Latin>> = "\U+0009;" | ... | "\U+000D;"
          | "\U+0020;" | ... | "\U+007E;"
```
