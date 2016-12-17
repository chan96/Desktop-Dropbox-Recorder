#!/bin/bash

#catch ctl-c and stop the record process before exit
trap stopScript INT

function stopScript() {
  echo "stopping script"
  kill $pid  
  exit 1
}

while [ true ]
do
  #secToRecord=5
  secToRecord=$(( 3600 - $(date +%s) % 3600 ))
  epochStartTime=$(date '+%s')
  epochEndTime=`expr $secToRecord + $epochStartTime`
  dateStartTime=$(date -d@$epochStartTime '+%m.%d.%Y_%H.%M.%S')
  dateEndTime=$(date -d@$epochEndTime '+%m.%d.%Y_%H.%M.%S')
  fileName=$dateStartTime'--'$dateEndTime

  echo "$fileName"
  echo "$dateStartTime"
  echo "$dateEndTime"
  echo "$secToRecord"
  
  #initiate the recording for specified time
  recordmydesktop --no-cursor --on-the-fly-encoding -o $fileName &
  #echo "sleeping"
  sleep $secToRecord
  #echo "awake"
  pid=$!
  #killing the pid stops AND saves the recording
  kill $pid
  sleep 1
done
