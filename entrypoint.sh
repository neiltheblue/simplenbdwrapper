#!/bin/sh

CMD=""

while [ $1 ]
do
  case $1 in
   --cow) CMD="--cow ${CMD}"
   ;;
   --readonly) CMD="--readonly ${CMD}"
   ;;
   *) CMD="${CMD} --imgfile $1"
   ;;
  esac
  
  shift
done

/usr/sbin/xnbd-wrapper ${CMD}
