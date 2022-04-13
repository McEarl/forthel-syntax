# The syntax of ForTheL

This package contains a complete syntax reference for ForTheL, both for plain
ForTheL (FTL) and its LaTeX variant (FTL-TeX).

Visit <https://mcearl.github.io/forthel-syntax> for more information on ForTheL
and to access an HTML version of its syntax references.


## Usage

This package contains just source files for the syntax reference written in
Markdown. They can easily be edited, but are not ment for being read. To convert
them to HTML follow the steps below:

  1.  Download and set up the package _[nbnf-tools][3]_. It provides a tool to
      convert syntax references like this one from Markdown to HTML.

  2.  Execute the shell script `makeref.sh` from within this directory with the
      following arguments:

      * The first argument must be either `ftl` or `ftl-tex`, depending on
        whether you want to generate the syntax reference for ForTheL's FTL or
        FTL-TeX variant.

      * The second argument must be the path to your local copy of the
        `nbnf-tools` repository.

      * The third argument must either be `standalone` or `jekyll`, depending on
        whether you want to generate a standalone HTML file or an HTML file
        which can be used within the [Jekyll][1] environment used by the GitHub
        page of this repository.

      For instance the command to execute the script could look like this:

      ```sh
      ./makeref.sh ftl-tex ~/github-repos/nbnf standalone
      ```

  3. Then within this directory you'll find a new directory called `html` (if it
     does not exist already) which contains an HTML file of the syntax
     reference.


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
and ` ``` ` tags and follow the syntax rules of [NBNF][4], an extension of
[BNF][6].

After editing any of these files you can update the correspongind HTML version
by following the steps in the last section.

If you want to add a new source file, make sure to add its (relative) path to
the appropriate file in the `contents` directory.



[1]: <https://jekyllrb.com/>
[2]: <https://garrettgman.github.io/rmarkdown/authoring_pandoc_markdown.html>
[3]: <https://github.com/McEarl/nbnf-tools>
[4]: <https://github.com/McEarl/nbnf-tools#readme>
[5]: <https://github.com/naproche/naproche/>
[6]: <https://en.wikipedia.org/wiki/Backus%E2%80%93Naur_form> "Backus-Naur form"
