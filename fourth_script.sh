#!/bin/bash
ps aux
echo "Please enter a process ID to stop"
read stop_process
kill $stop_process

