#!/bin/bash
# original: https://github.com/tessus/joplin-scripts/blob/master/jnbujex

# Setup JOPLIN_BACKUP_DIR in your env vars

D=`date +'%Y-%m-%d_%H-%M'`

joplin sync
joplin e2ee decrypt
joplin export --format jex /tmp/joplin_${D}.jex

rclone copyto /tmp/joplin_${D}.jex ${JOPLIN_BACKUP_DIR}/joplin_${D}.jex

rm /tmp/joplin_*.jex