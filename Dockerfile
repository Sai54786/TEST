#  base image
FROM nginx:alpine

# Copy static content to NGINX default path
COPY index.html /usr/share/nginx/html/

# Expose port
EXPOSE 80
