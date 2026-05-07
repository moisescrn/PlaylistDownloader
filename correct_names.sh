#!/bin/bash
# 
# Script that iterates over all files of a given directory and corrects it
# It eliminates points, colons and changes spaces by _
#
# Usage: ./correct_names.sh target_directory

TARGET_DIR=$1

for file in "$TARGET_DIR"/*; do
  if [[ -f "$file" ]]; then # Read files. Directories will remain unchanged
    new_name=$(echo "$file" | sed "s/\[[^]]*\]//g" | tr -d " " | sed "s/\./\_/g;s/_\([^_]*\)$/.\1/")
    # Change name
    mv "$file" "$new_name"
  fi
done
