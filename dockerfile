FROM node:21-alpine3.19

WORKDIR /usr/src/app

COPY package.json ./
COPY package-lock.json ./

RUN npm install -g npm@10.8.1

RUN npm config set fetch-timeout 120000
RUN npm cache clean --force

RUN npm install

COPY . .

RUN npx prisma generate

EXPOSE 3000