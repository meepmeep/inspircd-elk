#!/bin/bash


# Stats Users
sleep 15 ; xmlstarlet sel -t -c "/inspircdstats/userlist" -n /tmp/tmp.xml > /tmp/tmp4.xml && \
sed -i '1s/^/<inspircdstats>\n/' /tmp/tmp4.xml && echo "</inspircdstats>" >> /tmp/tmp4.xml && \
mv /tmp/tmp4.xml /tmp/statsuser_$(date +"%F_%H%M%S").xml


