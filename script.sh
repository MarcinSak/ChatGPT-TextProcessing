#!/bin/bash

# Parameters
str="Continuing from where we left off, this is the next part of the text:"
cheracters_limit=3000
cheracters_limit=$(($cheracters_limit - ${#str}))

# Exchange new line signs to space in content.txt
tr '\n' ' ' < content.txt > temp && mv temp content.txt

# Split content.txt file on smaler files with maximum characters limit
file_content=$(cat content.txt)
counter=1
for (( i = 0; i < ${#file_content}; i += cheracters_limit )); do
  # Add text on the bagining each file 
  echo "$str ${file_content:i:cheracters_limit}" > "a${counter}.txt"

  # Delete new line char on the end of the file
  tr -d '\n' < a${counter}.txt > tmp && mv tmp a${counter}.txt
  
  counter=$((counter+1))
done