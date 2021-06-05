#!/bin/bash
#sudo mount /dev/sda1 ~/m
#sudo gtts-cli "You are listening to Funkadelics, Selection by Residents on Hand Is Radio 89.4 FM!" > ~/radio.mp3 
#mpv radio.mp3
#sudo cp radio.mp3 ~/m
#sox -v .4 ~/r.wav radio.wav
#&& aplay ~/radio.wav
#echo #!/bin/bash > titles.sh
cd ~
while :
do
#mpv --sound-device alsa/default:CARD=CODEC ~/radio.mp3
# cd $1
#echo > ./ply.pls
# find "$PWD" | grep .mp3 > ./play.pls
# find "$PWD" | grep .mp4 >> ./play.pls
# find "$PWD" | grep .mkv >> ./play.pls
# find "$PWD" | grep .webm >> ./play.pls
# find "$PWD" | grep .m4a >> ./play.pls

# shuf ./play.pls > p.pls
#sed '0~2 s/$/~/jingle/radio.mp3/g' < ply.pls > p.pls
# awk '{print}; NR%6==0 {print "./jingle/radio.mp3"}' ./p.pls > ./ply.pls
# find "$PWD" | grep radio.mp3 >> ~/play.pls

#cat ~/play.pls | shuf > ~/ply.pls
#echo pico2wave -w && cat ~/ply.pls && cat /dev/urandom | tr -dc a-z | head -c 5 ; echo '' > ~/titles.sh
#sh ~/titles.sh > ~/titles.pls
#paste ~/titles.pls ~/ply.pls > ~/play.pls
#awk '{print}; NR % 1 == 0 {print '"/home/pi/""\"'}' ~/ply.pls > ~/play.pls
#awk '{print}; NR % 4 == 0 {print "./jingle/radio.mp3"}' ~/ply.pls > ~/play.pls
#mpv --af=lavfi=dynaudnorm --playlist ~/play.pls
mpv --cache=10000 --no-video --audio-device alsa/default:CARD=CODEC --af=lavfi=dynaudnorm ~/RADIO/que4.m3u
done
