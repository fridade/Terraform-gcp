# Use the official PHP image with FPM
FROM php:8.1-fpm

# Install Nginx and Supervisor
RUN apt-get update && \
    apt-get install -y nginx supervisor && \
    rm -rf /var/lib/apt/lists/*

# Install any needed PHP extensions
RUN docker-php-ext-install pdo pdo_mysql

# Remove default Nginx configuration
RUN rm /etc/nginx/sites-enabled/default

# Copy the custom Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the PHP source code into the container
COPY src/ /var/www/html/

# Copy the Supervisor configuration file
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Set up directories
RUN mkdir -p /var/run/nginx

# Expose port 80
EXPOSE 80

# Start Supervisor
CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]
