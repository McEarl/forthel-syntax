# The syntax of ForTheL

This package contains a complete syntax reference for ForTheL, both for plain
ForTheL (FTL) and its LaTeX variant (FTL-TeX).


## What is ForTheL?

ForTheL (**For**mal **The**ory **L**anguage) is a [controlled natural language][8]
for writing mathematical texts. It is the input language of the proof assistant
[Naproche][5] which is currently developed at the University of Bonn, Germany,
and since 2021 a component of the proof assistant [Isabelle][7]. ForTheL comes
in two variants: FTL and FTL-TeX. FTL is the original plain text format of
ForTheL whereas FTL-TeX is an integration of ForTheL into LaTeX which allows to
convert FTL-TeX texts easily to PDF.

If you want to keep an eye on the changes of the language specification of
ForTheL, have a look at the file [CHANGELOG.md](./CHANGELOG.md).


## Usage

This package contains just source files for the syntax reference written in
Markdown. They can easily be edited, but are not ment for being read. To convert
them to an easily readable format follow the steps below:

  1.  Download and set up the package _[nbnf][3]_. It provides a tool to convert
      syntax references like this one from Markdown to HTML.

  2.  Execute the shell script `makeref.sh` from within this directory with the
      following arguments:

      * The first argument must be either `ftl` or `ftl-tex` depending on
        whether you want to generate the syntax reference for ForTheL's FTL or
        FTL-TeX variant.

      * The second argument must be the path to your local copy of the `nbnf`
        repository.

      For instance the command to execute the script could look like this:

      ```sh
      ./makeref.sh ftl-tex ~/github-repos/nbnf
      ```

  3. Then within this directory you'll find a new directory called `html` (if it
     does not exist already) which contains a stand-alone HTML file of the
     syntax reference.


## How to edit the source files

To edit the source files of this reference, have a look at the directory `src`.
There you'll find two subdirectories `ftl` and `ftl-tex`, each containing the
sources for the syntax references of FTL and FTL-TeX, respectively, written in
[Pandoc Markdown][2]. Moreover in the `src` directory there are some files which
are part of the source of the reference of both FTL and FTL-TeX.

Within each of the mentioned subdirectories you'll find a file called
`header.md`. It contains information like title and author of the reference.
Each other file contains the source of some chapter of the reference. To add new
grammar rules to one of these files, you have to enclose it between ` ```nbnf`
and ` ``` ` tags and follow the syntax rules of [NBNF][3], an extension of
[BNF][6].

After editing any of these files you can update the correspongind HTML version
by following the steps in the last section.

If you want to add a new source file, make sure to add its (relative) path to
the appropriate file in the `contents` directory.




[1]: <https://htmlpreview.github.io/>
[2]: <https://garrettgman.github.io/rmarkdown/authoring_pandoc_markdown.html>
[3]: <https://github.com/McEarl/nbnf>
[5]: <https://github.com/naproche/naproche/>
[6]: <https://en.wikipedia.org/wiki/Backus%E2%80%93Naur_form> "Backus-Naur form"
[7]: <https://isabelle.in.tum.de/index.html>
[8]: <https://en.wikipedia.org/wiki/Controlled_natural_language>
