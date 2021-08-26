FROM alpine:3.13@sha256:1d30d1ba3cb90962067e9b29491fbd56997979d54376f23f01448b5c5cd8b462

# File Author / Maintainer
LABEL authors="Zouhir Chahoud <zouhir@zouhir.org>"

# Update & install required packages
RUN apk add --update nodejs bash git

# Install app dependencies
COPY package.json /www/package.json
RUN cd /www; npm install

# Copy app source
COPY . /www

# Set work directory to /www
WORKDIR /www

# set your port
ENV PORT 8080

# expose the port to outside world
EXPOSE  8080

# start command as per package.json
CMD ["npm", "start"]
