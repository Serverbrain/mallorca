#!/bin/bash

# orca.sh
# This hungry orca will eat all your [container] memory 
# with a litte help from his friends mallorca or callorca.
# Call it like this: 
# orca.sh [mb] [sec] [/path/to/mallorca|callorca] 
# mb - the number of megabytes to allocate in every step
# sec - number of seconds before each call to [m|c]allorca
# Defaults to 64 MB and 10 Seconds.

MB_IN=${1//[^[:digit:]]}; MB=${MB_IN:-64}; 
SEC_IN=${2//[^[:digit:]]}; SEC=${SEC_IN:-10}

if [ -z ${3} ]; then 
  ORCA=${PWD}"/callorca"
else 
  ORCA=${3}
fi

if [ -f ${ORCA} ]; then
  echo "Using this binary: $ORCA"
else
  echo "Binary ${ORCA} not found, aborting!"
  exit 1
fi

COUNT=0; MB_TOTAL=0

while true; do
  COUNT=$(($COUNT + 1))
  MB_TOTAL=$(($COUNT * $MB))
  echo "Round ${COUNT} - Allocated Total: ${MB_TOTAL} MB "
  echo "Eating another ${MB} MB of memory in ${SEC} seconds!"
  echo "----------------------------------------------------"
  ${ORCA} ${MB} >/dev/null &
  sleep ${SEC}
done

