#!/bin/bash -x

while [[ true ]]
do
cash=0
win=0	# initialing win
loose=0	# initialing loose
for (( i = 0; i < 20; i++ ))	# to play the game for 20 time ie. 20 days
do
	windays=() #initializing windays array
	win=0	# initialing win
	loose=0	# initialing loose
	for (( i = 0; i < 20; i++ ))	# to play the game for 20 time ie. 20 days
	do
		stack=100   #starting amount
		while [[ $stack -gt 50 && $stack -lt 150 ]]	#Condetion for regien the game
		do
			bet=$((RANDOM%2))	# generating random number
		# opereting bet result in stack
			if [[ $bet -eq 1 ]]
			then
				stack=$(( stack + 1 ))
			else
				stack=$(( stack - 1 ))	
			fi
		# Calculating win or loose
			if [[ $stack -eq 150 ]]
  		 	then
  	   	 	win=$(( win + 1 ))
				cash=$(( cash + 50 ))
  	 		elif [[ $stack -eq 50 ]]
			then
  	    		loose=$(( loose + 1 ))
				cash=$(( cash - 50 ))  
  	 		fi
		done
		cash[i]=$cash 	# Recording cash tranjection of each day
	done

# Displaying recorded Cash Tranjection
for (( i=0; i<${#cash[@]}; i++ ))
do
	echo this month in day $(( i + 1 )) cash is ${cash[i]}
done
# asking user for continue for next month or quit
echo ""
read -p "press x to exot the game else press any key to continue: "	opt
if [[ $opt == "x" ]]
then
	exit
fi
echo ""
done
