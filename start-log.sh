#!/usr/bin/env bash
i=0
while [ $i -le 100 ] ;do
  echo $i >> /opt/test.log
  let i=$i+1
  sleep 1
done
