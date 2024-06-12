#!/bin/bash

cd /opt/lampp/
# wayland gui permission
xhost si:localuser:root

sudo ./manager-linux-x64.run
