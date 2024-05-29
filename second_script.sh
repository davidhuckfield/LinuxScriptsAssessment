#!/bin/bash

#declare a function
function oddOrEven() {
#ask for user input number
echo "Please enter a number"
#store the user input in a variable
read user_number
#check if number % 2 is 0 (therefore even)
if [ $((user_number % 2)) -eq 0 ]
then
	echo "$user_number is Even"; echo "$user_number is Even" >> file3
else
	echo "$user_number is Odd"; echo "$user_number is Odd" >> file3
fi
#move file3 to the home directory of the current user and rename it
mv file3 ~/changedFileName

}
oddOrEven
