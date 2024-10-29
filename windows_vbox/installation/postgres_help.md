
# Login to the admin postgres database user

1. cd ~/docker-scripts-dev/tools
2. ./connect_postgres_2404.sh
3. su postgres
4. psql   <-- this will login you into the database admin user

# Creating a new database in postgress

1. CREATE DATABASE <new database name>;
2. CREATE USER ledger_dev WITH PASSWORD '<generated Password>';
3. GRANT ALL PRIVILEGES ON DATABASE "<new database name>" to <new database user>;
4. \c <new database name>
create extension postgis;
5. GRANT ALL ON ALL TABLES IN SCHEMA public TO <new database user>;
6. GRANT ALL ON SCHEMA public TO <new database user>;
