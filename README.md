# jrnl-sync
Write jrnl.sh entries on iOS and sync anytime.

Using a Siri Shortcut, write entries in `jrnl.sh` format on your iOS device. The entires are appended to a plaintext file, which can be synced to your computer using iCloud Drive. It can then be synced to your main jrnl.sh journal using the provided shell script.

# Usage

Add a new journal entry from iOS:

1. Open your text editing app of choice (I prefer Drafts).
2. Write your journal entry.
3. Open the share menu.
4. Share using the `jrnl` Siri Shortcut.

Sync your iOS entries with your main journal:

1. Open your shell.
2. Type `jrnl-sync`.
3. If there are journal entries to sync, it will sync them.

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

# FAQ

## Why use this instead of copy/pasting, emailing, airdropping from iOS?

This will preserve the date and time of the entry was *written* on iOS, rather than the date and time you performed the import. Huge improvement if you care about what time the entry was actually written.

## What app do you recommend for writing entries on iOS?

I personally like to use Drafts.app to write entries, from which I can append them to a journal using the Share menu.

## Can I run the script as part of a cron job/Launch Agent?

I have not tested it, but I don't see why not.

## Why does it create then delete a @log entry in my diary

This is caused by `jrnl.sh` not respecting the first timestamp in a file, and prepending its own timestamp (time of import). To get around this, I create a dummy entry then delete it. The dummy entry has instructions on how to delete them, if the script fails to clean them up.