FROM node:16-alpine3.11

RUN mkdir /workspace

COPY package.json /workspace/

WORKDIR /workspace

RUN  apk add python make g++&& \
    npm install &&\
    yarn global add serve

COPY . /workspace/

RUN npm run build

ENTRYPOINT ["serve", "dist"]
