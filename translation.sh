#!/bin/bash
# copy translation like a boss
# 2015 jumoog
# script.sh $(cat list.txt)
for i in res/values-*/cm_strings.xml; do
        for y in "${@}"; do
                c3po=$(dirname ${i})
                mkdir -p ${c3po}
                sed -n "/${y}/p" ${i} >> ../android_packages_apps_Settings/${c3po}/cm_string.xml
        done;
done;
