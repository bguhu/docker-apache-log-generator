#!/bin/bash
  
# turn on bash's job control
set -m

mkdir -p /var/log/apache
  
# Start the primary process and put it in the background
python apache-log-gen.py -o LOG -p /var/log/apache/apache -n 0 -s 3 &
  
  
# now we bring the primary process back into the foreground
# and leave it there
fg %1
