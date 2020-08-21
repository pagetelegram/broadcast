#!/bin/bash
rm *live*
rm *Live*
rm *LIVE*
for img in *.mp3; do
newname=$(head /dev/urandom | tr -dc a-z0-9 | head -c 8)
mv "$img" "$newname".mp3
done
