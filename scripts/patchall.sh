#!/bin/sh


MYDIR="$(dirname "$(readlink -f "$0")")"
MISTER_SRC=$1


for f in $MYDIR/../patches/*.patch; do
	PATCH_NAME="$(basename "$f")"
	git -C $MISTER_SRC apply -C 2 --verbose $f	
	if [ $? -eq 0 ]
	then
		echo "Applied $f"
	else
		echo "PATCH FAILED: $f"
		git -C $MISTER_SRC reset --hard HEAD --quiet
		exit 1
	fi
done
