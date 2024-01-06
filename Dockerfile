FROM node:20-alpine as stage

WORKDIR /src/app
COPY . .
RUN npm install
RUN npm run build

FROM node:20-alpine 

WORKDIR /src/app
copy --from=stage /src/app/dist ./dist
CMD [ "node", "dist/main.js" ]