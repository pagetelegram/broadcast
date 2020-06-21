#!/bin/bash
cd ~
mkdir m
sudo mount /dev/sda1 ~/m
for (( ; ; ))
do
cd ~/m
find "$PWD" | grep .mp3 > ~/audio.pls
find "$PWD" | grep .m4a >> ~/audio.pls
find "$PWD" | grep .ogg >> ~/audio.pls
mpv --shuffle --playlist ~/audio.pls
done
