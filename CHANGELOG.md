# Changelog

A complete listing of all changes on the _syntax_ of ForTheL after the
integration of Naproche into [Isabelle][1] in 2021.
For a desctiption of the _semantic_ changes on ForTheL see the
[Naproche changelog][2].

The badges ![FTL badge](./img/badge_ftl.svg) and
![FTL-TeX badge](./img/badge_ftl-tex.svg) mark the ForTheL variants which are
affected by a change of the specification of ForTheL.


[1]: <https://isabelle.in.tum.de/index.html>
[2]: <https://github.com/naproche/naproche/blob/master/CHANGELOG.md>


--------------------------------------------------------------------------------


## naproche-20211211 (Isabelle 2021-1)

### 2021-11-28

* ![FTL badge](./img/badge_ftl.svg) ![version: FTL-TeX](./img/badge_ftl-tex.svg)

  `_` is a regular character now.


### 2021-11-26

* ![version: FTL-TeX](./img/badge_ftl-tex.svg)

  Top-level sections can now be labeled with the `\label{...}` command.
  There are now four ways the header of a top-level section can look like:

  - **Name and identifier:**
    ```
    \begin{...}[<name>]\label{<identifier>}
    ```
    In this case `<name>` can contain any arbitrary character, whereas
    `<identifier>` must not contain any other characters than letters, digits,
    spaces and `_`.

  - **Identifier only:**
    ```
    \begin{...}\label{<identifier>}
    ```
    Here, the same conventions apply to `<identifier>` as in _Name and
    identifier_.

  - **Name only:**
    ```
    \begin{...}[<name>]
    ```
    In this case the same conventions apply to `<name>` as to `<identifier>` in
    _Name and identifier_.

  - **Neither identifier nor name:**
    ```
    \begin{...}
    ```


* ![version: FTL-TeX](./img/badge_ftl-tex.svg)

  References to named assertions now support LaTeX's `\ref{...}` and
  `\nameref{...}` commands.
  I.e. references to an assertion can also be written as
  `(by \ref{<identifier>})` or `(by \nameref{<identifier>})` besides
  `(by <identifier>)`.



### 2021-11-25

* ![version: FTL-TeX](./img/badge_ftl-tex.svg)

  Arguments of argument instructions can be put in `\path{...}`, e.g.
  `[read \path{some/forthel/text.ftl}]`


### 2021-11-15

* ![version: FTL-TeX](./img/badge_ftl-tex.svg)

  `"` is a regular character now.


* ![version: FTL-TeX](./img/badge_ftl-tex.svg)

  Expressions of the following kinds can be enclosed within `\text{...}`:

    - Function bodies
    - LHSs and RHSs of class terms
    - The content of parenthesized statements in symbolic formulas

  Examples:

    - `Define $f(x) = \text{choose an integer $n$ such that $x = [n]$ in $[n + 1]$}$ for $x \in \mathbb{Z}_{4}$.`
    - `\{ p \mid \text{$p$ is a prime number such that $p + 2$ is prime} \}`
    - `\class{x | \text{$x$ is a set such that $x \notin x$}}`
    - `y \in \bigcup x \iff (\text{$y$ is contained in some element of $x$})`


* ![version: FTL-TeX](./img/badge_ftl-tex.svg)

  You can use `\class{... | ...}` as an alternative to `\{ ... \mid ... \}` for
  writing class terms.


### 2021-10-26

* ![FTL badge](./img/badge_ftl.svg) ![version: FTL-TeX](./img/badge_ftl-tex.svg)

  `the collection of` is a new alternative to the expression `the class of`.
  Moreover, both of them can be followed by an optional `all`.
  I.e. for instance the following formulations are supported now:

    - `the collection of sets`
    - `the collection of all prime numbers`
    - `the class of subsets of x`
    - `the class of all sets x such that x is not an element of x`


* ![FTL badge](./img/badge_ftl.svg) ![version: FTL-TeX](./img/badge_ftl-tex.svg)

  Notion separation in descriptive class terms (e.g. something like
  `{set x | ...}`) is no longer supported.


### 2021-03-24

* ![version: FTL-TeX](./img/badge_ftl-tex.svg)

  `\[` and `\]` are a new kind of whitetokens, i.e. they are completely ignored
  by Naproche.
