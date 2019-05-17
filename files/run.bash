#!/bin/bash
# Specials thhanks to James 
# https://github.com/jamesfkinney/plex-pcloud

# Run application
  if  [ -e /pcloudpassSaved ]; then
      # subsequent run, pCloud password already saved
      if ! pgrep -x "fusermount" > /dev/null ; then
          echo "pCloud not running, starting..."
          exec pcloudcc -u $PCLOUDUSER  -m /pcloud
      fi
  else
    #  first run, save pCloud password
    echo "pCloud initial run, registering password.  You may remove the secret on the next run."
    touch /pcloudpassSaved
    exec pcloudcc -u $PCLOUDUSER -s -m /pcloud -p </run/secrets/secret1 
  fi
#  while :;do
#    echo "Hello - ${SECONDS} elapsed"
#    sleep 1s
#  done

