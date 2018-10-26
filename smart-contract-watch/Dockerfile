FROM node:8.12.0-alpine 

RUN apk update && apk upgrade && \
    apk add --no-cache git
WORKDIR /app
RUN git clone https://github.com/Neufund/smart-contract-watch.git /app
RUN yarn
CMD yarn


