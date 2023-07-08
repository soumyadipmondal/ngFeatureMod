#stage1
FROM node:latest as builder
WORKDIR /ng/app
COPY . .
RUN npm install
RUN npm run build --prod

#stage 2
FROM nginx:alpine
COPY --from=builder /ng/app/dist/featues-ng /usr/share/nginx/html