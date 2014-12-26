FROM dockerfile/ubuntu

# Install nginx
RUN \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y nginx && \
  rm -rf /var/lib/apt/lists/*

# Install Kibana
RUN \ 
    apt-get install -y wget && \
	wget https://download.elasticsearch.org/kibana/kibana/kibana-3.1.0.tar.gz -O /tmp/kibana.tar.gz && \
    tar zxf /tmp/kibana.tar.gz && mv kibana-3.1.0/* /var/www/html && \
    apt-get remove -y wget

ADD config.js /var/www/html/config.js.bak
ADD default.conf /etc/nginx/kibana.conf

RUN mv -f /var/www/html/config.js.bak /var/www/html/config.js

EXPOSE 80
CMD ["nginx", "-c", "/etc/nginx/kibana.conf"] 