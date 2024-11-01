# Build image for apps/store
FROM node:20 as store-backend
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY /apps/store/build /app
EXPOSE 9000
EXPOSE 7001
CMD [ "npm", "start" ]

# Build image for apps/store-frontend
FROM node:20 as store-frontend
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY /apps/store-frontend/build /app
EXPOSE 8000
CMD [ "npm", "start" ]
