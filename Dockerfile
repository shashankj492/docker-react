FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# After this step a build folder will get created in the /app folder in the container
# Once we start a FROM block the previous block ends there

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

