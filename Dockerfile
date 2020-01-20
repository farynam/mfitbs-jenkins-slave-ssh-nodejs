FROM jenkinsci/ssh-slave:latest

ARG NODE_VERSION="13.6.0"
ARG APPS="/myapps"
ARG NODE="${APPS}/node"
ARG NODE_ARCHIVE="node-v${NODE_VERSION}-linux-x64.tar.xz"
RUN mkdir -p ${NODE}
WORKDIR ${NODE}

RUN apt-get install wget tar -y \
    && wget "https://nodejs.org/dist/v${NODE_VERSION}/${NODE_ARCHIVE}" \
    && tar -xf ${NODE_ARCHIVE} \
    && ln -s "${NODE}/node-v${NODE_VERSION}-linux-x64" current \
    && rm ${NODE_ARCHIVE} \
    && ln -s "/usr/local/openjdk-8" "/usr/local/java" \
    && echo "export PATH=${NODE}/current/bin:$PATH" >>  /etc/profile





