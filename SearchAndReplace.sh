#!/bin/sh

OLD=$1
NEW=$2
PATH_TO_FILES=`grep -Ril "${OLD}" *`
#sed "s/${OLD}/${NEW}/g" *.txt | grep -A $NEW

grep -Ril "${OLD}" *

for line in $PATH_TO_FILES
do
	perl -i -pe "s/${OLD}/${NEW}/g" $line;
done

#for f in */*/*
#do
#	if [ -f $f - -r $f ]; then
#		sed "s/${OLD}/${NEW}/g" *.txt
#	else
#		echo "Error: Cnnot red $f"
#	fi
#done
