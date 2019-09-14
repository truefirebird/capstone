##FROM nginx

## Step 1:
##RUN rm /usr/share/nginx/html/index.html

## Step 2:
## Copy source code to working directory
##COPY index.html /usr/share/


FROM ubuntu:18.04
MAINTAINER Jack Black "jack.black@example.com"
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install net-tools nginx && \
    useradd -ms /bin/bash aurora && \
    rm -f /etc/nginx/fastcgi.conf /etc/nginx/fastcgi_params && \
    rm -f /etc/nginx/snippets/fastcgi-php.conf /etc/nginx/snippets/snakeoil.conf
EXPOSE 80
EXPOSE 443
COPY nginx/ssl /etc/nginx/ssl
COPY nginx/snippets /etc/nginx/snippets
COPY nginx/sites-available /etc/nginx/sites-available
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]

