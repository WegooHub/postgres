#!/bin/bash
set -e

# Modify postgresql.conf to load pg_cron
echo "shared_preload_libraries = 'pg_cron'" >> "$PGDATA/postgresql.conf"
echo "cron.database_name = 'wegoostore'" >> "$PGDATA/postgresql.conf"