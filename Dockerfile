FROM node:16 AS build
WORKDIR /app
COPY package.json .
COPY yarn.lock .
RUN yarn install

FROM node:16-alpine AS main
COPY --from=build /app /
#COPY . .
EXPOSE 3000
CMD [ "yarn", "start" ]