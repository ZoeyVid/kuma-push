#!/bin/sh

if ! [ -f /tmp/ok.json ]; then 
  exit 1
fi

if [ "$(jq -r .ok </tmp/ok.json)" != "true" ]; then 
  exit 1
fi

exit 0
