#!/bin/bash


if  [ -e /pcloudpassSaved ]; then
  # subsequent run, pCloud password already saved
    if ! pgrep -x "fusermount" > /dev/null ; then
      echo "pCloud not running, starting..."
      pcloudcc -u $PCLOUDUSER -m /pcloud'
    fi
else
    #  first run, save pCloud password
    echo "pCloud initial run, registering password.  You may remove the secret on the next run."
    touch /pcloudpassSaved
    pcloudcc -u $PCLOUDUSER -s -m /pcloud -p </run/secrets/secret1
    rm  -f  /root/secret1
fi
