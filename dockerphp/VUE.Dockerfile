# base image
#Build Vue Project
FROM node:12.18.1-alpine AS build
WORKDIR /app/Project
COPY package.json /app/project/package.json
RUN npm install
COPY . .
RUN npm run build

#nginx server
FROM nginx:1.19.0-alpine AS prod-stage
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx","-g","daemon off;"] 