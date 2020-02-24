#!/bin/bash -x

win=0	# initialing win
loose=0	# initialing loose
for (( i = 0; i < 20; i++ ))
do
	stack=100   #starting amount
	while [[ $stack -gt 50 && $stack -lt 150 ]]
	do
		bet=$((RANDOM%2))

		if [[ $bet -eq 1 ]]
		then
			stack=$(( stack + 1 ))
		else
			stack=$(( stack - 1 ))	
		fi
		if [[ $stack -eq 150 ]]
   	then
      	win=$(( win + 1 ))
   	elif [[ $stack -eq 50 ]]
		then
      	loose=$(( loose + 1 ))  
   	fi
	done
done

echo $win oooooooo $loose ooooooooo $stack
