FROM ubuntu_pm2:latest
MAINTAINER Krzysztof Gawryś

RUN apt-get -y update
RUN apt-get -y install nodejs npm
RUN npm install pm2 -g

VOLUME ["/app"]

# Expose ports
EXPOSE 80 443 43554

WORKDIR /app

# Start process.yml
CMD ["pm2-docker", "start", "--auto-exit", "--env", "production", "process.yml"]
