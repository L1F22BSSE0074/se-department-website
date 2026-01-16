# Use lightweight Nginx image
FROM nginx:alpine

# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy all HTML pages into nginx root
COPY pages/ /usr/share/nginx/html/

# Rename home.html to index.html so Nginx can serve it as default
RUN mv /usr/share/nginx/html/home.html /usr/share/nginx/html/index.html

# Copy CSS folder
COPY css/ /usr/share/nginx/html/css/

# Ensure files are readable
RUN chmod -R 755 /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx in foreground (required by Render)
CMD ["nginx", "-g", "daemon off;"]
