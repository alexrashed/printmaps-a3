#!/bin/bash
# 1) Download and extract printmaps: http://printmaps-osm.de:8080/files/printmaps_linux_amd64.tar.gz
# 2) Make sure to first create the map:
# ../printmaps template
# 3) Edit the maps.yml file
# ../printmaps create
# 4) Execute in the two folders:
rm -f printmaps.svg
rm -f printmaps.png
../printmaps update
../printmaps order
while [ ! -f printmaps.zip ]
do
  sleep 10
  ../printmaps download
done
unzip printmaps.zip
rm printmaps.zip
# The resulting SVGs have to be combined for an A3 print:
# git clone https://github.com/astraw/svg_stack.git
#python2 svg_stack.py --direction=h --margin=0 ~/Repos/printmaps-a3/lareunion/printmaps.svg ~/Repos/printmaps-a3/mauritius/printmaps.svg > combined.svg

