# Todoist Inbox task scheduler

This script creates a new todoist task whenever new item is added into an inbox.

It keeps track of already created tasks in `created_todos.txt`.

The script requries `secrets.sh` file in order to run. It stores following params:

* TODOIST_TOKEN - Todoist API integration token
* INBOX_FOLDER  - Folder name to scan for new inbox items
* PROJECT_ID    - Project ID for created tasks
* LABEL_ID      - Label that will be applied for created tasks

## Create Windows scheduler

Open Task scheduler:

1. `Win+R` -> `taskschd.msc`
2. In menu -> `Action` -> `Create Basic Task...`
3. Fill in name, description, setup scheduling interval
4. In Action select `Start a program`:
    * Program/script: `"C:\Program Files\Git\bin\bash.exe"` (including quotes)
    * Add arguments (optional): `--login -i -- C:\projectlocation\todoist-automation\inbox-todo.sh`
