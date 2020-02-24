#!/bin/bash -x

while [[ true ]]
do
	win=0	# initialing win
	loose=0	# initialing loose
	cash=0   # initializing cash
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
		casharr[i]=$cash 	# Recording cash tranjection of each day
	done

	# Displaying recorded Cash Tranjection
	for (( i=0; i<${#casharr[@]}; i++ ))
	do
		echo this month in day $(( i + 1 )) cash is ${casharr[i]}
	done
	echo ""
	
	key1=${casharr[0]}
	key2=${casharr[0]}
	for (( i = 0 ; i < ${#casharr[@]}; i++ ))
	do
	  	if [[ ${casharr[i]} -lt  $key1 ]]
		then
			key1=${casharr[i]} 
			day1=$(( i+1 ))
		fi
		if [[ ${casharr[i]} -gt $key2 ]]
		then
			key2=${casharr[i]}
			day2=$(( i+1 )) 
  	 	fi	
	done

	echo luckyest day is $day2 with cash $key2
	echo unluckyest day is $day1 with cash $key1
	echo ""
	   # asking user for continue for next month or quit
   echo ""
   read -p "press x to exit the game else press any key to continue: "  opt
   if [[ $opt == "x" ]]
   then
      exit
   fi
   echo ""
done
