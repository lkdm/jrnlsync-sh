#!/bin/bash

mkdir -p ~/bin
cd ~/bin
git clone https://github.com/luknuk/jrnl-sync.git

chmod +x jrnl-sync/jrnl-sync

echo "Thank you for installing jrnl-sync. Please add the following to your .bashrc or .zshrc:

    # Adds ~/bin to PATH
    path+=$HOME/bin
    export PATH

After that, you can use 'jrnl-sync'."