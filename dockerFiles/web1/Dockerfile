FROM centos:7

# Install telnet
RUN yum install telnet -y            && \ 
    yum install httpd httpd-tools -y && \
    mkdir folder                     && \
    touch file                       && \
    yum install unzip -y

# Set environment variable
ENV WORDPRESS_DB="wordpress"        \
    WORDPRESS_USER="wordpress_user" \
    WORDPRESS_HOST="wordpress"      \
    WORDPRESS_PASSWORD="wordpress"

# Set Labels
LABEL centos="wordpress"    \
      created_by="engineers"

