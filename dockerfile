FROM node:12 AS build_env

WORKDIR /app

COPY . ./

RUN npm install

RUN npm run build --force  

FROM nginx

COPY --from=build_env /app/dist/PokeApp /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]

