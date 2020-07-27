# https://help.eset.com/esmc_install/71/en-US/web_console_requirements_linux.html

FROM tomcat:9-jdk11-openjdk-slim

ENV ESMC_CONSOLE_VERSION=7.2.221.0

RUN set -xe \
    && apt-get update \
    && apt-get install -y curl unzip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# https://help.eset.com/esmc_install/71/en-US/component_installation_webconsole_linux.html
ARG CONSOLE_URL=https://download.eset.com/com/eset/apps/business/era/webconsole/latest/era.war

RUN set -xe \
    && curl ${CONSOLE_URL} -o /usr/local/tomcat/webapps/era.war \
    && unzip -p /usr/local/tomcat/webapps/era.war META-INF/version.txt \
    && unzip -p /usr/local/tomcat/webapps/era.war META-INF/version.txt | grep $ESMC_CONSOLE_VERSION

ADD rootfs/ /

CMD ["/bin/bash","/opt/start.sh"]
