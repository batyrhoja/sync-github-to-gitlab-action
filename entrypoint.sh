#!/bin/sh

mkdir -p /root/.ssh
echo "$INPUT_DESTINATION_SSH_KEY" > /root/.ssh/id_ed25519
chmod 700 /root/.ssh/id_ed25519

git config --global --add safe.directory /github/workspace
git remote add mirror $INPUT_DESTINATION_REPOSITORY
git fetch --unshallow
git push mirror $INPUT_DESTINATION_BRANCH_NAME -f
