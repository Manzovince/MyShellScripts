#!/bin/bash

FILE=$1

if [ $# -eq 0 ]; then
	echo "usage: ./ReadFile filename"
elif [ -f "$FILE" ]; then
	while read line; do
		echo $line
	done < $FILE
else
	echo "File does not exist..."
fi
