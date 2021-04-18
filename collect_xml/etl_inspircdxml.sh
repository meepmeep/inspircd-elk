#!/bin/bash

# Stats servers 
wget http://<CHANGEME_IP_of_inspircd_server>:<CHANGEME_Port_of_inspircd_server>/stats -O /tmp/inspircd.xml --quiet && \
xmlstarlet fo /tmp/inspircd.xml > /tmp/tmp.xml  && \
xmlstarlet sel -t -c "/inspircdstats/serverlist" -n /tmp/tmp.xml > /tmp/tmp2.xml && \
sed -i '1s/^/<inspircdstats>\n/' /tmp/tmp2.xml && echo "</inspircdstats>" >> /tmp/tmp2.xml && \
mv /tmp/tmp2.xml /tmp/statsserver_$(date +"%F_%H%M%S").xml

# Global stats for users / chans / xlines
xmlstarlet sel -t -c "/inspircdstats/general" -n -c "/inspircdstats/xlines" -n /tmp/tmp.xml > /tmp/tmp2.xml && \
sed -i '1s/^/<inspircdstats>\n/' /tmp/tmp2.xml && echo "</inspircdstats>" >> /tmp/tmp2.xml && \
mv /tmp/tmp2.xml /tmp/statsothers_$(date +"%F_%H%M%S").xml



