#!/bin/bash
export PG_OOM_ADJUST_FILE=/proc/self/oom_score_adj
export PG_OOM_ADJUST_VALUE=0
export PGDATA=/var/lib/pgsql/data

/usr/libexec/postgresql-check-db-dir %N

# Temporarily use postgresql-ctl wrapper around pg_ctl until there will
# exist clients which set PGPORT in service file.
cd /root/postcodes
su postgres -c 'postgres -D /var/lib/pgsql/data' &
node server.js
