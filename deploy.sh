#!/usr/bin/env bash
set -e

cd ~/transparentsd.github.io

# Prompt user for commit message
echo "Enter a commit message:"
read commit_message

# Sync from exported Website content (shared folder)
rsync -av --delete \
  --exclude='.git' \
  --exclude='.gitignore' \
  --exclude='fixlinks.sh' \
  --exclude='deploy.sh' \
  /media/sf_TransparentSD/Website/ \
  .

# Fix Joplin path prefixes
./fixlinks.sh

git add .

# If no message provided, use a default fallback
if [ -z "$commit_message" ]; then
    commit_message="Sync website"
fi

git commit -m "$commit_message"
git push

