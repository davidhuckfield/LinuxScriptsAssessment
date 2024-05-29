#!/bin/bash

#declare function
function checkDirectory() {

#$1 refers to the first input passed into the function which should be directory name
local directory="$1"

#run find on the directory, -type f for files. 
#pipe the output into word count and -l to count lines, each file should be a line
file_count=$(find "$directory" -type f | wc -l)

#for last edited, stat to show info about files, -c for custom output, %y for last mod date and time
last_edited=$(stat -c %y "$directory")

#for largest file, first use find and specify -type f for files, -exec to run a command on each file
#pass it the command ls -s to list the file with size in blocks
#{} is a placeholder for the current file, + shows the end of the command
#pipe the output to sort, -n for numerically, -r to reverse so biggest are first
#pipe the output of the sort to head to take the first line with -n 1
#pipe the output of head to awk, specify to print $2 or the second field of the line (filename)
largest_file=$(find "$directory" -type f -exec ls -s {} + | sort -n -r | head -n 1 | awk '{print $2}')

#similar to above, find files, run command, list size in blocks
#sort numerically but without r reversing the order, smallest will be first
#head takes first line, awk takes second field of that line
smallest_file=$(find "$directory" -type f -exec ls -s {} + | sort -n | head -n 1 | awk '{print $2}')

echo "Directory name: $directory"
echo "Number of files: $file_count"
echo "Last edited: $last_edited"
echo "Largest file is: $largest_file"
echo "Smallest file is: $smallest_file"
}

#while true to loop indefinitely until the break
while true; do
	
	#prompt for input and store in variable
	echo "Please enter a directory"
	read directory

	#-d checks if the input is a directory
	#if so, run the above function with directory as input
	#then break to stop the while loop
	if [ -d "$directory" ]; then
		checkDirectory "$directory"
		break
	#if not a directory, repeat the prompt until a valid directory is entered
	else
		echo "Invalid directory - please enter a valid directory"
	fi
done
