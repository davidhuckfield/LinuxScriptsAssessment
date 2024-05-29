#!/bin/bash
#create variable to store the first name
first_name=dave
#create variable to store directory name to avoid confusion
directory_name="WAT_$first_name"
#make new directory using the directory_name variable
mkdir "$directory_name"
#navigate to the new directory
cd "$directory_name"
#make 3 new files
touch file1 file2 file3
#add some text to file1 by echoing it and redirecting to file1
echo "It can get you into a lot of trouble, thinking" >> file1
echo "You shouldn\'t do so much of it" >> file1
#make another directory called childDir
mkdir childDir
#copy edited file into new directory
cp file1 childDir/

