#!/bin/sh

SCRIPT_PWD="${0%/*}"

# contains:
# TODOIST_TOKEN - Todoist API integration token
# INBOX_FOLDER - Folder name to scan for new inbox items
source "$SCRIPT_PWD/secrets.sh"

# switch internal field separator to newline from whitespace
# otherwise FOR loops will iterate over whitespace of filenames
IFS=$(echo -en "\n\b")

INBOX_ITEMS=$(ls $INBOX_FOLDER)
CREATED_TODOS=$(cat $SCRIPT_PWD/created_todos.txt)

NEW_TODOS=$(echo "$INBOX_ITEMS" | grep -v "$CREATED_TODOS")

for TODO in $NEW_TODOS
do
	curl "https://api.todoist.com/rest/v1/tasks" \
    -X POST \
    --data "{\"content\": \"Home PC inbox: $TODO\", \"label_ids\": [2157706142]}" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $TODOIST_TOKEN"
    echo $TODO >> $SCRIPT_PWD/created_todos.txt
done
