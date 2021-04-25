# jrnl-sync
Write jrnl.sh entries on iOS and sync anytime. I use Drafts to write entries. The Siri Shortcut will then append those to a plaintext file in a format the the `jrnl.sh` application will understand. Changes are synced over iCloud.

When the file is updated on the host computer (same computer that `jrnl.sh` is installed on), you can sync the iOS entries with your main journal using the `jrnl-sync` bash script.

This will create a backup of the iOS entries, and append the entries using the `jrnl` command. This means the script works with encrypted journals too!

# Installation
1. Make sure you have installed [jrnl.sh](https://jrnl.sh).
2. Install and run the jrnl-sync script once (see below).
3. Install [jrnl](https://www.icloud.com/shortcuts/167e5cb818b54eb6845df64a4aec1691) iOS Shortcut.

## How to install jrnl-sync shell script

Clone the repository.

    git clone https://github.com/luknuk/jrnl-sync.git

Move `jrnl-sync` shell script to your user binaries directory. Create that if it doesn't exist `mkdir ~/bin`.

    mv jrnl-sync ~/bin/jrnl-sync

If you haven't already, add your user binaries directory to your path variable. Do this by editing your `.bashrc` or `.zshrc` file and appending the following line, and replacing `YOURNAMEHERE` with your own user name.

    path+=('/Users/YOURNAMEHERE/bin')
    export PATH

Ensure the script has executable permissions.

    chmod +x jrnl-sync

Run it once to create the syncfile.

    jrnl-sync

You will see the following message if installation was successful:

    Welcome! This script should be used with the accompanying iOS Shortcut, and jrnl.sh software.

## Install jrnl Siri Shortcut

Make sure you can access the Siri Shortcut from the Share menu in iOS.

## Usage

Adding a new journal entry from iOS.

1. Open your text editing app of choice (I prefer Drafts).
2. Write your journal entry.
3. Open the share menu.
4. Share using the `jrnl` Siri Shortcut.

Syncing iOS entries with jrnl.sh main application.
1. Open your shell.
2. Type `jrnl-sync`.
3. If there are journal entries to sync, it will sync them.
