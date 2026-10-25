FROM nginx:alpine
#FROM nginx:1.14.0
# Copy frontend files
COPY src/ /usr/share/nginx/html/

# Copy Nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf
#Update container env
RUN apk update && apk upgrade --no-cache

# Create a non-root user and grant access to required files
RUN chown -R nginx:nginx /usr/share/nginx/html \
    /var/cache/nginx \
    /var/log/nginx \
    /etc/nginx \
    && touch /var/run/nginx.pid \
    && chown nginx:nginx /var/run/nginx.pid

# Run Nginx as a non-root user
USER nginx

EXPOSE 80
