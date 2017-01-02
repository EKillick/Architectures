#!/bin/bash
#Shows usage help if the command is used incorrectly
usage(){ echo "Usage: $0 [-r <string>] [-f <string(s)>]" 1>&2; exit 1; }
while getopts ":r:f:" opts; do
  #Stores list of filenames as a variable
  list="$OPTARG"
  case "${opts}" in
    r)
      make
      eval ${OPTARG}
      ;;
    f)
      #Iterates through the filenames
      for arg in $list
        do
          cat "$arg"
          printf "\n\n\n" #Newlines for formatting
      done
      ;;
    *)
      #Prints usage help
      usage
      ;;
    esac
done
