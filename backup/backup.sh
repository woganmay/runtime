#!/bin/bash

date="[$(date)]"
dtm=$(date '+%Y-%m-%d-%H-%M-%S')

echo "$date Starting backup run";

# First, rsync all /source to /destination for app storage
mkdir -p /destination/app
rsync -rptlD /source/ /destination/app/

echo "$date Storage path rsync to NFS complete";

# Next, generate a database backup straight to the NFS
PGPASSWORD="$DB_PASSWORD" pg_dump -h db -U $DB_USERNAME -d $DB_DATABASE > "/destination/db/$dtm.sql"

echo "$date SQL backup complete";

# Finally, delete any database backups older than 14 days
find /destination/db -type f -mtime +14 -exec rm {} \;

echo "$date SQL backups cleaned up";

echo "$date Backup run complete";
