#!/bin/bash


ALBUMID=([0]='144892' [1]='94154' [2]='63048' )
RSSFILE=([0]='yyjc.xml' [1]='ruixi.xml' [2]='daming.xml')
GRABBER="qingting_linux_amd64"

wget -q https://github.com/cxuauto/podcast-rss/releases/download/3jia/$GRABBER
chmod +x ./$GRABBER

len=${#ALBUMID[@]}

for ((i=0;i<$len;i++));do
        ./$GRABBER ${ALBUMID[$i]} > ${RSSFILE[$i]}
done

ls

for ((i=0;i<$len;i++));do
        UUID=PBUUID${i}
        eval tmp=\$$UUID
        curl -X PUT -F c=@${RSSFILE[i]} http://fars.ee/$tmp
done
