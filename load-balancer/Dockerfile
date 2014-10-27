FROM dockerfile/ubuntu

# Install Nginx and curl
RUN \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y nginx curl && \
  rm -rf /var/lib/apt/lists/*

# Install confd
RUN curl -L https://github.com/kelseyhightower/confd/releases/download/v0.6.2/confd-0.6.2-linux-amd64 -o /usr/local/bin/confd && \
  chmod +x /usr/local/bin/confd

# Copy confd files
RUN mkdir -p /etc/confd/templates && \
  mkdir -p /etc/confd/conf.d && \
  rm /etc/nginx/sites-enabled/default 
ADD nginx.toml /etc/confd/conf.d/nginx.toml
ADD nginx.tmpl /etc/confd/templates/nginx.tmpl
ADD confd-watch.sh /usr/local/bin/confd-watch
RUN chmod +x /usr/local/bin/confd-watch

EXPOSE 80
CMD ["/usr/local/bin/confd-watch"] 


