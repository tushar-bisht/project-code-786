FROM node:alpine
COPY . /app
WORKDIR /app
EXPOSE 8080
RUN npm install
ENTRYPOINT ["npm", "start"]
