#!/bin/bash

service ssh start

ufw disable

ambari-agent start

while true; do
    tail -f /dev/null
done
