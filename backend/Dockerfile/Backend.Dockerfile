FROM node:21.5-slim

ENV NODE_ENV development

WORKDIR /docker/backend

COPY ./src .

COPY ./swagger/output ./swagger

EXPOSE 4000