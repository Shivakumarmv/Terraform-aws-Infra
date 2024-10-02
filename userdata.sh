#!/bin/bash
sudo yum install -y httpd

systemctl start httpd
systemctl enable httpd

cd /var/www/html 

wget https://www.free-css.com/assets/files/free-css-templates/download/page296/neogym.zip

unzip neogym* 

mv neogym*/* .
