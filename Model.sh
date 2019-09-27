#!/bin/sh

# Check for arg and display usage
[ $# -eq 0 ] && { echo "Usage: $0 filename"; exit 1; }

# Check if file exist
[ ! -f $FILENAME ] && { echo "$0: file $INPUT not found."; exit 2; }

# Get variable in multiple ways
if [ $# -eq 0 ]; then
	read -p "User need to write var: " VAR
else
	VAR=$1
	echo "GET ARG1 >> VAR = " $VAR
fi

echo "VAR = " $VAR
