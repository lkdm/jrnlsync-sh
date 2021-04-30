#!/bin/zsh

# Syncs journal entries from iOS (made through a Shortcut) with the shell journal.

echo "Running jrnl-sync. For more info visit:\n\n\thttps://github.com/lkdm/jrnl-sync\n"

# Current date
DATE=$(date +'%Y%m%d-%H%M')
# Path to iOS Shortcuts directory 
SHORTCUTSDIR=$HOME/Library/Mobile\ Documents/iCloud~is~workflow~my~workflows/Documents/journals
# Path to journal with entries from iOS
OGFILE=${SHORTCUTSDIR}/ios.txt
# Path for new backup file to be created
BACKUPFILE="${SHORTCUTSDIR}/ios_${DATE}.backup"
# Message to write in journal once sync has been completed.
BACKUPMSG="Entries from iOS synced.\nLog entries such as this one can be deleted using:\n\n\tjrnl @log --delete\n\n@log_${DATE}"

# If directory does not exist
mkdir -p $SHORTCUTSDIR
# Create sync file if it does not exist.
if [ ! -f $OGFILE ]
then
	touch $OGFILE
	echo "Welcome. Please ensure you have installed jrnl.sh before the next time you run this script."
	echo "Script has created a sync file in your iCloud Shortcuts directory at:\n\n\t${OGFILE}\n\n"
	echo "Done! Now you can write entries and save them to iCloud using the Siri Shortcut. The file will sync to your computer, then you can run this script anytime to merge entries with your main jrnl.sh journal." 
	exit 1
fi

# If Shortcut journal is empty, terminate script.
if [ ! -s $OGFILE ]
then
	echo "There are no entries to sync.\n\nThis either means you haven't written new entries on iOS, or there is a problem with iCloud."
	exit 1
fi

# Prepend the backup message to the original file, then back it up
touch $BACKUPFILE
cat <(echo $BACKUPMSG) $OGFILE > $BACKUPFILE
# Sync contents of backup file with journal software
jrnl < $BACKUPFILE
# Empty the contents of the original file
cp /dev/null $OGFILE
# Ask user if they want to delete the log
jrnl @log_$DATE --delete

echo "Entries from iOS synced to journal."
