#!/bin/bash
# 
# Read the file containing all urls of videos and/or playlists
# If it is a playlist the audios will be stored in a directory with the playlist name
#
# Usage: ./download.sh url_list download_directory

URL_LIST=$1
DOWNLOAD_DIR=$2

for url in $(cat $URL_LIST); do
  if [[ $url == *"playlist"* ]]; then
    # Name of the playlist (eliminate spaces!!)
    PLAYLIST_TITLE=$(((yt-dlp --no-warnings --flat-playlist --print playlist_title $url | head -1) 2> /dev/null) | tr ' '  '_')
    mkdir $DOWNLOAD_DIR/$PLAYLIST_TITLE
    /usr/bin/yt-dlp -t mp3 -P ~/Musica/$PLAYLIST_TITLE $url
    # To set the path it is necessary that there is no path, where the download will proceed,
    # set in the configuration path
    # If it is set the option -P will be ignored
  else
    /usr/bin/yt-dlp -t mp3 -P $DOWNLOAD_DIR $url

  fi
done
