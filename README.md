# Playlist Downloader

The script ```main.sh``` downloads the audio of the desired videos or playlists of YouTube.

### Usage:

```./main.sh [url_list.txt] [dir] ```

Here ```url_list.txt``` contains all the URLs that are to be downloaded (URLs of playlists work), and ```dir``` is the directory, where all this new audios will be stored. In case a URL points to a playlist, then a new directory (inside ```dir```) will be created, with the name of the playlist, containing all the songs of it.



### Dependencies

This script does the downloading process using [yt-dlp](https://github.com/yt-dlp/yt-dlp), so having it installed is required. This downloader may take some time for long lists, but there may be some tricks to accelerate the process, as described in its main page.
