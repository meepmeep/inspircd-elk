#!/bin/bash

# Stats Chans
sleep 5 ; xmlstarlet sel -t -c "/inspircdstats/channellist" -n /tmp/tmp.xml > /tmp/tmp3.xml && \
sed -i '1s/^/<inspircdstats>\n/' /tmp/tmp3.xml && echo "</inspircdstats>" >> /tmp/tmp3.xml && \
mv /tmp/tmp3.xml /tmp/statschan_$(date +"%F_%H%M%S").xml


