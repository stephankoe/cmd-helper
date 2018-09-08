#!/usr/bin/env bash

#
# Find text inside PDF documents
# 
# Usage: 
#   pdfgrep.sh /path/to/folder "search term"
#
# Requirements:
#   find, pdftotext, grep
#

path=$1
search_term=$2
if [ -z $path ] || [ -z $search_term ]; then
  echo "Usage: $0 /path/to/folder search_term"
  exit 1
fi
if [ ! -e $path ]; then
  echo "$0: $path: No such file or directory"
  exit 1
fi
cmd="pdftotext '{}' - | grep --with-filename --label='{}' --color '$search_term'"
find $path -name '*.pdf' -exec sh -c "$cmd" \;

