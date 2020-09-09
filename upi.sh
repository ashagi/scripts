#!/bin/bash

# Check if arguments are supplied
if [ $# -eq 0 ]; then
    echo "No arguments supplied"
    return 1
fi

# Verify that passed file exists
ZIP=$1
if [ ! -f "$ZIP" ]; then
    echo "Passed file $ZIP does not exist"
    return 1
fi

echo "filename is "

# Verify that target folder exists
DEST=~/Projects/sandbox
if [ ! -d "$DEST" ]; then
    echo "Target folder $DEST does not exist"
    return 1
fi

echo "Unzipping "
unzip $ZIP -d $DEST
nohup idea "$DEST/${ZIP%%.*}" &