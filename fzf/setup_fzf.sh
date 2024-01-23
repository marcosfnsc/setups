#!/usr/bin/env bash

# install fzf
REPO_URL="https://github.com/junegunn/fzf.git"
REPO_PATH="$HOME/.fzf"
git -C $REPO_PATH pull 2>/dev/null || git clone --depth 1 $REPO_URL $REPO_PATH
$HOME/.fzf/install --all

echo "setup fzf sucess"
