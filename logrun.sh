#!/bin/bash
cd `dirname $0`
python_ver=$(ls /usr/bin|grep -e "^python[23]\.[1-9]\+$"|tail -1)
eval $(ps -ef | grep "[0-9] ${python_ver} server\\.py m" | awk '{print "kill -9 "$2}')

# 2048 for macOS
# ulimit -n 2048
nohup ${python_ver} server.py m>> ssserver.log 2>&1 &