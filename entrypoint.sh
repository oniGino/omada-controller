#!/bin/sh

/etc/init.d/tpeap start

on_exit() {
  /etc/init.d/tpeap stop
}

trap 'on_exit' EXIT

tail -f \
    "/opt/tplink/EAPController/logs/mongod.log" \
    "/opt/tplink/EAPController/logs/server.log" \
    "/opt/tplink/EAPController/logs/startup.log"




