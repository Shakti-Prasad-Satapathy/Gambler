#!/bin/bash -x

stack=100	#starting amount
win=0	# initialing win
loose=0	# initialing loose

bet=$((RANDOM%2))

if [[ $bet -eq 1 ]]
then
	stack=$(( stack + 1 ))
else
	stack=$(( stack - 1 ))
fi
echo $stack
