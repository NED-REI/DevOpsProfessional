FROM httpd
LABEL author=ashwini
EXPOSE 85
COPY index.html /usr/local/apache2/htdocs/
