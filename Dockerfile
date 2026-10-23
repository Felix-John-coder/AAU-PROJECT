#FROM nginx:alpine
FROM nginx:1.14.0

COPY src/ /usr/share/nginx/html/

COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

# Use the default NGINX entrypoint (already included in nginx:alpine)