echo "
!/usr/bin/env python
coding: utf-8

Lab:    WUME Lab, Lehigh Unviersity
Author: Eashan Adhikarla

This script collect images every 400-th seconds from webcams which does not provide webcam links.
Note: Press Ctrl+D to stop the script.

Get the youtube links by; 
youtube-dl -g 'youtube_url'
"

# sleep 2

# echo cd live_upload/
# newdirname=$(<~/folders.txt)

newdirname=$(awk -F"," '{print $1}' webcam-list.csv)
if [ -d "$newdirname" ]; then
echo -e "Directory already exists" ;
else
`mkdir -p $newdirname`;
echo -e "\n$newdirname\n\n---All directories are created---\n"
fi


# now = `$(date +"%T")`

N="1"
while :
do
	# For all kinds of links place the links after "-i '' "
	# NR=='Number' represents the csv file row number
	ffmpeg -loglevel warning -hide_banner -stats -i 'link-here' -frames:v 1 $(awk -F "," 'NR==11{print $1}' webcam-list.csv)/name1_$N.png
	ffmpeg -loglevel warning -hide_banner -stats -i 'link-here' -frames:v 1 $(awk -F "," 'NR==12{print $1}' webcam-list.csv)/name2_$N.png
	ffmpeg -loglevel warning -hide_banner -stats -i 'link-here' -frames:v 1 $(awk -F "," 'NR==13{print $1}' webcam-list.csv)/name3_$N.png

	# For all youtube links place the link after -g flag.
	ffmpeg -loglevel warning -hide_banner -stats -i $(youtube-dl -g "https://www.youtube.com/watch?v=...") -frames:v 4 $(awk -F "," 'NR==22{print $1}' webcam-list.csv)/some_location_name_%03d.png
	
	# Period time: default 400 seconds
	sleep 400
	N=`expr $N + 1`
done
