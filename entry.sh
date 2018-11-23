#!/bin/bash
while [ ! -f "/go/src/bbs/main" ]
do
  sleep 1s
  echo 'main not exit'
done
/go/src/bbs/main
