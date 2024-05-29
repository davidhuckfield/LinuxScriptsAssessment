#!/bin/bash
#declare function
function numberList() {
#create an empty array for the numbers input
numbers_list=()
#create a variable to check whether the user is finished, false by default
user_done="false"
#while loop to continue asking for input until done is entered
while [ "$user_done" = "false" ]; do
	#ask for input
	echo "Please enter a number, or type \"done\" to finish"
	#store the input in a variable
	read user_input
	#if done, change the variable
	if [ "$user_input" = "done" ]; then
		user_done="true"
	#if not, add the number to the array
	else 
		numbers_list+=("$user_input")
	#end the if statement
	fi
#end the while loop
done
#send message to user and print the whole array
echo "You entered the following numbers: ${numbers_list[@]}"
}
#call the function
numberList
