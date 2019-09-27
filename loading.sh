#!/bin/bsh

rr=('-' '|' '/' '-' '\' '|')
while true; do
	for c in "${rr[@]}"; do
		printf "\r %c " $c
		sleep .5
	done
done
