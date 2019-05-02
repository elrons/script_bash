#!/bin/bash
echo "hi,
please enter the path for the file"
read -e file
tar cvf ./$file""_$(date +%Y-%m-%d).tar ./$file
gzip ./$file""_$(date +%Y-%m-%d).tar.gz
