#!/bin/bash

if [ $# -eq 0 ]; then
  exit 1
fi
sudo ./dht_metric.py 22 4 $1 > /tmp/$$.json
aws cloudwatch put-metric-data --region eu-central-1 --namespace "Home" --metric-data file:///tmp/$$.json
rm -f /tmp/$$.json
