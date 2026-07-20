#!/bin/bash
# Enable the PostGIS / pg_trgm extensions OpenZaak (and woo_publications) require.
set -e

for db in openzaak woo_publications; do
  psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$db" <<-EOSQL
    CREATE EXTENSION IF NOT EXISTS postgis;
    CREATE EXTENSION IF NOT EXISTS pg_trgm;
EOSQL
done
