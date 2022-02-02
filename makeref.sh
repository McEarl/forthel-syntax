#!/bin/sh

# Read a file (the 1st argument), prepend the 2nd argument to all its lines,
# replace all line breaks by spaces and return the resulting string
function readFiles() {
  file=$1
  repo_dir=$2

  for line in $(cat $file)
  do
    echo "$repo_dir/$line"
  done < $file
}

if [ "$#" != 2 ] ; then
  echo "Invalid number of arguments. Usage:"
  echo "$0 (ftl|ftl-tex) <path/to/your/local/nbnf/repository>"
  exit 1
else
  # root directory of the syntax reference repository
  root_dir="$(dirname $(realpath "$0"))"

  # `src` directory of the syntax reference repository
  src_dir="$(dirname $(realpath "$0"))/src"

  # `contents` directory of the syntax reference repository
  contents_dir="$(dirname $(realpath "$0"))/contents"

  # Directory for the html output of the syntax reference
  out_dir="$(dirname $(realpath "$0"))/html"

  # Cd into the nbnf repository
  if [ -d "$2" ]; then
    cd $2
  else
    echo "The directory \"$2\" does not exist"
    exit 2
  fi

  # Create the html directory if it does not exists yet
  if [ ! -d "$out_dir" ]; then
    mkdir $out_dir
  fi

  if [ "$1" == "ftl" ]; then
    # Create the FTL reference from all source files listed in `contents/ftl.txt`
    stack exec nbnf-exe -- $(readFiles $contents_dir/ftl.txt $root_dir) $out_dir/ftl.html
  elif [ "$1" == "ftl-tex" ]; then
    # Create the FTL-TeX reference from all source files listed in `contents/ftl-tex.txt`
    stack exec nbnf-exe -- $(readFiles $contents_dir/ftl-tex.txt $root_dir) $out_dir/ftl-tex.html
  else
    echo "Invalid argument. Usage:"
    echo "$0 (ftl|ftl-tex) <path/to/your/local/nbnf/repository>"
    exit 3
  fi
fi
