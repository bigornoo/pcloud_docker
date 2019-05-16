#!/bin/bash
# Specials thhanks to James 
# https://github.com/jamesfkinney/plex-pcloud

#Define cleanup procedure
cleanup() {
    echo "Container stopped, performing cleanup..."
}

if  [ -e /pcloudpassSaved ]; then
  # subsequent run, pCloud password already saved
    if ! pgrep -x "fusermount" > /dev/null ; then
      echo "pCloud not running, starting..."
      pcloudcc -u $PCLOUDUSER -m /pcloud
      #Trap SIGTERM
      trap 'true' SIGTERM
      #Execute command
      fusermount -u /pcloud
      #Wait
      wait $!
      #Cleanup
      cleanup
    fi
else
    #  first run, save pCloud password
    echo "pCloud initial run, registering password.  You may remove the secret on the next run."
    touch /pcloudpassSaved
    pcloudcc -u $PCLOUDUSER -s -m /pcloud -p </run/secrets/secret1
    #Trap SIGTERM
    trap 'true' SIGTERM
    #Execute command
    fusermount -u /pcloud
    #Wait
    wait $!
    #Cleanup
    cleanup
fi

