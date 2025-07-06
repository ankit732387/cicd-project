FROM ubuntu:20.04

# Avoid user interaction during package install
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y apache2 git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy website files to Apache's web root
COPY . /var/www/html

# Expose port 80 (default HTTP port)
EXPOSE 80

# Optional volume (only if needed by your app)
VOLUME ["/ankit-kumar"]

# Start Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]

