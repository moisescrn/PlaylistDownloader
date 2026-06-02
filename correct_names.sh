#!/bin/bash
# 
# Script that iterates over all files of a given directory and corrects it
# It eliminates points, colons and changes spaces by _
#
# Usage: ./correct_names.sh target_directory

TARGET_DIR=$1
cd $TARGET_DIR

for file in "$TARGET_DIR"/*; do
  if [[ -f "$file" ]]; then # Read files. Directories will remain unchanged
    basename="${file##*/}"
    no_ext="${basename%.*}"
    extension="${file##*.}"
#    new_name=$(echo "$no_ext" | sed "s/\[[^]]*\]//g" | sed 's/\b\([a-z]\)/\u\1/g' | tr -d " " | sed "s/\./\_/g;s/_\([^_]*\)$/.\1/")
    new_name=$(
    echo "$no_ext" |
    sed 's/\[[^]]*\]//g' |
    tr ' ' '_' |
    sed 's/[.,]//g' |
    sed 's/[^[:alnum:]_áéíóúÁÉÍÓÚñÑ-]//g'
)
    # Change name
    mv "$file" "${new_name}.${extension}"
  fi
done
