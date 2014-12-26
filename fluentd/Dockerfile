FROM dockerfile/ubuntu

# Install ruby
RUN \
  apt-get update && \
  apt-get install -y dstat ruby ruby-dev make libcurl4-gnutls-dev && \
  rm -rf /var/lib/apt/lists/*

# install fluentd with plugins
RUN gem install fluentd --no-ri --no-rdoc \    
    && mkdir /etc/fluentd/ \
    && mkdir /var/log/fluentd/
RUN fluent-gem install fluent-plugin-dstat
RUN fluent-gem install fluent-plugin-elasticsearch  
RUN fluent-gem install fluent-plugin-map 

# setup the fluentd config files
ADD fluentd.conf /etc/fluentd/fluentd.conf

CMD ["/usr/local/bin/fluentd", "-c",  "/etc/fluentd/fluentd.conf"] 
