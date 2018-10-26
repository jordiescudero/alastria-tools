#!/bin/sh

ip -4 route list match 0/0 | awk '{print $3 " host.docker.internal"}' >> /etc/hosts 

yarn start -f 14108000 -a $(ls -p contracts | grep -v / |tr '\n' ','| sed --expression='s/.json//g' | rev | cut -c 2- | rev) -n http://host.docker.internal:22000 -l info -o graylog -s ./save_state
