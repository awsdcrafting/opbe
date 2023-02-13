# Use an official PHP image as the base image
FROM php:7.4-apache

# Set the working directory in the container to /app
#WORKDIR /app

# Copy the contents of the current directory to the /app directory in the container
COPY . /var/www/html

# Install any required PHP extensions
RUN docker-php-ext-install pdo pdo_mysql

# Enable the mod_rewrite Apache module
RUN a2enmod rewrite

# Set the ServerName directive in the Apache configuration
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Expose port 80 to allow connections to the web server
EXPOSE 80

# give write permission to php - NOT SAFE DO NOT USE IN PRODUCTION
RUN chown -R www-data:www-data /var/www/html
USER www-data

# Start the Apache web server
CMD ["apache2-foreground"]
