FROM postgres

RUN apt-get update && \
	apt-get install -y postgresql-contrib \
	postgresql-postgis \
    postgresql-plpython3 postgresql-plpython \
    && rm -rf /var/lib/apt/lists/*

COPY init.sh /docker-entrypoint-initdb.d/init.sh

ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD postgres