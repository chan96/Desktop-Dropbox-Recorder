#!/bin/bash



while [ true ]
do
  epochStartTime=$(date '+%s')
  epochEndTime=$(date -d $(date -d 'next hour' '+%H:00:00') '+%s')
  dateStartTime=$(date -d@$epochStartTime '+%m.%d.%Y_%H:%M')
  dateEndTime=$(date -d@$epochEndTime '+%m.%d.%Y_%H:%M')
  secToRecord=`expr $epochEndTime - $epochStartTime`
  filename=$dateStartTime'--'$dateEndTime

  echo "$fileName"
  echo "$dateStartTime"
  echo "$dateEndTime"
  echo "$secToRecord"
  
  recordmydesktop --no-cursor --on-the-fly-encoding -o $fileName &
  sleep $secToRecord
  pid=$!
  kill $pid
done
