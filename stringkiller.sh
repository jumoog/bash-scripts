#!/bin/bash
# Remove lines from files that contain a Pattern like "wallpaper_attributions"
# useage: script.sh $(cat files.txt) or script.sh $(grep --files-with-matches wallpaper_attributions . -R)
for i in "${@}"; do
 sed -n '/wallpaper_attributions/!p' ${i} > ${i}2
 mv ${i}2 ${i}
done;
