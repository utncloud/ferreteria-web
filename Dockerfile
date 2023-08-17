#FROM node:14.2.0-alpine3.11
#RUN mkdir -p /app
#WORKDIR /app
#COPY package*.json /app
##RUN npm install -g @angular/cli
#RUN npm install
#COPY . /app
##EXPOSE  3001
#RUN npm run build --prod


# Stage 2
FROM nginx:alpine
COPY /dist/tools-store-web /usr/share/nginx/html

### STAGE 2: Run ###
#FROM nginx:1.17.1-alpine
##COPY nginx.conf /etc/nginx/nginx.conf
#COPY --from=build /app/dist/tools-store-web /usr/share/nginx/html


#FROM node:18-alpine as build
#WORKDIR /usr/local/app
#COPY ./ /usr/local/app/
#COPY package*.json ./
#RUN npm install -g npm@latest
#RUN npm install --force
#RUN npm run build --prod

#FROM nginx:1.21.6
# ---- We set our proxy configuration in the following line ----
#COPY production.nginx.proxy.conf /etc/nginx/conf.d/default.conf
#COPY --from=build /usr/local/app/dist/your-project-name /usr/share/nginx/html

#EXPOSE 80