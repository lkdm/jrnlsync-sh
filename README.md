![Screenshot of terminal window showing jrnl-sync working](https://repository-images.githubusercontent.com/361320981/8014bf00-a5e1-11eb-9fa4-6850f818b7ff)

# jrnl-sync
Write [jrnl.sh](https://github.com/jrnl-org/jrnl) entries on iOS and sync anytime.

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
3. Install [jrnl](https://www.icloud.com/shortcuts/5cc0f3a9f81a4d67858a9d9048603e8a) iOS Shortcut.

## How to install jrnl-sync shell script

Copy and paste the following one-liner into your shell.

    curl -LJO https://raw.githubusercontent.com/lkdm/jrnl-sync/main/install.sh && bash install.sh; rm -f install.sh

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
