#!/bin/bash

# Global variables
ZIP=$1
DEST=~/Projects/sandbox

# Check if arguments are supplied
if [ $# -eq 0 ]; then
    echo "No arguments supplied"
    return 1
fi

# Verify that passed file exists
if [ ! -f "$ZIP" ]; then
    echo "Passed file $ZIP does not exist"
    return 1
fi

# Verify that target folder exist
if [ ! -d "$DEST" ]; then
    echo "Target folder $DEST does not exist"
    return 1
fi

# Verify that project does not exist
if [ -d "$DEST/${ZIP%%.*}" ]; then
    printf "There is already a project at $DEST/${ZIP%%.*}\nPlease delete that project or change its name\n\n"
    return 1
fi

echo "Unzipping "
unzip $ZIP -d $DEST

echo "Opening idea with the project"
# Explanation of nohup and pipes: https://stackoverflow.com/questions/10408816/how-do-i-use-the-nohup-command-without-getting-nohup-out
nohup idea "$DEST/${ZIP%%.*}" > /dev/null 2>&1&
