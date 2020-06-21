#!/bin/bash
cd ~
mkdir v
sudo mount /dev/sda1 ~/v
for (( ; ; ))
do
cd ~/v
find "$PWD" | grep .mp4 > ~/video.pls
find "$PWD" | grep .avi >> ~/video.pls
find "$PWD" | grep .mov >> ~/video.pls
find "$PWD" | grep .flv >> ~/video.pls
find "$PWD" | grep .mpg >> ~/video.pls
mpv --shuffle --playlist ~/video.pls
done
