#!/bin/bash

while ! nc -z $DB_HOSTNAME 3306 ; do
    echo "Waiting for database ${DB_HOSTNAME} to come up."
    sleep 3
done

if [ ! -e /opt/eset/RemoteAdministrator/Server/ERAServer ]; then
    /opt/server-linux-x86_64.sh \
        --db-driver "MySQL ODBC Driver" \
        --db-hostname "${DB_HOSTNAME}" \
        --db-name "${DB_NAME}" \
        --db-admin-username "${DB_ADMIN_USERNAME}" \
        --db-admin-password "${DB_ADMIN_PASSWORD}" \
        --db-user-username "${DB_USER_USERNAME}" \
        --db-user-password "${DB_USER_PASSWORD}" \
        --server-root-password "${ERA_ADMINISTRATOR_PASSWORD}" \
        --disable-imp-program \
        --cert-hostname=localhost \
        --skip-license
fi

if [ -e /opt/eset/RemoteAdministrator/Server/ERAServer ]; then
    /opt/eset/RemoteAdministrator/Server/ERAServer
else
    echo "Failed to install the ERAServer."
    exit 1
fi
