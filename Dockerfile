FROM postgres:14

RUN apt-get update && \
	apt-get install -y postgresql-contrib \
    postgresql-plpython3-14 \
    binutils \ libproj-dev \ gdal-bin \
	postgresql-14-postgis-3 \
    && rm -rf /var/lib/apt/lists/*

COPY init.sh /docker-entrypoint-initdb.d/init.sh

ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD postgres