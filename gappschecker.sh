#!/bin/bash
# Check if GAPPS us valid Google APPS
# some valid SHA1 Fingerprints:
#
# 24:BB:24:C0:5E:47:E0:AE:FA:68:A5:8A:76:61:79:D9:B6:13:A6:00
# 38:91:8A:45:3D:07:19:93:54:F8:B1:9A:F0:5E:C6:56:2C:ED:57:88
# 82:75:9E:2D:B4:3F:9C:CB:AF:CE:31:3B:C6:74:F3:57:48:FA:BD:7A

for i in "${@}"; do
   temp=$(keytool -printcert -jarfile ${i})
   if echo ${temp} | grep --quiet "24:BB:24:C0:5E:47:E0:AE:FA:68:A5:8A:76:61:79:D9:B6:13:A6:00"; then
      echo -e "\e[00;32m ${i} OK\e[00m"
   elif echo ${temp} | grep --quiet "38:91:8A:45:3D:07:19:93:54:F8:B1:9A:F0:5E:C6:56:2C:ED:57:88"; then
      echo -e "\e[00;32m ${i} OK\e[00m"
   # NFC
   elif echo ${temp} | grep --quiet "82:75:9E:2D:B4:3F:9C:CB:AF:CE:31:3B:C6:74:F3:57:48:FA:BD:7A"; then
      echo -e "\e[00;32m ${i} OK\e[00m"
   else
      echo -e "\e[00;31m ${i} ERR\e[00m"
   fi
done;
