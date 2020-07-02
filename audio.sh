#!/bin/bash
# ver 2.0
mkdir m
sudo mount /dev/sda1 ~/m
pico2wave -w ~/r.wav "Welcome to my radio station..."
sox -v .3 ~/r.wav radio.wav
while :
do
cd ~/m
find "$PWD" | grep .mp3 > ~/audio.pls
find "$PWD" | grep .m4a >> ~/audio.pls
find "$PWD" | grep .ogg >> ~/audio.pls
cat ~/audio.pls | shuf > ~/ply.pls
awk '{print}; NR % 4 == 0 {print "~/radio.wav"}' ~ply.pls > audio.pls
mpv --af=lavfi=dynaudnorm --playlist ~/audio.pls
done


