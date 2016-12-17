#!/bin/bash


while [ true ]
do
  epochStartTime=$(date '+%s')
  epochEndTime=$(date -d $(date -d 'next hour' '+%H:00:00') '+%s')
  dateStartTime=$(date -d@$epochStartTime)
  dateEndTime=$(date -d@$epochEndTime)
  secToRecord=`expr $epochEndTime - $epochStartTime`
  
  echo "$dateStartTime"
  echo "$dateEndTime"
  echo "$secToRecord"
  #recordmydesktop  system:capture_1
  sleep 1
done
