FROM node:4.4.7
MAINTAINER Lucas Hansen <lucashansen@gmail.com>

RUN npm update -g --loglevel=silent

ADD app/.meteor/platforms app/.meteor/release /opt/shell/.meteor/
ADD build/bundle /opt/app/

RUN cd /opt/app/programs/server \
  && ([ -f package.json ] || npm init -f) \
  && npm i --loglevel=silent --unsafe-perm \
  && mkdir -p /opt/shell/.meteor/local/shell \
  && touch /opt/shell/.meteor/packages \
  && touch /opt/shell/.meteor/versions

WORKDIR /opt/app

ENV PORT 80
ENV METEOR_SHELL_DIR /opt/shell/.meteor/local/shell

EXPOSE 80

CMD ["node", "main.js"]

# To activate the meteor shell:
#    curl https://install.meteor.com/ | sh
#    cd /opt/shell | meteor shell
