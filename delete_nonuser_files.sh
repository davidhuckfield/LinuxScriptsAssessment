#!/bin/bash

#declare function
function deleteNonUserNonRootFiles(){

#first define output file for easier later stages
# $HOME will select the home directory of current user
output_file="$HOME/user_info.txt"

#output a header to the output file for formatting purposes 
#if file doesn't exist, > will create it
echo "# User IDs and Usernames list:" > "$output_file"

#print all user IDs and usernames - use awk with -F to set delimiter (:)
#directory should be /etc/passwd
#third field ($3) is user ID, first ($1) is username
#can use >> because above command has already created the file
awk -F: '{print $3 "-" $1}' /etc/passwd >> "$output_file"

#output message to user confirming output
echo "IDs and usernames have been outputted to $output_file"

#add a header to show the start of the deleted files list
echo "#List of deleted files:" >> "$output_file"

#find all files not owned by current user or root
# -type f to specify files
#-user to specify user - ! to negate meaning NOT current user
#chain second user parameter to also specify not root
#-exec to run a command, use rm
#-v prints out details of each file removed
#{} is placeholder for current file from find
#to output details of files to output file, need to run shell command within -exec
#sh -c to use shell command, command uses $1 as first input (file deleted)
#$2 as second (output file)
#_ is needed as placeholder for sh -c because it expects input $0 which is not being used
# \; shows the end of the -exec command
find /home -type f ! -user "$USER" ! -user root -exec sh -c 'rm -v "$1" >> "$2"' _ {} "$output_file" \;

#output to user that file deletion has completed
echo "File deletion is complete"

}
#call function
deleteNonUserNonRootFiles
