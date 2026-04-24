#!/bin/bash
REPO_URL="https://github.com/kaasch-co/configs.git"
TEMP_DIR=$PWD/"configs"
CONF_DIR=$HOME/.config

echo "Cloning config repo..."
mkdir $TEMP_DIR
git clone $REPO_URL $TEMP_DIR

echo "Copying files..."
cp -r $TEMP_DIR/nvim $CONF_DIR
cp -r $TEMP_DIR/tmux $CONF_DIR

echo "Removing cloned repo..."
rm -Rf $TEMP_DIR

echo "Done!"
