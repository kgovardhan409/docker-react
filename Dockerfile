FROM node:lts-alpine AS builder

# // specify the working directory
WORKDIR /app

# // COPY package.json
COPY package.json ./

# // Install dependencies
RUN npm install
# // COPY the rest of the files

COPY . .
# // execute the build command
RUN npm run build


FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html