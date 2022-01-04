# Joplin Automation

Set of scripts for different Joplin automation tasks

## Backup

### Install Joplin Terminal

Based on Raspberry Pi instructions from [Medium](https://medium.com/@numbuk/joplin-on-raspberry-pi-raspbian-d046ec615e40)

1. Install dependencies:
```bash
sudo apt install libsecret-1-dev
```

2. Install node:
```bash
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash
sudo apt install -y nodejs
```

3. Install python2 if python resolves to version3: `python --version`
```bash
sudo apt install python2
sudo ln -sf /usr/bin/python2 /usr/bin/python
```

4. Install joplin-cli:
```bash
NPM_CONFIG_PREFIX=~/.joplin-bin npm install -g joplin
sudo ln -s ~/.joplin-bin/bin/joplin /usr/bin/joplin
```

5. If python symlink was changed, bring it back:
```bash
 sudo ln -sf /usr/bin/python3 /usr/bin/python
```

### Configure Joplin Terminal

1. Configure Joplin:

```bash
joplin config sync.target 3
```

2. Synchronize:
```bash
joplin sync
```
Open in browser http://127.0.0.1:9967/auth and authenticate in your OneDrive

3. Decrypt the content:
```bash
joplin e2ee decrypt
```
Provide your encryption password

> If there are errors retry from step 2. Usually self resolves

### Install and Configure rclone

1. Install rclone:
```
sudo apt install rclone
```

2. Configure rclone:
```
rclone config
```
Follow instruction and setup new remote named `dropbox`

3. Add env variable:
```
export JOPLIN_BACKUP_DIR=dropbox:/Backup/Joplin
```