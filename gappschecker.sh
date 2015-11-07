#!/bin/sh
# Check if GAPPS us valid Google APPS

for i in "${@}"; do
   temp=$(keytool -printcert -jarfile ${i})
   if echo ${temp} | grep --quiet "24:BB:24:C0:5E:47:E0:AE:FA:68:A5:8A:76:61:79:D9:B6:13:A6:00"; then
      echo "\033[1;36;40m ${i} Ok \033[0m"
   else
      echo "\033[1;31;40m ${i} ERROR \033[0m"
   fi
done;
