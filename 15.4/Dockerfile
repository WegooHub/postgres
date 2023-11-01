FROM postgres:15.4

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    postgresql-server-dev-15 \
    ca-certificates \ 
    libmariadb-dev-compat \
    libmariadb-dev \
    postgresql-contrib-15  \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
RUN git clone https://github.com/enterprisedb/mysql_fdw.git

WORKDIR /tmp/mysql_fdw
RUN export PATH=/usr/local/pgsql/bin/:$PATH && \
    export PATH=/usr/local/mysql/bin/:$PATH && \
    make USE_PGXS=1 && \
    make USE_PGXS=1 install

RUN rm -rf /tmp/mysql_fdw

# Clone and install pg_cron
RUN git clone https://github.com/citusdata/pg_cron.git && \
    cd pg_cron && \
    make && \
    make install
# Clone and install mysql_fdw


# Configure pg_cron to start with PostgreSQL
COPY ./init.sh /docker-entrypoint-initdb.d/

