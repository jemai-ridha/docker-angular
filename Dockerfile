FROM node:6.17.1-alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx

COPY --from=0 /app/dist /usr/share/nginx/html
