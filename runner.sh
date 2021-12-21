#!/bin/bash
service docker start
TOKEN=$(/usr/bin/curl --user "<GitHub username>:<GitHub PAT>" -X POST -H "Accept: application/vnd.github.v3+json" https://api. github.com/repos/<username>/<repository name>/actions/runners/registration-token | /usr/bin/jq '.token' | /usr/bin/awk -F\\" '{print $2}') echo $TOKEN > /home/runner/actions-runner/token.file
/bin/chmod 755 /home/runner/actions-runner/token.file
/bin/su - runner -c "cd /home/runner/actions-runner/; ./script.exp $(/bin/cat /home/runner/actions-runner/token.file)"
/bin/su - runner -c "/home/runner/actions-runner/run.sh --once"
/bin/su - runner -c "/home/runner/actions-runner/config.sh remove --token $(/bin/cat /home/runner/actions-runner/token.file)"
