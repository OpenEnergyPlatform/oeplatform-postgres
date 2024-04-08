#!/bin/bash

echo "Creating Databases..."

createdb oep_django
createdb oedb

psql -U postgres -d oedb -c "CREATE EXTENSION IF NOT EXISTS postgis;"
psql -U postgres -d oedb -c "CREATE EXTENSION IF NOT EXISTS postgis_topology;"
psql -U postgres -d oedb -c "CREATE EXTENSION IF NOT EXISTS hstore;"
psql -U postgres -d oedb -c "CREATE EXTENSION IF NOT EXISTS pg_trgm;"

psql -U postgres -d oep_django -c "CREATE EXTENSION IF NOT EXISTS postgis;"
psql -U postgres -d oep_django -c "CREATE EXTENSION IF NOT EXISTS postgis_topology;"
psql -U postgres -d oep_django -c "CREATE EXTENSION IF NOT EXISTS hstore;"
psql -U postgres -d oep_django -c "CREATE EXTENSION IF NOT EXISTS pg_trgm;"
