# Derived from official mysql image (our base image)
FROM mysql:8.0.26

# Add a database
ENV MYSQL_DATABASE wc_crawler_db

# Add the content of the sql-scripts/ directory to your image
# All scripts in docker-entrypoint-initdb.d/ are automatically
# executed during container startup
COPY ./sql-config/ /docker-entrypoint-initdb.d/

