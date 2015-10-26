#!/bin/bash
# copy translation like a boss
# 2015 jumoog
# script.sh $(cat list.txt)
for i in core/res/res/values-*/cm_strings.xml; do
        c3po=$(dirname ${i})
        rm -rf ../android_frameworks_base/${c3po}/cm_string.xml
        echo '<?xml version="1.0" encoding="utf-8"?>' >> ../android_frameworks_base/${c3po}/cm_string.xml
        echo '<resources xmlns:xliff="urn:oasis:names:tc:xliff:document:1.2">' >> ../android_frameworks_base/${c3po}/cm_string.xml
        for y in "${@}"; do
                sed -n "/${y}/, /<\/string>/p" ${i} >> ../android_frameworks_base/${c3po}/cm_string.xml
        done;
        echo '</resources>' >> ../android_frameworks_base/${c3po}/cm_string.xml
        awk '!a[$0]++' ../android_frameworks_base/${c3po}/cm_string.xml > ../android_frameworks_base/${c3po}/cm_string.xm
        mv ../android_frameworks_base/${c3po}/cm_string.xm ../android_frameworks_base/${c3po}/cm_string.xml
done;
