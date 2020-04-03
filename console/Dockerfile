# https://help.eset.com/esmc_install/71/en-US/web_console_requirements_linux.html

FROM tomcat:9-jdk11-openjdk-slim

RUN set -xe \
    && apt-get update \
    && apt-get install -y curl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# https://help.eset.com/esmc_install/71/en-US/component_installation_webconsole_linux.html
ARG CONSOLE_URL=https://download.eset.com/com/eset/apps/business/era/webconsole/latest/era.war

RUN set -xe \
    && curl ${CONSOLE_URL} -o /usr/local/tomcat/webapps/era.war

ADD rootfs/ /

CMD ["/bin/bash","/opt/start.sh"]
