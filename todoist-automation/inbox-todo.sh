#!/bin/sh

# most likely not crossplatform but I run it in Windows only
SCRIPT_PWD=$(cygpath -u $(dirname "$0"))

source "$SCRIPT_PWD/secrets.sh"

# switch internal field separator to newline from whitespace
# otherwise FOR loops will iterate over whitespace of filenames
IFS=$(echo -en "\n\b")

INBOX_ITEMS=$(ls $INBOX_FOLDER)

touch $SCRIPT_PWD/created_todos.txt
[ -s $SCRIPT_PWD/created_todos.txt ] || echo "file must not be empty" >> $SCRIPT_PWD/created_todos.txt

CREATED_TODOS=$(cat $SCRIPT_PWD/created_todos.txt)

NEW_TODOS=$(echo "$INBOX_ITEMS" | grep -v "$CREATED_TODOS")

for TODO in $NEW_TODOS
do
	curl "https://api.todoist.com/rest/v1/tasks" \
    -X POST \
    --data "{\"content\": \"Home PC inbox: $TODO\", \"project_id\": $PROJECT_ID, \"due_string\": \"Friday\", \"label_ids\": [$LABEL_ID]}" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $TODOIST_TOKEN"
    echo $TODO >> $SCRIPT_PWD/created_todos.txt
done
