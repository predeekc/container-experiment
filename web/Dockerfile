FROM dockerfile/nodejs

RUN mkdir /var/www
ADD server.js /var/www/server.js
ADD package.json /var/www/package.json
RUN cd /var/www; npm install --production

EXPOSE 80
CMD ["node", "/var/www/server.js"] 