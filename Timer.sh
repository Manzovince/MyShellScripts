#!/bin/sh

rr=('-' '|' '/' '-' '\' '|')

if [ $# -eq 0 ]; then
	read -p "Please submit a time in second: " TIME
else
	TIME=$1
fi

for ((i=TIME; i>-1; i--));
	do sleep 0.4;
	for c in "${rr[@]}"; do
		printf "\r %c " $c
		sleep .1
	done

	printf "	Time remaining $i secs \r";
done

echo "STOP"
echo "\a"
