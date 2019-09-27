#!/bin/sh

grep -o '[[:alnum:]]*' $1 \
| sort | uniq -c \
| sed -E 's/[[:space:]]*([0-9]+) (.+)/\2	\1/'
