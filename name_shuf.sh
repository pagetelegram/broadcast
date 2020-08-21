#!/bin/bash
rm *live*
rm *Live*
rm *LIVE*
i=1; shuf -z -e -- * | while IFS= read -rd '' f; do echo mv -- "$f" "File-$((i++))"; done
