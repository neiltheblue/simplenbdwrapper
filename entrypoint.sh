#!/bin/sh

CMD=""

while [ $1 ]
do
  case $1 in
   --cow) CMD="--cow ${CMD}"
   ;;
   --readonly) CMD="--readonly ${CMD}"
   ;;
   *) if [ -d $1 ]
    then
      for F in $(ls $1)
      do
        CMD="${CMD} --imgfile ${1}/${F}"
      done
    else
      CMD="${CMD} --imgfile $1"
    fi
   ;;
  esac
  shift
done

echo ${CMD}
/usr/sbin/xnbd-wrapper -lport 10809 ${CMD}
