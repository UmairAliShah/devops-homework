#!/bin/bash

# Switch To /opt directory
cd /opt

# Locate all the directories which contain .prune-enable file 
# and store the directories in variable
dirs=$(find . -type f -name '.prune-enable' | sed -r 's|/[^/]+$||' |sort |uniq)

# Delete any files named 'crash.dump' in those directories
find $dirs -name 'crash.dump' -type f -delete

# Find all the files with '.log' suffix and having size greater than 1 Mega Byte
logs_files=$(find $dirs -name '*.log' -type f -size +1M)

# Replace the file with last file containing only last 20,000 lines 
for log_file in $logs_files; do
    echo "$(tail -20000 $log_file)" > $log_file
    echo "done"
done
