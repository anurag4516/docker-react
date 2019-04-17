FROM node:alpine as builder
WORKDIR '/usr/app/react'
COPY ./package.json .
RUN npm install
COPY . .
RUN npm run build
# /usr/app/react/build --- will contain every build dependency

FROM nginx
COPY --from=builder /usr/app/react/build /usr/share/nginx/html

