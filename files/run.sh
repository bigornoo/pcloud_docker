#!/bin/bash
# Specials thhanks to James 
# https://github.com/jamesfkinney/plex-pcloud

pid=0

# SIGTERM-handler
term_handler() {
  if [ $pid -ne 0 ]; then
    fusermount -u /pcloud
    wait "$pid"
  fi
  exit 143; # 128 + 15 -- SIGTERM
}


# setup handlers
# on callback, kill the last background process, which is `tail -f /dev/null` and execute the specified handler
trap 'term_handler' SIGTERM



# Run application
  if  [ -e /pcloudpassSaved ]; then
      # subsequent run, pCloud password already saved
      if ! pgrep -x "fusermount" > /dev/null ; then
          echo "pCloud not running, starting..."
          pcloudcc -u $PCLOUDUSER -m /pcloud -d
      fi
  else
    #  first run, save pCloud password
    echo "pCloud initial run, registering password.  You may remove the secret on the next run."
    touch /pcloudpassSaved
    pcloudcc -u $PCLOUDUSER -d -s -m /pcloud -p </run/secrets/secret1 
  fi
  pid=$(pidof fusermount)  
# wait forever
while true
do
  tail -f /dev/null & wait ${!}
done





