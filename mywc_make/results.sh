#!/bin/bash
usage(){ echo "Usage: $0 [-r <string>] [-f <string(s)>]" 1>&2; exit 1; }
while getopts ":r:f:" opts; do
  list="$OPTARG"
  case "${opts}" in
    r)
      make
      eval ${OPTARG};;
    f)
      for arg in $list
        do
          echo "----------"
          cat "$arg"
      done;;
    *)
      usage;;
    esac
done
