# oeplatform-deploy

## Usage

```
docker run -v "$(pwd)/oeplatform_data:/var/lib/postgresql/data" -p "5432:5432" ghcr.io/openenergyplatform/oeplatform-postgres:latest
```
It starts a already built docker container, exposes port 5432 to your local machine and creates a data directory in a `oeplatform_data` folder at your current path.

## What does this?

This Dockerfile creates a container which is prepared for use with open_eGo. This means that all required dependencies for the database.
Afterwards you need to migrate the Django tables. If the migration has not yet been executed, Django also warns you.
Before you can get started, we need to migrate the oedb migrations.

## How does I tell Django to use this container?

All relevant settings are stored in `/oeplatform/securitysettings.py`, which is normally created by using the `securitysettings.py.default`.
We included the usage of environment variables to archieve configuration options. You need to set the following configuration options:

+ `OEP_DJANGO_USER=postgres`
+ `OEP_DB_PW=postgres`
+ `LOCAL_DB_USER=postgres`
+ `LOCAL_DB_PASSWORD=postgres`

## Which are the credentials for this container?

+ `POSTGRES_USER=postgres`
+ `POSTGRES_PASSWORD=postgres`

We created two databases:

+ oep_django
	+ Contains the django tables, which are introduced by the django migration.
+ oedb
	+ Contains the custom tables, which are introduced by the alembic migration.


## How does this work?

1. We inherit from the Postgres container in version 14.
2. In addition we install the packages `apt-get update apt-get install -y postgresql-contrib postgresql-plpython3-14 postgresql-14-postgis-3 `.
4. We copy the init script to a place where Postgres finds it and executes it after starting the database.
5. The database is ready to use.
