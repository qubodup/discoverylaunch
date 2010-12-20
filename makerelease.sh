#!/bin/bash
# needs to be executed from project root
zip discoverylaunch-$1.zip *txt *gif *png *ogg *lua
mv discoverylaunch-$1.zip discoverylaunch-$1.love
