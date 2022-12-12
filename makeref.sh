#!/bin/sh

# Read a file (the 1st argument), prepend the 2nd argument to all its lines,
# replace all line breaks by spaces and return the resulting string
function readFiles() {
  file=$1
  repo_dir=$2

  for line in $(cat $file)
  do
    echo "-i $repo_dir/$line"
  done < $file
}

if [ "$#" != 3 ] ; then
  echo "Invalid number of arguments. Usage:"
  echo "$0 (ftl|tex) <path/to/your/local/nbnf/repository> (standalone|jekyll)"
  exit 1
else
  #statements
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

  if [ "$3" == "standalone" ] || [ "$3" == "jekyll" ]; then
    if [ "$1" == "ftl" ]; then
      # Create the FTL reference from all source files listed in `contents/ftl.txt`
      stack exec nbnf-exe -- $(readFiles ${contents_dir}/ftl.txt $root_dir) -o $out_dir/${1}_${3}.html -h ${3}
    elif [ "$1" == "tex" ]; then
      # Create the TEX reference from all source files listed in `contents/tex.txt`
      stack exec nbnf-exe -- $(readFiles $contents_dir/tex.txt $root_dir) -o $out_dir/${1}_${3}.html -h ${3}
    else
      echo "Invalid argument. Usage:"
      echo "$0 (ftl|tex) <path/to/your/local/nbnf/repository> (standalone|jekyll)"
      exit 3
    fi
  else
    echo "Invalid argument. Usage:"
    echo "$0 (ftl|tex) <path/to/your/local/nbnf/repository> (standalone|jekyll)"
    exit 3
  fi
fi
