#!/bin/bash

mkdir -p ~/bin
curl -LJO https://raw.githubusercontent.com/luknuk/jrnl-sync/jrnl-sync.sh
mv jrnl-sync.sh ~/bin/jrnl-sync
chmod +x ~/bin/jrnl-sync

echo "Thank you for installing jrnl-sync. Please add the following to your .bashrc or .zshrc:

    # Adds ~/bin to PATH
    path+=$HOME/bin
    export PATH

After that, you can use 'jrnl-sync'."