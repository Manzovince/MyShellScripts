#!/bin/bash

FILENAME="$1"

# Usage
[ $# -eq 0 ] && { echo "Usage: $0 filename"; exit 1; }

# Check if file exist
[ ! -f $FILENAME ] && { echo "$0: file $INPUT not found."; exit 2; }

grep -o . $FILENAME | sort | uniq -c
