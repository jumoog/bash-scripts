#!/bin/bash
# copy translation like a boss
# 2015 jumoog
# script.sh $(cat list.txt)
for i in core/res/res/values-*/cm_strings.xml; do
        c3po=$(dirname ${i})
        target=android_frameworks_base
        rm -rf ../${target}/${c3po}/cm_string.xml
        echo '<?xml version="1.0" encoding="utf-8"?>' >> ../${target}/${c3po}/cm_string.xml
        echo '<resources xmlns:xliff="urn:oasis:names:tc:xliff:document:1.2">' >> ../${target}/${c3po}/cm_string.xml
        for y in "${@}"; do
                sed -n "/${y}/, /<\/string>/p" ${i} >> ../${c3po}/cm_string.xml
        done;
        echo '</resources>' >> ../${target}/${c3po}/cm_string.xml
        awk '!a[$0]++' ../${target}/${c3po}/cm_string.xml > ../${c3po}/cm_string.xm
        mv ../${target}/${c3po}/cm_string.xm ../${target}/${c3po}/cm_string.xml
done;
