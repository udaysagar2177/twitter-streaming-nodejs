FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install --yes curl wget git net-tools && \
    curl --silent --location https://deb.nodesource.com/setup_4.x | sudo bash - && \
    apt-get install --yes nodejs && \
    apt-get install --yes build-essential

RUN apt-get install -y python vim

# environment varibles for the deployment
ENV PORT 21771
ENV IP 0.0.0.0

ADD app /app
WORKDIR /app
RUN npm install
CMD node server.js
