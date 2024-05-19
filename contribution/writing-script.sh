#!/bin/bash

# Define the path to the README.md and contributors.txt files
readme_path="../profile/README.md"
contributors_path="./contributors.txt"

# Create a temporary file
temp_file=$(mktemp)

# Read contributors.txt file line by line
while IFS= read -r line
do
  # Prepare the contributor profile in HTML format
  contributor="<a href=\"https://github.com/$line\"><img src=\"https://github.com/$line.png\" width=\"50\" title=\"hover text\"></a>"

  # Append each contributor to the contributors paragraph in README.md
  awk -v var="$contributor" '/<p align="center">/{print;print var;next}1' $readme_path > $temp_file && mv $temp_file $readme_path
done < "$contributors_path"