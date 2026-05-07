#!/bin/bash
# 
# Implements the other scripts to execute them at once
#
# Usage: ./main.sh url_list download_directory

URL_LIST=$1
DOWNLOAD_DIR=$2
#:$HOME/Musica}" # default directory is ~/Musica, in case non is given explicitly

# Download audios
./download.sh $URL_LIST $DOWNLOAD_DIR

# Check if DOWNLOAD_DIR contains any directories (Playlists!!)
# and if yes apply the correction of names
for dir in "$DOWNLOAD_DIR"/*;do
  if [[ -d "$dir" ]]; then
    ./correct_names.sh "$dir"
  fi
done

# Correct the names of the remaining files
./correct_names.sh $DOWNLOAD_DIR
