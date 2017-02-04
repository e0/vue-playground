FROM node

MAINTAINER e0

ENV PORT=8080

RUN apt-key adv --fetch-keys http://dl.yarnpkg.com/debian/pubkey.gpg
RUN echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn
RUN yarn global add webpack

ADD     . /frontend
WORKDIR /frontend

RUN yarn

EXPOSE $PORT
ENTRYPOINT ["npm", "run", "dev"]
