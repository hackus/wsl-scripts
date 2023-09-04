#!/bin/bash

# check wsl distros & status
wsl -l -v
# shutdown the running wsl host
wsl --shutdown
# check wsl distros & status
wsl -l -v

# Set the maximum number of attempts
max_attempts=20

# Set a counter for the number of attempts
attempt_num=1

# Set a flag to indicate whether the command was successful
success=false

while [ $success = false ] && [ $attempt_num -le $max_attempts ]; do
  # Execute the command
  echo "TODO Replace this line with the actual command to execute"

  # Check the exit code of the command
  if [ `wsl -l -v | awk -v col=6 '{print $col}'` = 'Running' ]; then
    success=true
  else
    echo Status is `wsl -l -v | awk -v col=6 '{print $col}'`
    # The command was not successful
    echo "Attempt $attempt_num to test WSL start, not started. Trying again..."
    # Increment the attempt counter
    attempt_num=$(( attempt_num + 1 ))
  fi
  sleep 5
done
