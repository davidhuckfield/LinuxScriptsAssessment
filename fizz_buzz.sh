#!/bin/bash

function fizzBuzz() {
	numbers_list=()

	echo "Welcome to FizzBuzz - please enter a number"
	read end_number

	if [[ $end_number =~ ^[0-9]+$ && $end_number -gt 0 ]]; then
		for (( i=1; i<=end_number; i++ )); do
			numbers_list+=("$i")
		done
		
		for (( i=0; i<${#numbers_list[@]}; i++ )); do
			if (( (i+1) % 15 == 0 )); then
				echo "FizzBuzz!"
			elif (( (i+1) & 3 ==0 )); then
				echo "Fizz!"
			elif (( (i+1) % 5 == 0 )); then
				echo "Buzz!"
			else
				echo "${numbers_list[i]}"
			fi
		done
	else
		echo "Invalid input. Please enter a positive integer."
	fi
}
fizzBuzz
