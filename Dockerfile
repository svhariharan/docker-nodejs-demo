FROM node:latest
WORKDIR /usr/src/app
COPY nodeapp/* /
RUN npm install
EXPOSE 3001
CMD [ "npm","start" ]
