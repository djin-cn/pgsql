#!/bin/bash
pg_dump -U postgres -w -d {db} -f /var/lib/postgresql/data/backup/postgres.$(date "+%Y%m%d%H%M%S").sql
