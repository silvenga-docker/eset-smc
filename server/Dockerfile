FROM ubuntu:bionic

ENV ESMC_VERSION=7.2.2233.0

# https://help.eset.com/esmc_install/71/en-US/prerequisites_server_linux.html
RUN set -xe \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    curl \
    netcat \
    # Server Requirements
    xvfb \
    cifs-utils \
    libqtwebkit4 \
    krb5-user \
    ldap-utils libsasl2-modules-gssapi-mit \
    snmp \
    samba \
    # Required for myodbc
    libodbc1 \
    unixodbc \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

ARG CONNECTOR_URL=https://cdn.mysql.com/archives/mysql-connector-odbc-5.3/mysql-connector-odbc-5.3.11-linux-ubuntu18.04-x86-64bit.tar.gz

RUN set -xe \
    && mkdir -p /tmp/odbc \
    && curl ${CONNECTOR_URL} -o /tmp/mysql-connector-odbc.tar.gz \
    && tar xvf /tmp/mysql-connector-odbc.tar.gz --directory=/tmp/odbc --strip-components=1 \
    && cp -v /tmp/odbc/bin/* /usr/local/bin \
    && cp -v /tmp/odbc/lib/* /usr/local/lib \
    && /usr/local/bin/myodbc-installer -a -d -n "MySQL ODBC Driver" -t "Driver=/usr/local/lib/libmyodbc5w.so" \
    && /usr/local/bin/myodbc-installer -d -l \
    && rm -r /tmp/

# https://www.eset.com/us/business/security-management-center/download/#standalone
ARG ESMC_URL=https://download.eset.com/com/eset/apps/business/era/server/linux/latest/server-linux-x86_64.sh

RUN set -xe \
    && curl ${ESMC_URL} -o /opt/server-linux-x86_64.sh \
    && chmod +x /opt/server-linux-x86_64.sh \
    && /opt/server-linux-x86_64.sh --version \
    && /opt/server-linux-x86_64.sh --version | grep $ESMC_VERSION \
    && mkdir -p /tmp

VOLUME /etc/opt/eset /var/opt/eset /var/log/eset
WORKDIR /opt/eset/

# ESET Security Management Center (ESMC) server port (default value is 2222)
# ESET Security Management Center console port (default value is 2223)
EXPOSE 2222 2223

ADD rootfs/ /

CMD ["/bin/bash","/opt/start.sh"]
